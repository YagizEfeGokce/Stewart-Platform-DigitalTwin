---
version: 1.0.0
last_updated: 2026-05-20
domain: data-model
scope: root
---

# Data Model Plan: Geometry, Trajectories, RMSE Results

## Goal

Define all data structures and formats used across the system.

## Geometry Struct (`src/config/platformGeometry.m`)

Returned by `platformGeometry()`:

| Field | Type | Unit | Description |
|---|---|---|---|
| `baseRadius` | double | mm | Radius of base platform anchor circle |
| `platformRadius` | double | mm | Radius of moving platform anchor circle |
| `baseHalfAngle` | double | degrees | Half-angle offset for base anchor distribution |
| `platformHalfAngle` | double | degrees | Half-angle offset for platform anchor distribution |
| `minLength` | double | mm | Minimum actuator leg length |
| `maxLength` | double | mm | Maximum actuator leg length |
| `homeHeight` | double | mm | Z-height at neutral/home pose |
| `baseAnchors` | 6×3 double | mm | Base anchor coordinates [x y z] |
| `platformAnchors` | 6×3 double | mm | Platform anchor coordinates [x y z] |

### Anchor Coordinate System
- Origin at base center.
- Z-axis points upward (toward platform).
- Base anchors lie in the z=0 plane.
- Platform anchors are defined in the platform's local frame (z=0 local).

### Anchor Distribution
Hexagonal pattern with alternating angles:
- Odd-index legs: `sector*60 - halfAngle`
- Even-index legs: `sector*60 + halfAngle`
- Platform y-coordinates are mirrored (`sign = -1`).

## Trajectory Struct (`src/profiles/generateMotionProfile.m`)

Returned by `generateMotionProfile(...)`:

| Field | Type | Unit | Description |
|---|---|---|---|
| `time` | 1×N double | seconds | Sample times |
| `pose` | N×6 double | mm, degrees | Platform poses `[x y z roll pitch yaw]` |

### Profile Types
- `sine_wave`: z-axis sinusoidal motion.
- `linear`: x-axis ramp from 0 to amplitude.
- `step`: z-axis step of height `amplitude` at midpoint.
- `circular`: xy-plane circle of radius `amplitude`.

## RMSE Result Struct (`src/analysis/computeRmse.m`)

Returned by `computeRmse(desired, actual)`:

| Field | Type | Unit | Description |
|---|---|---|---|
| `perAxis` | 1×6 double | mm or degrees | RMSE per axis [x y z roll pitch yaw] |
| `total` | double | combined | Overall RMSE across all axes |

### Total RMSE Formula
```
total = sqrt(mean(sum((desired - actual).^2, 2)))
```
This is the Euclidean distance RMSE across the 6-DOF state.

## Logger Struct (`src/analysis/dataLogger.m`)

Returned by `dataLogger()` and mutated by `logSample(...)`:

| Field | Type | Description |
|---|---|---|
| `time` | M×1 double | Timestamps |
| `desiredPose` | M×6 double | Target poses at each timestep |
| `actualPose` | M×6 double | Measured/actual poses |
| `actuatorLengths` | M×6 double | Actuator length commands |

## Data Persistence

- **MAT files**: `data/verification_results.mat` stores RMSE results, trajectories, and length commands.
- **Simscape models**: `models/StewartPlatform_Twin.slx` is the primary simulation artifact.
- **CSV/Excel**: Not used in current design. If needed for external analysis, add a converter in `src/analysis/`.

## Validation Rules

- `lengths` must be 6×1 (or N×6 in batch).
- `pose` must be 1×6 or N×6.
- All IK outputs must satisfy `minLength ≤ length ≤ maxLength`.
- `traj.time` must be monotonically increasing.
- `desired` and `actual` matrices passed to `computeRmse` must have identical dimensions.
