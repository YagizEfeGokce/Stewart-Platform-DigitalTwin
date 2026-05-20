function addActuators(modelName, joints)
%ADDACTUATORS Add Translational Actuator blocks to each prismatic joint.
%   Inputs:
%       modelName - name of loaded Simulink model
%       joints    - cell array of PrismaticJoint block paths from findPrismaticJoints
%
%   Behavior:
%       Adds a Translational Actuator inside each joint subsystem.
%       Warns if count ~= 6.

    if numel(joints) ~= 6
        warning('addActuators:JointCount', ...
            'Expected 6 prismatic joints, found %d.', numel(joints));
    end

    for i = 1:numel(joints)
        jointPath = joints{i};
        subsys = get_param(jointPath, 'Parent');

        % Add Translational Actuator inside the joint subsystem
        actName = sprintf('Translational_Actuator_%d', i);
        actPath = fullfile(subsys, actName);
        add_block('nesl_utility/Translational Actuator', actPath, ...
                  'Position', [100, 100 + (i-1)*60, 200, 140 + (i-1)*60]);

        fprintf('Added actuator %d to %s\n', i, jointPath);
    end
end
