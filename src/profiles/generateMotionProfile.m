function traj = generateMotionProfile(type, duration, dt, amplitude, freq)
%GENERATEMOTIONPROFILE Generate a medical motion trajectory for the Stewart Platform.
%
%   Inputs:
%       type      - 'sine_wave', 'linear', 'step', or 'circular'
%       duration  - total trajectory time in seconds
%       dt        - sample time in seconds
%       amplitude - motion amplitude in mm (or radius for circular)
%       freq      - frequency in Hz (used for sine_wave and circular)
%
%   Output:
%       traj.time - 1xN row vector of sample times (seconds)
%       traj.pose - Nx6 matrix [x y z roll pitch yaw] in mm and degrees

    if nargin < 5
        freq = 1;
    end
    if dt <= 0 || duration <= 0
        error('generateMotionProfile:InvalidInput', 'duration and dt must be positive.');
    end

    t = 0:dt:duration;
    n = numel(t);
    pose = zeros(n, 6);

    switch lower(type)
        case 'sine_wave'
            pose(:, 3) = amplitude * sin(2 * pi * freq * t);   % z sinusoid

        case 'linear'
            pose(:, 1) = amplitude * (t / duration);             % x ramp

        case 'step'
            mid = floor(n / 2);
            pose(mid:end, 3) = amplitude;                     % z step at midpoint

        case 'circular'
            pose(:, 1) = amplitude * cos(2 * pi * freq * t);    % x circle
            pose(:, 2) = amplitude * sin(2 * pi * freq * t);  % y circle

        otherwise
            error('generateMotionProfile:UnknownType', 'Unknown profile type: %s', type);
    end

    traj.time = t;
    traj.pose = pose;
end
