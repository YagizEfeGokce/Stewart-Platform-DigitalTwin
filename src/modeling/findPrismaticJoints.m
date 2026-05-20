function joints = findPrismaticJoints(modelName)
%FINDPRISMATICJOINTS Discover all PrismaticJoint blocks in a Simscape model.
%   Input:
%       modelName - name of loaded Simulink model (string)
%   Output:
%       joints    - cell array of full block paths to PrismaticJoint blocks

    if ~bdIsLoaded(modelName)
        error('findPrismaticJoints:ModelNotLoaded', 'Model %s is not loaded.', modelName);
    end

    joints = find_system(modelName, 'BlockType', 'SimscapeMultibodyJointsPrismatic');

    if isempty(joints)
        warning('findPrismaticJoints:NoneFound', 'No PrismaticJoint blocks found in %s.', modelName);
    else
        fprintf('Found %d PrismaticJoint block(s) in %s.\n', numel(joints), modelName);
    end
end
