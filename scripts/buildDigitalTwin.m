function buildDigitalTwin()
%BUILDDIGITALTWIN Orchestrate model augmentation for the digital twin.
%   1. Load imported model
%   2. Save copy as StewartPlatform_Twin.slx
%   3. Find prismatic joints and add actuators
%   4. Add 6 top-level input ports (LengthInput1...LengthInput6)
%   5. Add Transform Sensor and top-level output port (PoseOutput)
%   6. Save augmented model

    rootDir = fileparts(fileparts(mfilename('fullpath')));
    modelDir = fullfile(rootDir, 'models');
    importedPath = fullfile(modelDir, 'imported_Stewart_Platform.slx');
    twinName = 'StewartPlatform_Twin';

    if ~isfile(importedPath)
        error('buildDigitalTwin:ModelNotFound', ...
            'Imported model not found: %s. Run importCad() first.', importedPath);
    end

    % Load and save copy
    load_system(importedPath);
    save_system('imported_Stewart_Platform', fullfile(modelDir, [twinName '.slx']));
    close_system('imported_Stewart_Platform', 0);
    load_system(fullfile(modelDir, [twinName '.slx']));

    % Find prismatic joints and add actuators
    joints = findPrismaticJoints(twinName);
    if ~isempty(joints)
        addActuators(twinName, joints);
    end

    % Add top-level input ports
    for i = 1:6
        portName = sprintf('LengthInput%d', i);
        portPath = fullfile(twinName, portName);
        if ~strcmp(get_param(portPath, 'Type'), 'block')
            add_block('simulink/Sources/In1', portPath, ...
                      'Position', [50, 50 + (i-1)*60, 80, 80 + (i-1)*60]);
        end
    end

    % Add Transform Sensor and output port
    sensorPath = fullfile(twinName, 'Transform_Sensor');
    if ~strcmp(get_param(sensorPath, 'Type'), 'block')
        add_block('sm_lib/Utilities/Transform Sensor', sensorPath, ...
                  'Position', [400, 100, 500, 200]);
    end

    outputPath = fullfile(twinName, 'PoseOutput');
    if ~strcmp(get_param(outputPath, 'Type'), 'block')
        add_block('simulink/Sinks/Out1', outputPath, ...
                  'Position', [600, 150, 630, 180]);
    end

    % Save augmented model
    save_system(twinName);
    fprintf('Digital twin model saved: %s\n', fullfile(modelDir, [twinName '.slx']));
end
