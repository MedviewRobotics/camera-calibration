%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BME70B: Biomedical Engineering Capstone Design
% Reading in video input from two USB webcams and saving to .avi files
%
% Author: Ginette Hartell - 500755250
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create a disparity map from two stereovision images

[R1 R2] = rectifyStereoImages(left_1, right_1, stereoParams7);

%Create the stereo anaglyph of the rectified stereo pair image and display it. You can view the image in 3-D by using red-cyan stereo glasses.
A = stereoAnaglyph(R1,R2);
figure;
imshow(A);
title('Red-Cyan composite view of the rectified stereo pair image');

%Grayscale
J1 = rgb2gray(R1);
J2 = rgb2gray(R2);

%Compute disparity via semiglobal matching
disparityRange = [144 176];
disparityMap = disparity(J1,J2,'DisparityRange',disparityRange,'UniquenessThreshold',30);

%Plot
figure
imshow(disparityMap,disparityRange)
title('Disparity Map')
colormap jet
colorbar