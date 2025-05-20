% Clear MATLAB classes
clear classes;

% Add the path to MIRtoolbox
addpath('/MATLAB Drive/MIRtoolbox1.8.2 (1)/MIRtoolbox1.8.2/MIRToolbox/');

% Load the audio file
filename = '06.wav';

% Parameters
frameSize = 1024;
hopSize = 512;

% Calculate chromagram frame by frame
chromagram = mirchromagram(filename, 'Frame', frameSize, hopSize, 'Min', 60, 'Max', 4000, 'Frame');

% Perform frame decomposition on the chromagram
chromagram_frames = mirframe(chromagram);

% Compute the similarity matrix
similarity_matrix = mirsimatrix(chromagram_frames);

% Check if the similarity matrix is empty
if ~isempty(similarity_matrix)
    % Convert similarity matrix to numeric array
    similarity_matrix_data = mirgetdata(similarity_matrix);
    
    % Display the similarity matrix
    figure;
    imagesc(similarity_matrix_data);
    xlabel('Time (frames)');
    ylabel('Time (frames)');
    title('Similarity Matrix of Chromagram Sequence');
else
    disp('Error: Similarity matrix is empty.');
end