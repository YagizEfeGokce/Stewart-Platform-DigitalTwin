function pose = forwardKinematics(lengths, geom)
%FORWARDKINEMATICS Solve platform pose from 6 actuator lengths.
%   Uses fsolve (Levenberg-Marquardt) to minimize residual leg lengths.
%
%   Inputs:
%       lengths - 6x1 double of actuator lengths (mm)
%       geom    - geometry struct from platformGeometry()
%
%   Output:
%       pose    - 1x6 [x y z roll pitch yaw] in mm and degrees

    if numel(lengths) ~= 6
        error('forwardKinematics:InvalidInput', 'Length vector must have exactly 6 elements.');
    end
    lengths = lengths(:);

    options = optimoptions('fsolve', 'Algorithm', 'levenberg-marquardt', ...
                           'Display', 'off', 'FunctionTolerance', 1e-8);

    x0 = [0; 0; geom.homeHeight; 0; 0; 0];

    objective = @(x) residuals(x, lengths, geom);
    sol = fsolve(objective, x0, options);

    pose = sol';
    pose(4:6) = rad2deg(pose(4:6));
end

function res = residuals(x, lengths, geom)
    T = x(1:3);
    R = rpy2rotm(x(4:6));
    res = zeros(6, 1);
    for i = 1:6
        vec = T + R * geom.platformAnchors(i, :)' - geom.baseAnchors(i, :)';
        res(i) = norm(vec) - lengths(i);
    end
end
