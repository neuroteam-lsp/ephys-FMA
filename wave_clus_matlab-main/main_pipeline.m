% Input arguments:
% root: openEphys data folder (Rhythm_FPGA-100.0)
% chLst: channel to spike sort
% numChannels: how many channels in the binary .dat file
% CommonRefChannels: which channels to average over for CAR; if empty, no CAR

% Parameters
%OE data
root = strcat('Record Node 101/experiment1/recording1/continuous/Rhythm_FPGA-100.0/');
bytesPerSample = 2; % int16 -> 2 octets
chLst = 1:32;
numChannels = 43;
CommonRefChannels = [];

datFile = [root 'continuous.dat'];
dataInfo = dir(datFile); % Récupérer la taille du fichier
numSamples = dataInfo.bytes / (numChannels * bytesPerSample); % Nombre total d'échantillons par canal
% Load OE data
fid = fopen(datFile, 'r');
data = fread(fid, 'int16=>int16');
fclose(fid);
% Save extracted data in a binary .dat file
localConcatRoot = '~/Record Node 101/experiment1/recording1/continuous/Rhythm_FPGA-100.0/';
mkdir(localConcatRoot);
% Sauvegarde dans un nouveau fichier
fidOut = fopen([localConcatRoot 'continuous.dat'], 'w');
fwrite(fidOut, data, 'int16');
fclose(fidOut);
% Run wave_clus on the .dat file
openEphys2wave_clus(localConcatRoot,chLst,numChannels,CommonRefChannels);
% Delete the temporary .dat file
delete([localRoot 'continuous.dat']);