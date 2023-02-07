Data Characteristics:

1. DataPlanarReach.mat: Contains 2 kHz neural data from 64-channel electrode grid recorded from monkey Bx. The data is aligned to Go cue. The data spans from -500 to 900 ms
2. DataTongueProtrusion.mat: Contains neural data sampled at 1 kHz from 96-channel electrode grid recorded from monkey Yk. The data is aligned to force onset (FO). The data spans from -2500 to 1500 ms
3. DataIsometricPinch.mat: Contains neural data sampled at 2 kHz from 96-channel electrode grid from monkey Mk. The data is aligned to FO. The data spans from -500 to 750 ms
4. The data structure is channel x sample x trial

Processing Steps:

Step-1: Convert raw data into denoised data using autoencoder
Step-2: Run computeBAO.m to estimate the orientation and speed of the spatiotemporal pattern

To run the example processed data:

Run script_Example.m