function geom = platformGeometry()
%PLATFORMGEOMETRY Return calibrated Stewart Platform geometry struct.
%   All dimensions in mm and degrees. Anchors are computed from radius
%   and half-angle parameters using a hexagonal distribution.
%
%   Fields:
%       baseRadius        - Radius of base anchor circle (mm)
%       platformRadius    - Radius of moving platform anchor circle (mm)
%       baseHalfAngle     - Half-angle offset for base anchors (deg)
%       platformHalfAngle - Half-angle offset for platform anchors (deg)
%       minLength         - Minimum actuator leg length (mm)
%       maxLength         - Maximum actuator leg length (mm)
%       homeHeight        - Z-height at neutral/home pose (mm)
%       baseAnchors       - 6x3 base anchor coordinates [x y z] (mm)
%       platformAnchors   - 6x3 platform anchor coordinates [x y z] (mm)

    geom = struct();
    geom.baseRadius        = 150.0;
    geom.platformRadius    = 120.0;
    geom.baseHalfAngle     = 10.0;
    geom.platformHalfAngle = 10.0;
    geom.minLength         = 200.0;
    geom.maxLength         = 300.0;
    geom.homeHeight        = 250.0;

    geom.baseAnchors    = buildHexAnchors(geom.baseRadius,    geom.baseHalfAngle,    +1);
    geom.platformAnchors= buildHexAnchors(geom.platformRadius, geom.platformHalfAngle, -1);
end

function anchors = buildHexAnchors(R, halfAngle, sign)
%BUILDHEXANCHORS Compute 6 anchor points in a hexagonal ring.
%   R          - circle radius (mm)
%   halfAngle  - angular offset applied alternating per leg (deg)
%   sign       - +1 for base (normal y), -1 for platform (mirrored y)
%
%   Returns 6x3 matrix of [x y z] coordinates.

    anchors = zeros(6, 3);
    for i = 1:6
        sector = i - 1;                 % 0 .. 5
        if mod(i, 2) == 1
            angle = sector * 60 - halfAngle;
        else
            angle = sector * 60 + halfAngle;
        end
        angleRad = deg2rad(angle);
        anchors(i, 1) =  R * cos(angleRad);
        anchors(i, 2) =  sign * R * sin(angleRad);
        anchors(i, 3) =  0.0;
    end
end
