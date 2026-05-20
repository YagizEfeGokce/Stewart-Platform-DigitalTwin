---
version: 1.0.0
last_updated: 2026-05-20
domain: business-logic
scope: root
---

# Business Logic Plan: Kinematics, Motion Profiles, Control

## Goal

Document the algorithmic and domain-rule implementation for the Stewart Platform digital twin.

## Task 1: Project Setup

### `scripts/setupProject.m`
- Adds all `src/` subdirectories to MATLAB path.
- Creates missing folders via `mkdir`.
- Idempotent: safe to call multiple times.

### `src/config/platformGeometry.m`
- Returns a struct with calibrated lab measurements.
- **Key values** (placeholder — replace with actual lab measurements):
  - `baseRadius`: 150.0 mm
  - `platformRadius`: 120.0 mm
  - `baseHalfAngle`: 10.0°
  - `platformHalfAngle`: 10.0°
  - `minLength`: 200.0 mm
  - `maxLength`: 300.0 mm
  - `homeHeight`: 250.0 mm
- `buildHexAnchors(R, halfAngle, sign)` helper distributes 6 anchors in a hexagonal pattern.
  - `sign = +1` for base, `-1` for platform (mirrors y-coordinates).
  - Alternating angles: `sector*60 ± halfAngle`.

## Task 2: Import SolidWorks CAD to Simscape

### `src/modeling/importCad.m`
- Imports `extracted/Stewart Platform.STEP` via `smimport`.
- Saves imported model as `models/imported_Stewart_Platform.slx`.
- **Manual step required**: Open the imported model and edit Body blocks to enter mass/inertia values from SolidWorks. This is a GUI step not captured by scripts.

## Task 3: Inverse Kinematics

### `src/kinematics/rpy2rotm.m`
- Converts intrinsic roll-pitch-yaw (X-Y-Z) to 3×3 rotation matrix.
- Input: `[roll, pitch, yaw]` in radians.

### `src/kinematics/inverseKinematics.m`
- Converts platform pose → 6 actuator lengths.
- Algorithm:
  1. Extract translation `T = pose(1:3)'`
  2. Build rotation matrix `R = rpy2rotm(deg2rad(pose(4:6)))`
  3. For each leg `i`: `vec = T + R * plat(i,:)' - base(i,:)'`
  4. `lengths(i) = norm(vec)`
- Complexity: O(1) per call (6 iterations, negligible).

## Task 4: Forward Kinematics

### `src/kinematics/forwardKinematics.m`
- Solves platform pose from actuator lengths using `fsolve`.
- Initial guess: home pose `[0; 0; homeHeight; 0; 0; 0]`.
- Algorithm: Levenberg-Marquardt, minimizing residuals `(norm(vec) - lengths(i))` for all 6 legs.
- Returns pose in mm/deg.
- Used for validation (round-trip IK→FK) only; not required for real-time control.

## Task 5: Motion Profile Generator

### `src/profiles/generateMotionProfile.m`
- Generates medical motion trajectories for testing.
- Supported types:
  - `'sine_wave'`: z-axis sinusoid, `amplitude * sin(2π·freq·t)`
  - `'linear'`: x-axis ramp, `amplitude * (t / duration)`
  - `'step'`: z-axis step at midpoint
  - `'circular'`: xy-plane circle, `amplitude * cos(2π·freq·t)`, `amplitude * sin(2π·freq·t)`
- Output struct:
  - `traj.time`: row vector `0:dt:duration`
  - `traj.pose`: N×6 matrix `[x y z roll pitch yaw]`

## Task 6: Augment Simscape Model

### `src/modeling/findPrismaticJoints.m`
- Discovers all `PrismaticJoint` blocks in a model using `find_system`.

### `src/modeling/addActuators.m`
- Adds `Translational Actuator` blocks to each discovered prismatic joint.
- Warns if count ≠ 6.
- Positions blocks vertically spaced inside joint subsystem.

### `scripts/buildDigitalTwin.m`
- Orchestration script:
  1. Loads imported model
  2. Saves copy as `StewartPlatform_Twin.slx`
  3. Finds prismatic joints and adds actuators
  4. Adds 6 top-level input ports (`LengthInput1`…`6`)
  5. Adds `Transform Sensor` and top-level output port (`PoseOutput`)
  6. Saves augmented model

## Task 7: Control Layer & Sync Bridge

### `src/control/motionController.m`
- Proportional feedback controller.
- Algorithm:
  1. `errorPose = targetPose - currentPose`
  2. `correctedPose = targetPose + Kp .* errorPose`
  3. Clamp z to `[minLength, maxLength]`
  4. `controlSignals = inverseKinematics(correctedPose, geom)`
- Default `Kp = 0.5` for all axes.

### `src/communication/syncBridge.m`
- UDP socket wrapper.
- `'tx'` mode: serializes 6×1 double vector to 48-byte datagram.
- `'rx'` mode: reads datagram, deserializes to 6×1 double.
- Persistent `udpport` handle to avoid socket churn.
- **Note**: `rand(6,1)` in `'tx'` is illustrative wiring; production use replaces with `motionController` output.

## Task 8: Logging & RMSE Analysis

### `src/analysis/dataLogger.m`
- Returns an empty logger struct.
- `logSample` appends one timestep.
- Fields: `time`, `desiredPose`, `actualPose`, `actuatorLengths`.

### `src/analysis/computeRmse.m`
- Computes per-axis and total RMSE.
- Formulas:
  - `rmse.perAxis = sqrt(mean((desired - actual).^2, 1))`
  - `rmse.total = sqrt(mean(sum((desired - actual).^2, 2)))`
- Accepts N×6 matrices.

## Task 9: Integration Test & Verification

### `tests/integration/testFullPipeline.m`
- `testIkProfileToLengths`: generates sine profile, computes IK for all poses, verifies no NaN and all lengths within `[minLength, maxLength]`.
- `testRmseOnZeroError`: generates linear profile, computes RMSE against self, verifies total RMSE = 0.

### `scripts/runVerification.m`
- Full pipeline script:
  1. Generate 2-second sine wave profile (amplitude 10 mm, 1 Hz)
  2. Compute desired actuator lengths via IK
  3. Simulate actual pose with small Gaussian noise (placeholder for real Simscape output)
  4. Compute and print RMSE
  5. Save results to `data/verification_results.mat`

## Domain Invariants

- **Pose convention**: `[x, y, z, roll, pitch, yaw]` in mm and degrees everywhere.
- **Length convention**: 6×1 double in mm.
- **Workspace limits**: All IK outputs must satisfy `minLength ≤ length ≤ maxLength`. Violations indicate unreachable poses.
- **Synchronization latency target**: < 50 ms (enforced at system integration level, not in business logic).
- **Positioning accuracy target**: ≤ 0.1 mm RMSE (validated in `testing.md`).
