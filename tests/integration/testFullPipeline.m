function tests = testFullPipeline()
%TESTFULLPIPELINE Integration tests for the IK → profile → lengths pipeline.
    tests = functiontests(localfunctions);
end

function testIkProfileToLengths(testCase)
    geom = platformGeometry();
    traj = generateMotionProfile('sine_wave', 2.0, 0.01, 10.0, 1.0);

    lengths = inverseKinematics(traj.pose, geom);

    testCase.verifyFalse(any(isnan(lengths), 'all'), ...
        'IK produced NaN values for a valid sine profile.');
    testCase.verifyGreaterThanOrEqual(lengths, geom.minLength - 1e-6, ...
        'Some actuator lengths below minimum workspace bound.');
    testCase.verifyLessThanOrEqual(lengths, geom.maxLength + 1e-6, ...
        'Some actuator lengths above maximum workspace bound.');
end

function testRmseOnZeroError(testCase)
    traj = generateMotionProfile('linear', 2.0, 0.01, 5.0);
    rmse = computeRmse(traj.pose, traj.pose);

    testCase.verifyEqual(rmse.total, 0, 'AbsTol', 1e-12, ...
        'Total RMSE on identical trajectories should be zero.');
    testCase.verifyEqual(rmse.perAxis, zeros(1, 6), 'AbsTol', 1e-12, ...
        'Per-axis RMSE on identical trajectories should be zero.');
end
