function importCad()
%IMPORTCAD Import SolidWorks STEP file into Simscape Multibody.
%   Uses smimport to create a base model from extracted/Stewart Platform.STEP.
%   Saves the imported model to models/imported_Stewart_Platform.slx.
%
%   MANUAL STEP REQUIRED AFTER IMPORT:
%   Open the imported model and edit Body blocks to enter mass/inertia
%   values exported from SolidWorks. This is a GUI step not captured by scripts.

    rootDir = fileparts(fileparts(fileparts(mfilename('fullpath'))));
    stepPath = fullfile(rootDir, 'extracted', 'Stewart Platform.STEP');
    modelDir = fullfile(rootDir, 'models');

    if ~isfile(stepPath)
        error('importCad:FileNotFound', 'STEP file not found: %s', stepPath);
    end

    fprintf('Importing STEP file: %s\n', stepPath);
    smimport(stepPath);

    % Save imported model
    importedName = 'imported_Stewart_Platform';
    save_system(importedName, fullfile(modelDir, [importedName '.slx']));
    fprintf('Saved imported model to: %s\n', fullfile(modelDir, [importedName '.slx']));
    fprintf('NOTE: Edit Body blocks manually to enter mass/inertia values from SolidWorks.\n');
end
