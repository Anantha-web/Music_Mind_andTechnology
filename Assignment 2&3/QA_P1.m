addpath('/MATLAB Drive/MIRtoolbox1.8.2 (1)/MIRtoolbox1.8.2/MIRToolbox/');

% Define the fundamental frequencies for D, E, and G notes
fundamental_freq = struct('D', 293.5, 'E', 329.5, 'G', 392);

% Function to generate sine wave for a given frequency and duration
function waveform = generate_sine_wave(freq, duration, sampling_rate)
    t = 0:1/sampling_rate:duration - 1/sampling_rate;
    waveform = sin(2 * pi * freq * t);
end

% Function to create melody using specified harmonics for a given note
function melody = create_melody(note, harmonics, fundamental_freq)
    duration = 1;  % Duration of each tone in seconds
    sampling_rate = 44100;  % Sampling rate in Hz
    t = 0:1/sampling_rate:duration - 1/sampling_rate;
    melody = zeros(size(t));
    for harmonic = harmonics
        melody = melody + generate_sine_wave(fundamental_freq.(note) + harmonic, duration, sampling_rate);
    end
end

% Harmonics for D, E, and G notes
harmonics_D = 1:10;
harmonics_E = 1:10;
harmonics_G = 1:10;

% Create melodies
melody_all_harmonics.D = create_melody('D', harmonics_D, fundamental_freq);
melody_all_harmonics.E = create_melody('E', harmonics_E, fundamental_freq);
melody_all_harmonics.G = create_melody('G', harmonics_G, fundamental_freq);

melody_odd_harmonics.D = create_melody('D', [3, 5, 7], fundamental_freq);
melody_odd_harmonics.E = create_melody('E', [3, 5, 7], fundamental_freq);
melody_odd_harmonics.G = create_melody('G', [3, 5, 7], fundamental_freq);

melody_even_harmonics.D = create_melody('D', [2, 4, 6], fundamental_freq);
melody_even_harmonics.E = create_melody('E', [2, 4, 6], fundamental_freq);
melody_even_harmonics.G = create_melody('G', [2, 4, 6], fundamental_freq);

% Plot the first few samples of each melody
figure('Position', [100, 100, 1200, 800]);

subplot(3, 1, 1);
plot(melody_all_harmonics.D(1:1000));
title('Melody with all harmonics for D');

subplot(3, 1, 2);
plot(melody_odd_harmonics.D(1:1000));
title('Melody with odd harmonics for D');

subplot(3, 1, 3);
plot(melody_even_harmonics.D(1:1000));
title('Melody with even harmonics for D');

sgtitle('Melodies for D note with different harmonic compositions');




or or (keep one half of code while running)

fs = 44100; 
duration = 0.5; 
t = 0:1/fs:duration-1/fs; 

notes = [293.5, 329.5, 392]; 

generateToneWithHarmonics = @(note, harmonics) sum(sin(2 * pi * note .* t' * harmonics) ./ harmonics, 2);


allHarmonics = 1:10;
oddHarmonics = [3, 5, 7];
evenHarmonics = [2, 4, 6];
song_notes = [1, 2, 3, -1, 3, -1, 3, -1, 1, 2, 3, -1, 3, -1, 3, -1];

melodyAll = [];
melodyOdd = [];
melodyEven = [];


for idx = song_notes
    if idx == -1
        melodyAll = [melodyAll; zeros(length(t), 1)]; 
    else
        melodyAll = [melodyAll; generateToneWithHarmonics(notes(idx), allHarmonics)];
    end
end

for idx = song_notes
    if idx == -1
        melodyOdd = [melodyOdd; zeros(length(t), 1)]; 
    else
        melodyOdd = [melodyOdd; generateToneWithHarmonics(notes(idx), oddHarmonics)];
    end
end

for idx = song_notes
    if idx == -1
        melodyEven = [melodyEven; zeros(length(t), 1)]; 
    else
        melodyEven = [melodyEven; generateToneWithHarmonics(notes(idx), evenHarmonics)];
    end
end


audiowrite('melodyAll.wav', melodyAll, fs);
audiowrite('melodyOdd.wav', melodyOdd, fs);
audiowrite('melodyEven.wav', melodyEven, fs);