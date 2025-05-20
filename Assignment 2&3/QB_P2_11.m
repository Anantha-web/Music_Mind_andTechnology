% Load the tempo data for each audio track
 % Add the MIRtoolbox folder to the MATLAB path
addpath('/MATLAB Drive/MIRtoolbox1.8.2 (1)/MIRtoolbox1.8.2/MIRToolbox/');
% Replace these placeholders with your actual tempo data
calculated_tempo = [185, 97, 140, 109, 51]; % Example calculated tempos
perceived_tempo = [144, 86, 118, 68, 44]; % Example perceived tempos

% Plotting
figure;
plot(1:length(calculated_tempo), calculated_tempo, 'o-', 'LineWidth', 2, 'DisplayName', 'Calculated Tempo');
hold on;
plot(1:length(perceived_tempo), perceived_tempo, 's--', 'LineWidth', 2, 'DisplayName', 'Perceived Tempo');
hold off;

% Customize the plot
xlabel('Audio Track');
ylabel('Tempo (BPM)');
title('Comparison of Calculated and Perceived Tempo');
legend('Location', 'best');
grid on;

% Set the x-axis tick labels
audio_tracks = {'Track 1', 'Track 2', 'Track 3', 'Track 4'}; % Replace with actual track names
xticks(1:length(audio_tracks));
xticklabels(audio_tracks);
xtickangle(45); % Rotate x-axis labels if necessary
