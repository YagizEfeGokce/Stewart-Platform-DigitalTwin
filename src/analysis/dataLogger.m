function logger = dataLogger()
%DATALOGGER Return an empty logger struct for simulation telemetry.
%   Fields:
%       time            - Mx1 double of timestamps
%       desiredPose     - Mx6 double of target poses
%       actualPose      - Mx6 double of measured/actual poses
%       actuatorLengths - Mx6 double of commanded actuator lengths

    logger = struct();
    logger.time            = [];
    logger.desiredPose     = [];
    logger.actualPose      = [];
    logger.actuatorLengths = [];
end
