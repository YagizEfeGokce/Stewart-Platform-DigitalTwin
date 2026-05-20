function rmse = computeRmse(desired, actual)
%COMPUTERMSE Compute per-axis and total RMSE for trajectory deviation.
%
%   Inputs:
%       desired - Nx6 matrix of desired poses
%       actual  - Nx6 matrix of actual poses
%
%   Output:
%       rmse.perAxis - 1x6 RMSE per axis [x y z roll pitch yaw]
%       rmse.total   - scalar overall Euclidean RMSE

    if ~isequal(size(desired), size(actual))
        error('computeRmse:DimensionMismatch', ...
            'desired and actual must have identical dimensions.');
    end

    diff = desired - actual;
    rmse.perAxis = sqrt(mean(diff.^2, 1));
    rmse.total   = sqrt(mean(sum(diff.^2, 2)));
end
