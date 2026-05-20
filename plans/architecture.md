---
version: 1.0.0
last_updated: 2026-05-20
domain: architecture
scope: root
---

# Architecture Plan: Stewart Platform Digital Twin

## Goal

Define the system components, data flow, and file structure for the MATLAB/Simscape digital twin.

## System Layers

```
┌─────────────────────────────────────────┐
│  Analysis Layer                         │
│  dataLogger.m, computeRmse.m            │
├─────────────────────────────────────────┤
│  Control & Communication Layer          │
│  motionController.m, syncBridge.m       │
├─────────────────────────────────────────┤
│  Simulation Layer (Simscape Multibody)  │
│  StewartPlatform_Twin.slx               │
│  ├─ 6x Prismatic Joints + Actuators   │
│  ├─ Platform Body (mass, inertia)       │
│  └─ Transform Sensor (pose output)      │
├─────────────────────────────────────────┤
│  Kinematics Layer                       │
│  inverseKinematics.m, forwardKinematics │
├─────────────────────────────────────────┤
│  Configuration Layer                    │
│  platformGeometry.m                     │
└─────────────────────────────────────────┘
```

## Data Flow

1. **Target pose** (medical motion profile) → `generateMotionProfile.m`
2. **IK solver** → `inverseKinematics.m` converts pose → 6 actuator lengths
3. **Sync bridge** → `syncBridge.m` sends lengths to Simscape/physical hardware
4. **Simscape model** → `StewartPlatform_Twin.slx` executes multibody dynamics
5. **Sensor feedback** → Transform Sensor returns actual pose
6. **Logger** → `dataLogger.m` captures time-series
7. **RMSE** → `computeRmse.m` compares desired vs actual

## Tech Stack

- MATLAB R2023b+
- Simscape Multibody
- Control System Toolbox
- MATLAB Unit Test Framework

## File Structure

```
DigitalTwin/
├── models/
│   └── StewartPlatform_Twin.slx
├── src/
│   ├── config/
│   │   └── platformGeometry.m
│   ├── kinematics/
│   │   ├── inverseKinematics.m
│   │   ├── forwardKinematics.m
│   │   └── rpy2rotm.m
│   ├── profiles/
│   │   └── generateMotionProfile.m
│   ├── modeling/
│   │   ├── importCad.m
│   │   ├── findPrismaticJoints.m
│   │   └── addActuators.m
│   ├── control/
│   │   └── motionController.m
│   ├── communication/
│   │   └── syncBridge.m
│   └── analysis/
│       ├── dataLogger.m
│       └── computeRmse.m
├── tests/
│   ├── testSetup.m
│   ├── kinematics/
│   │   ├── testInverseKinematics.m
│   │   └── testForwardKinematics.m
│   ├── profiles/
│   │   └── testMotionProfile.m
│   ├── analysis/
│   │   └── testComputeRmse.m
│   └── integration/
│       └── testFullPipeline.m
├── scripts/
│   ├── setupProject.m
│   └── buildDigitalTwin.m
└── data/
    └── .gitkeep
```

## Component Responsibilities

- `platformGeometry.m` — Single source of truth for physical dimensions calibrated from lab measurements.
- `inverseKinematics.m` — Converts [x, y, z, roll, pitch, yaw] → 6 actuator lengths. No side effects.
- `forwardKinematics.m` — Numerical solver (fsolve) for actuator lengths → pose. Used for validation only.
- `generateMotionProfile.m` — Generates time-series trajectories for medical motion scenarios.
- `importCad.m` — STEP import via `smimport`. Creates base Simscape model.
- `buildDigitalTwin.m` — Orchestrates model augmentation: actuators, sensors, I/O ports.
- `motionController.m` — P-control wrapper around IK with workspace clamping.
- `syncBridge.m` — UDP socket management for real-time sync. Persistent socket handle.
- `dataLogger.m` — Struct-based accumulation of simulation telemetry.
- `computeRmse.m` — Per-axis and total RMSE for trajectory deviation.

## Cross-Domain Dependencies

- `business-logic.md` — Algorithmic details of IK, FK, motion profiles, control
- `api.md` — Interface contracts for sync bridge and Simscape I/O
- `data-model.md` — Geometry struct and trajectory format definitions
- `testing.md` — Test strategy for each layer

## Manual GUI Steps (Not Automated)

After `importCad.m`, the user must manually open the imported model and edit Body blocks to enter mass/inertia values exported from SolidWorks. This is noted in `business-logic.md` Task 2.
