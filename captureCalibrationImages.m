%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BME70B: Biomedical Engineering Capstone Design
% Reading in calibration images from two USB webcams
%
% Author: Ginette Hartell - 500755250
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Establish a connection with both webcams (only need to do this once)
%Note: these numbers correspond to how my webcams are numbered in my
%system. To see list of your available webcams, type webcamlist in your CMD
%window.
leftCamera = webcam(2)
rightCamera = webcam(3)

%% Capturing images for calibration
% This loop is designed to take 20 snapshots, with a ten second
% interval in between each image. This is so that you have time to adjust
% the position of your checkerboard between each photo. The images will be
% named according to which camera they came from (left or right) and then
% numbered according to their order (1-20). 

for i=1:20
    
    pause(10);
    
    %Take snapshots
    imgLeft = snapshot(leftCamera);
    imgRight = snapshot(rightCamera);

    %Name files and write into jpg 
    right_temp = strcat('right_',num2str(i));
    imwrite(imgRight,[right_temp, '.jpg']);
        
    left_temp = strcat('left_',num2str(i));
    imwrite(imgLeft,[left_temp, '.jpg']);
    
end

