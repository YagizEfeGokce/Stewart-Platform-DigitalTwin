function lengths = motionController(targetPose, currentPose, geom, Kp)
%MOTIONCONTROLLER Proportional feedback controller for Stewart Platform.
%
%   Inputs:
%       targetPose  - 1x6 [x y z roll pitch yaw] in mm and degrees
%       currentPose - 1x6 [x y z roll pitch yaw] in mm and degrees
%       geom        - geometry struct from platformGeometry()
%       Kp          - 1x6 proportional gains (default 0.5 for all axes)
%
%   Output:
%       lengths     - 6x1 actuator length commands (mm)

    if nargin < 4 || isempty(Kp)
        Kp = 0.5 * ones(1, 6);
    end

    errorPose    = targetPose - currentPose;
    correctedPose= targetPose + Kp .* errorPose;

    % Clamp z to workspace bounds
    correctedPose(3) = max(geom.minLength, min(geom.maxLength, correctedPose(3)));

    lengths = inverseKinematics(correctedPose, geom);
    lengths = lengths(:);
end
