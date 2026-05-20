---
version: 1.0.0
last_updated: 2026-05-20
domain: api
scope: root
---

# API Plan: Interface Contracts

## Goal

Define all external and internal interfaces: UDP sync bridge, Simscape model I/O, and control function signatures.

## UDP Sync Bridge (`src/communication/syncBridge.m`)

### Datagram Format
- **Payload**: 6×1 double vector (actuator lengths in mm) cast to `uint8` via `typecast(swapbytes(double(data)), 'uint8')`
- **Size**: 48 bytes (6 × 8 bytes per double)
- **Endianness**: Network byte order (swapbytes)

### Modes
- `'init'` — Create persistent `udpport`. Args: `host`, `port`. Returns handle.
- `'tx'` — Transmit 6×1 double vector. Args: `udpHandle`, `lengths`. Returns `[]`.
- `'rx'` — Receive 6×1 double vector. Args: `udpHandle`. Returns `lengths`.
- `'close'` — Close and delete handle. Args: `udpHandle`. Returns `[]`.

### Signature
```matlab
function data = syncBridge(mode, varargin)
```

### Persistent Socket
- Handle is returned to caller on `'init'` and passed back for `'tx'`/`'rx'`/`'close'`.
- Socket type: `udpport('datagram', 'IPAddr', host, 'RemotePort', port)`.

### Error Handling
- Unknown `mode` throws `error('Unknown mode: %s', mode)`.

## Simscape Model I/O

### Inputs (Top-Level Inports)
- 6 input ports named `LengthInput1` … `LengthInput6`
- Type: Simulink `In1` blocks
- Values: actuator lengths in mm

### Outputs (Top-Level Outports)
- `PoseOutput`: 6-DOF pose [x, y, z, roll, pitch, yaw] from Transform Sensor
- Type: Simulink `Out1` block

### Internal Blocks
- `Transform Sensor` (`sm_lib/Utilities/Transform Sensor`): measures platform pose
- 6 `Translational Actuator` blocks (`nesl_utility/Translational Actuator`): drive prismatic joints

## Control Interface (`src/control/motionController.m`)

### Signature
```matlab
function controlSignals = motionController(targetPose, currentPose, geom, Kp)
```

### Parameters
- `targetPose`: [x, y, z, roll, pitch, yaw] desired (mm, degrees)
- `currentPose`: [x, y, z, roll, pitch, yaw] measured/estimated (mm, degrees)
- `geom`: geometry struct from `platformGeometry()`
- `Kp`: proportional gain vector (6×1), default `ones(6,1) * 0.5`

### Returns
- `controlSignals`: 6×1 actuator lengths from `inverseKinematics()`

### Behavior
1. Computes `errorPose = targetPose - currentPose`
2. Applies P-control: `correctedPose = targetPose + Kp .* errorPose`
3. Clamps z-height to `[geom.minLength, geom.maxLength]` (placeholder for full workspace constraints)
4. Calls `inverseKinematics(correctedPose, geom)`

## Kinematics Interface (`src/kinematics/inverseKinematics.m`)

### Signature
```matlab
function lengths = inverseKinematics(pose, geom)
```
- `pose`: [x, y, z, roll, pitch, yaw] in mm and degrees
- `geom`: geometry struct
- Returns: 6×1 double vector of actuator lengths

## Forward Kinematics Interface (`src/kinematics/forwardKinematics.m`)

### Signature
```matlab
function pose = forwardKinematics(lengths, geom)
```
- `lengths`: 6×1 double vector
- `geom`: geometry struct
- Returns: [x, y, z, roll, pitch, yaw] in mm and degrees
- Uses `fsolve` with Levenberg-Marquardt algorithm

## Motion Profile Interface (`src/profiles/generateMotionProfile.m`)

### Signature
```matlab
function traj = generateMotionProfile(type, duration, dt, amplitude, freq)
```
- `type`: `'sine_wave'` | `'linear'` | `'step'` | `'circular'`
- `duration`: total time in seconds
- `dt`: sampling interval in seconds
- `amplitude`: peak displacement (mm or degrees)
- `freq`: frequency in Hz (for sine types)
- Returns struct with `traj.time` (vector) and `traj.pose` (N×6 matrix)

## Data Logger Interface (`src/analysis/dataLogger.m`)

### Signature
```matlab
function logger = dataLogger()
function logger = logSample(logger, t, desired, actual, lengths)
```
- `logger`: struct with fields `time`, `desiredPose`, `actualPose`, `actuatorLengths`
- All fields grow dynamically (MATLAB `end+1` indexing)

## RMSE Interface (`src/analysis/computeRmse.m`)

### Signature
```matlab
function rmse = computeRmse(desired, actual)
```
- `desired`, `actual`: N×6 matrices
- Returns struct with `rmse.perAxis` (1×6) and `rmse.total` (scalar)

## Type Consistency Rules

- `pose` is always `[x y z roll pitch yaw]` in mm/deg.
- `lengths` is always 6×1 (or N×6 in batch).
- `geom` is always the struct returned by `platformGeometry()`.
- `traj.time` is a row vector; `traj.pose` is N×6.
