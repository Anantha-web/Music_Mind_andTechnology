% Add the MIRtoolbox folder to the MATLAB path
addpath('/MATLAB Drive/MIRtoolbox1.8.2 (1)/MIRtoolbox1.8.2/MIRToolbox/');

% Define the filenames of the audio files
audioFiles = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

% Loop through each audio file
for i = 1:length(audioFiles)
    % Read the audio file
    audioFile = audioFiles{i};
    miraudio_data = miraudio(audioFile);
    
    % Play the audio excerpt
    mirplay(miraudio_data);
end
