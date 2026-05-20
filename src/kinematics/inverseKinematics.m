function lengths = inverseKinematics(pose, geom)
%INVERSEKINEMATICS Convert platform pose to 6 actuator lengths.
%   pose  - 1x6 or Nx6 matrix [x y z roll pitch yaw] in mm and degrees
%   geom  - geometry struct from platformGeometry()
%
%   Returns:
%       lengths - 6x1 double (mm) for single pose
%                 Nx6 double (mm) for trajectory poses

    if isrow(pose)
        pose = pose(:)';
    end
    nPoses = size(pose, 1);
    lengths = zeros(nPoses, 6);

    R_pl = rpy2rotm(deg2rad(pose(:, 4:6)));
    T    = pose(:, 1:3);

    for i = 1:6
        vec = T + pagemtimes(reshape(R_pl, 3, 3, nPoses), reshape(geom.platformAnchors(i, :)', 3, 1, 1)) ...
              - geom.baseAnchors(i, :)';
        lengths(:, i) = sqrt(sum(vec.^2, 2));
    end

    % Workspace validation
    if any(lengths < geom.minLength - 1e-6, 'all') || any(lengths > geom.maxLength + 1e-6, 'all')
        warning('inverseKinematics:OutOfWorkspace', ...
            'Computed lengths exceed workspace bounds [%.3f, %.3f].', geom.minLength, geom.maxLength);
    end
end
