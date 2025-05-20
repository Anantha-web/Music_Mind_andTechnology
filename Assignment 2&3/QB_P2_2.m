% Add the MIRtoolbox folder to the MATLAB path
addpath('/MATLAB Drive/MIRtoolbox1.8.2 (1)/MIRtoolbox1.8.2/MIRToolbox/');

% Define the filenames of the music files
music_files = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_sw44ft.mp3'};

% Initialize arrays to store computational and perceptual tempo estimates
computational_tempos = zeros(1, length(music_files));
perceptual_tempos = zeros(1, length(music_files));

% Iterate over each music file
for i = 1:length(music_files)
    % Read the audio data using miraudio command
    audio_data = miraudio(music_files{i});
    
    % Estimate the tempo of the music file computationally
    computational_tempo = mirtempo(audio_data);
    
    % Extract the computational tempo value
    computational_tempo_value = mirgetdata(computational_tempo);
    
    % Display the computational tempo
    disp(['Computational tempo of ', music_files{i}, ': ', num2str(computational_tempo_value), ' BPM']);
    
    % Store the computational tempo estimate
    computational_tempos(i) = computational_tempo_value;
    
    % Play the excerpt using mirplay command
    mirplay(music_files{i});
    
    % Prompt the user for their perceptual estimate of tempo
    perceptual_tempo = input('Enter your perceptual estimate of tempo (BPM): ');
    
    % Store the perceptual tempo estimate
    perceptual_tempos(i) = perceptual_tempo;
end

% Compare computational and perceptual tempo estimates
discrepancies = computational_tempos - perceptual_tempos;
average_discrepancy = mean(discrepancies);

% Display the average discrepancy
disp(['Average discrepancy between computational and perceptual estimates: ', num2str(average_discrepancy), ' BPM']);
