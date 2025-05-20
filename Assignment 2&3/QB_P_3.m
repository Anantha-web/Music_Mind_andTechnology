% Add the MIRtoolbox folder to the MATLAB path
addpath('/MATLAB Drive/MIRtoolbox1.8.2 (1)/MIRtoolbox1.8.2/MIRToolbox/');

% Define the filenames of the music files
music_files = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swift.mp3'};

% Iterate over each music file
for i = 1:length(music_files)
    % Read the audio data using miraudio command
    audio_data = miraudio(music_files{i});
    
    % Perform frame-based tempo analysis with mirtempo
    tempo_frames = mirtempo(audio_data, 'Frame', 2); % Frame length of at least 2 seconds
    
    % Extract tempo values from the frames
    tempo_values = mirgetdata(tempo_frames);
    
    % Compute the range of tempo variation
    tempo_range = [min(tempo_values), max(tempo_values)];
    
    % Display the range of tempo variation
    disp(['Range of tempo variation for ', music_files{i}, ': ', num2str(tempo_range(1)), ' to ', num2str(tempo_range(2)), ' BPM']);
    
    % Check if tempo varies significantly (arbitrary threshold used here)
    if (tempo_range(2) - tempo_range(1)) > 10
        disp(['The tempo of ', music_files{i}, ' varies significantly.']);
    else
        disp(['The tempo of ', music_files{i}, ' is relatively consistent.']);
    end
end
