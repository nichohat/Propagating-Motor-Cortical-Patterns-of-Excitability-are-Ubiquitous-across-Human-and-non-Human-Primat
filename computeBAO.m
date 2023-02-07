%-----------Computing Spatiotemporal Beta Pattern Characteristics----------%
% Inputs:   PlanarReachDenoised - the autoencoded model                    %
%           inputData - Beta envelope (see ExampleDataProcess.mat)         %
%           inputArguments - see ExampleDataProcess.mat                    %
% Outputs: Orientation - Propagation direction in Degrees                  %
%           Speed - Propagation Speed                                      %
%--------------------------------------------------------------------------%
function [Orientation, Speed] = computeBAO(PlanarReachDenoised, inputData, inputArguments)
[trialbetawf, trialmbetawf] = computetrialBeta(PlanarReachDenoised, inputData, inputArguments);
[Orientation, Speed] = computeOS(trialbetawf, trialmbetawf, inputArguments);
