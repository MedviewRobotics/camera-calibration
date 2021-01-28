[R1 R2] = rectifyStereoImages(videoFrameLeft, videoFrameRight, stereoParamsTrial4);

%Create the stereo anaglyph of the rectified stereo pair image and display it. You can view the image in 3-D by using red-cyan stereo glasses.
A = stereoAnaglyph(R1,R2);
figure;
imshow(A);
title('Red-Cyan composite view of the rectified stereo pair image');

%Grayscale
J1 = rgb2gray(R1);
J2 = rgb2gray(R2);

%Compute disparity via semiglobal matching
disparityRange = [0 48];
disparityMap = disparity(J1,J2,'DisparityRange',disparityRange,'UniquenessThreshold',20);

%Plot
figure
imshow(disparityMap,disparityRange)
title('Disparity Map')
colormap jet
colorbar