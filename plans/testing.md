---
version: 1.0.0
last_updated: 2026-05-20
domain: testing
scope: root
---

# Testing Plan: MATLAB Unit Test Strategy

## Goal

Define the test pyramid, coverage targets, and acceptance criteria for the digital twin.

## Test Pyramid

```
        ┌─────────────┐
        │  E2E /      │  testFullPipeline.m
        │  Integration  │
        ├─────────────┤
        │  Module /   │  testInverseKinematics.m
        │  Unit       │  testForwardKinematics.m
        │             │  testMotionProfile.m
        │             │  testComputeRmse.m
        ├─────────────┤
        │  Setup /    │  testSetup.m
        │  Smoke      │
        └─────────────┘
```

## Smoke Tests

### `tests/testSetup.m`
- `testPathsAdded`: verifies `setupProject()` adds `src/config` to MATLAB path.
- `testGeometryStruct`: verifies `platformGeometry()` returns 6×3 anchors and `homeHeight = 250.0`.

## Unit Tests

### `tests/kinematics/testInverseKinematics.m`
- `testHomePosition`: at `[0, 0, homeHeight, 0, 0, 0]`, all 6 actuator lengths must be equal (within `1e-6`).
- `testPureTranslation`: moving from pose1 to pose2 must change at least one length.
- `testBoundsCheck`: home pose lengths must be within `[minLength, maxLength]`.

### `tests/kinematics/testForwardKinematics.m`
- `testIkFkRoundTrip`: given a pose, compute lengths via IK, then recover pose via FK. Must match original within `1e-3` mm/deg.

### `tests/profiles/testMotionProfile.m`
- `testSineWaveShape`: 2-second profile at dt=0.01 must have 201 samples; peak z must equal amplitude.
- `testLinearRamp`: 1-second ramp at dt=0.1 must end at x = amplitude.

### `tests/analysis/testComputeRmse.m`
- `testZeroError`: identical matrices → total RMSE = 0, per-axis RMSE = zeros.
- `testKnownDeviation`: `desired = zeros(5,6)`, `actual = ones(5,6)` → total RMSE = `sqrt(6)`.

## Integration Tests

### `tests/integration/testFullPipeline.m`
- `testIkProfileToLengths`: generate sine profile, batch-compute IK, verify no NaN and all lengths in bounds.
- `testRmseOnZeroError`: generate linear profile, compute RMSE against self, verify total = 0.

## Acceptance Criteria

| Criterion | Target | Test |
|---|---|---|
| Positioning accuracy | ≤ 0.1 mm RMSE | `runVerification.m` + manual Simscape comparison |
| Synchronization latency | < 50 ms | Manual measurement with oscilloscope/timing script |
| IK correctness | Round-trip error ≤ 1e-3 | `testIkFkRoundTrip` |
| Workspace feasibility | All home lengths in bounds | `testBoundsCheck` |
| Motion profile validity | Monotonic time, bounded pose | `testSineWaveShape`, `testLinearRamp` |

## Coverage Targets

- **Kinematics**: 100% of exported functions (IK, FK, rpy2rotm).
- **Profiles**: 100% of profile types (sine, linear, step, circular).
- **Analysis**: 100% of RMSE computation paths.
- **Modeling**: Manual GUI validation (not unit-testable).
- **Control**: Manual integration validation (requires Simscape model).
- **Communication**: Manual UDP loopback test (requires hardware or second MATLAB instance).

## Running Tests

```matlab
setupProject();
runtests('tests');
```

Expected output: all smoke, unit, and integration tests pass.

## Fixtures

- `platformGeometry()` is the canonical fixture for all geometry-dependent tests.
- `generateMotionProfile('sine_wave', 1, 0.05, 5, 2)` is a standard trajectory fixture.
- No file-based fixtures required at this stage.

## Known Limitations

- `smimport` and Simscape model augmentation require GUI interaction; these are validated manually, not via `matlab.unittest`.
- UDP sync bridge testing requires a network peer; mock UDP sockets are not implemented.
- `fsolve` in forward kinematics may fail for poses near singularities; tests use well-conditioned home poses.
