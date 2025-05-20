
% Add the MIRtoolbox folder to the MATLAB path
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
        melody = melody + generate_sine_wave(fundamental_freq.(note) * harmonic, duration, sampling_rate);
    end
end

% Harmonics for D, E, and G notes
harmonics_D = 1:10;
harmonics_E = 1:10;
harmonics_G = 1:10;

% Create original melody with all harmonics
melody_original_D = create_melody('D', harmonics_D, fundamental_freq);
melody_original_E = create_melody('E', harmonics_E, fundamental_freq);
melody_original_G = create_melody('G', harmonics_G, fundamental_freq);

% Create melody with virtual pitch (removing fundamentals)
melody_virtual_pitch_D = create_melody('D', harmonics_D(2:end), fundamental_freq);
melody_virtual_pitch_E = create_melody('E', harmonics_E(2:end), fundamental_freq);
melody_virtual_pitch_G = create_melody('G', harmonics_G(2:end), fundamental_freq);

% Create melody with removed harmonics
melody_removed_harmonics_D = create_melody('D', harmonics_D(2:end), fundamental_freq);
melody_removed_harmonics_E = create_melody('E', harmonics_E(2:end), fundamental_freq);
melody_removed_harmonics_G = create_melody('G', harmonics_G(2:end), fundamental_freq);

% Plot the first few samples of each melody
figure('Position', [100, 100, 1200, 800]);

subplot(3, 1, 1);
plot(melody_original_D(1:1000), 'b', 'LineWidth', 1.5);
hold on;
plot(melody_virtual_pitch_D(1:1000), '--g', 'LineWidth', 1.5);
plot(melody_removed_harmonics_D(1:1000), ':r', 'LineWidth', 1.5);
title('Comparison of Melodies for Note D');
xlabel('Samples');
ylabel('Amplitude');
legend('Original D', 'Virtual Pitch D', 'Removed Harmonics D');
hold off;

subplot(3, 1, 2);
plot(melody_original_E(1:1000), 'b', 'LineWidth', 1.5);
hold on;
plot(melody_virtual_pitch_E(1:1000), '--g', 'LineWidth', 1.5);
plot(melody_removed_harmonics_E(1:1000), ':r', 'LineWidth', 1.5);
title('Comparison of Melodies for Note E');
xlabel('Samples');
ylabel('Amplitude');
legend('Original E', 'Virtual Pitch E', 'Removed Harmonics E');
hold off;

subplot(3, 1, 3);
plot(melody_original_G(1:1000), 'b', 'LineWidth', 1.5);
hold on;
plot(melody_virtual_pitch_G(1:1000), '--g', 'LineWidth', 1.5);
plot(melody_removed_harmonics_G(1:1000), ':r', 'LineWidth', 1.5);
title('Comparison of Melodies for Note G');
xlabel('Samples');
ylabel('Amplitude');
legend('Original G', 'Virtual Pitch G', 'Removed Harmonics G');
hold off;




or (keep one half of code while running)


fs = 44100; 
duration = 0.5; 
t = 0:1/fs:duration-1/fs; 


notes = [293.5, 329.5, 392]; 
generateToneWithHarmonics = @(note, harmonics) sum(sin(2 * pi * note .* t' * harmonics) ./ harmonics, 2);


song_notes = [1, 2, 3, -1, 3, -1, 3, -1, 1, 2, 3, -1, 3, -1, 3, -1];

withoutFundamental = 2:10; 
withoutFirstAndSecond = 3:10; 
melodyNoFundamental = [];
melodyNoFirstAndSecond = [];


for idx = song_notes
    if idx == -1
        melodyNoFundamental = [melodyNoFundamental; zeros(length(t), 1)]; % Add silence for pauses
    else
        melodyNoFundamental = [melodyNoFundamental; generateToneWithHarmonics(notes(idx), withoutFundamental)];
    end
end


for idx = song_notes
    if idx == -1
        melodyNoFirstAndSecond = [melodyNoFirstAndSecond; zeros(length(t), 1)]; % Add silence for pauses
    else
        melodyNoFirstAndSecond = [melodyNoFirstAndSecond; generateToneWithHarmonics(notes(idx), withoutFirstAndSecond)];
    end
end


audiowrite('melodyNoFundamental.wav', melodyNoFundamental, fs);
audiowrite('melodyNoFirstAndSecond.wav', melodyNoFirstAndSecond, fs);