numChannels = 64; % 96 channels for Yk and Mk
excludechannels = []; % List of channels that may be noisy and should be excluded
excludeTrials = []; % Placeholder for bad trials
disp('Training Begins...')
hiddenLayerSize = length(numChannels)*150/2;
denoisedData = trainAutoencoder(neuds,hiddenLayerSize, ...
    'MaxEpochs', 1000, ...
    'L2WeightRegularization',0.05, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.2, ...
    'ScaleData', false, ...
    'useGPU', false);

disp('Training Complete...')

PlanarReachDenoised.model = denoisedData;