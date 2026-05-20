function setupProject()
%SETUPPROJECT Add source directories to MATLAB path and create missing folders.
%   Call this once per MATLAB session. Safe to run multiple times (idempotent).

    scriptDir = fileparts(mfilename('fullpath'));
    rootDir   = fullfile(scriptDir, '..');

    folders = {
        fullfile(rootDir, 'src', 'config')
        fullfile(rootDir, 'src', 'kinematics')
        fullfile(rootDir, 'src', 'profiles')
        fullfile(rootDir, 'src', 'modeling')
        fullfile(rootDir, 'src', 'control')
        fullfile(rootDir, 'src', 'communication')
        fullfile(rootDir, 'src', 'analysis')
        fullfile(rootDir, 'tests', 'kinematics')
        fullfile(rootDir, 'tests', 'profiles')
        fullfile(rootDir, 'tests', 'analysis')
        fullfile(rootDir, 'tests', 'integration')
        fullfile(rootDir, 'scripts')
        fullfile(rootDir, 'models')
        fullfile(rootDir, 'data')
    };

    for i = 1:numel(folders)
        folder = folders{i};
        if ~isfolder(folder)
            mkdir(folder);
            fprintf('Created folder: %s\n', folder);
        end
        addpath(folder);
    end

    fprintf('Project paths added. Root: %s\n', rootDir);
end
