function logger = logSample(logger, t, desired, actual, lengths)
%LOGSAMPLE Append one timestep to the logger.
%   Inputs:
%       logger  - logger struct from dataLogger()
%       t       - scalar time (seconds)
%       desired - 1x6 target pose [x y z roll pitch yaw]
%       actual  - 1x6 actual pose [x y z roll pitch yaw]
%       lengths - 1x6 actuator lengths (mm)

    logger.time            = [logger.time;            t];
    logger.desiredPose     = [logger.desiredPose;     desired(:)'];
    logger.actualPose      = [logger.actualPose;      actual(:)'];
    logger.actuatorLengths = [logger.actuatorLengths; lengths(:)'];
end
