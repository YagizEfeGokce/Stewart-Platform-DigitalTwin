function R = rpy2rotm(rpy)
%RPY2ROTM Convert intrinsic roll-pitch-yaw (X-Y-Z) angles to rotation matrix.
%   Input:  rpy = [roll, pitch, yaw] in radians
%   Output: R   = 3x3 rotation matrix

    roll  = rpy(1);
    pitch = rpy(2);
    yaw   = rpy(3);

    Rx = [1 0 0; 0 cos(roll) -sin(roll); 0 sin(roll) cos(roll)];
    Ry = [cos(pitch) 0 sin(pitch); 0 1 0; -sin(pitch) 0 cos(pitch)];
    Rz = [cos(yaw) -sin(yaw) 0; sin(yaw) cos(yaw) 0; 0 0 1];

    R = Rx * Ry * Rz;
end
