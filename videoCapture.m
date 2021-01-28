%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BME70B: Biomedical Engineering Capstone Design
% Reading in video input from two USB webcams and saving to .avi files
%
% Author: Ginette Hartell - 500755250
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HOUSEKEEPING

imaqreset
imaqmex('feature','-limitPhysicalMemoryUsage',false);

%% Establish a connection with both webcams (only need to do this once)


leftVid = videoinput('winvideo', '3');
rightVid = videoinput('winvideo', '2');

%% Set up video sources for collecting a video
leftVid.TriggerRepeat = Inf;
leftVid.TimeOut = Inf;
leftVid.FrameGrabInterval = 1;
leftVid.LoggingMode = 'disk&memory';
leftVid.FramesPerTrigger = 1;

rightVid.TriggerRepeat = Inf;
rightVid.TimeOut = Inf;
rightVid.FrameGrabInterval = 1;
rightVid.LoggingMode = 'disk&memory';
rightVid.FramesPerTrigger = 1;

%Set up files to write video to
leftWrite = VideoWriter(['leftTrial4.avi']); %change trial number
leftWrite.Quality = 50;
leftWrite.FrameRate = 30;
leftVid.DiskLogger = leftWrite;
leftVid.SelectedSourceName = 'input1';

rightWrite = VideoWriter(['rightTrial4.avi']); %change trial number
rightWrite.Quality = 50;
rightWrite.FrameRate = 30;
rightVid.DiskLogger = rightWrite;
rightVid.SelectedSourceName = 'input1';

%% Trigger 30 seconds of recording

start(rightVid)
start(leftVid)

pause(10)

stop(rightVid)
stop(leftVid)

