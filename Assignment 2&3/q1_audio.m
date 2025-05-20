clear;
clc;
close all;

% Define the frequencies for D, E, and G
D_freq = 293.66; % Hz (Changed from 293.5 to 293.66)
E_freq = 329.63; % Hz (Changed from 329.5 to 329.63)
G_freq = 392.00; % Hz (Changed from 392.0 to 392.00)

% Duration for each note in seconds
note_duration = 0.6; % seconds (Changed from 0.5 to 0.6)

% Sampling rate (samples per second)
sampling_rate = 44100;

% Number of harmonics
num_harmonics = 12; % (Changed from 10 to 12)

% Create the melody sequence
melody = {'D', 'D', 'D', 'D', 'E', 'E', 'D', 'D', ...
                'G', 'G', 'G', 'G', 'D', 'D', 'D', 'D', ...
                'G', 'G', 'G', 'G'};

% Generate the combined waveform for the melody
combined_wave = zeros(1, note_duration * sampling_rate * length(melody));
for i = 1:length(melody)
    freq = 0;
    if strcmp(melody{i}, 'D')
        freq = D_freq;
    elseif strcmp(melody{i}, 'E')
        freq = E_freq;
    elseif strcmp(melody{i}, 'G')
        freq = G_freq;
    end
    
    % Generate sine wave for the current note with multiple harmonics
    note_wave = zeros(1, note_duration * sampling_rate);
    for h = 1:num_harmonics
        t = (0:(note_duration * sampling_rate - 1)) * (1/sampling_rate);
        note_wave = note_wave + sin(2 * pi * freq * h * t);
    end
    
    % Add the current note to the combined waveform
    start_index = (i - 1) * note_duration * sampling_rate + 1;
    end_index = start_index + note_duration * sampling_rate - 1;
    combined_wave(start_index:end_index) = combined_wave(start_index:end_index) + note_wave;
end

% Normalize the combined wave
combined_wave = combined_wave / max(abs(combined_wave));

% Play the generated sound
sound(combined_wave, sampling_rate);
