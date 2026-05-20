function runVerification()
%RUNVERIFICATION Full pipeline verification script.
%   Generates a sine profile, computes IK, adds noise placeholder,
%   computes RMSE, and saves results.

    geom = platformGeometry();

    % Step 1: Generate 2-second sine wave (amplitude 10 mm, 1 Hz)
    traj = generateMotionProfile('sine_wave', 2.0, 0.01, 10.0, 1.0);

    % Step 2: Desired actuator lengths via IK
    desiredLengths = inverseKinematics(traj.pose, geom);

    % Step 3: Placeholder actual pose (small Gaussian noise)
    noise = 0.05 * randn(size(traj.pose));
    actualPose = traj.pose + noise;

    % Step 4: Compute RMSE
    rmse = computeRmse(traj.pose, actualPose);

    fprintf('--- Verification Results ---\n');
    fprintf('Trajectory: sine wave, 2 s, 10 mm amp, 1 Hz\n');
    fprintf('Samples:    %d\n', numel(traj.time));
    fprintf('RMSE per axis [x y z roll pitch yaw]:\n');
    fprintf('  %.4f  %.4f  %.4f  %.4f  %.4f  %.4f\n', rmse.perAxis);
    fprintf('Total RMSE: %.4f\n', rmse.total);

    % Step 5: Save results
    scriptDir = fileparts(mfilename('fullpath'));
    rootDir   = fullfile(scriptDir, '..');
    savePath  = fullfile(rootDir, 'data', 'verification_results.mat');

    save(savePath, 'traj', 'desiredLengths', 'actualPose', 'rmse');
    fprintf('Results saved to: %s\n', savePath);
end
