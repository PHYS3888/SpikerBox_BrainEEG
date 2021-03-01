%-------------------------------------------------------------------------------
% (Make sure your Matlab installation includes the 'Signal Processing and
% Communications' and 'Curve Fitting' toolboxes).
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Load in recorded BYB data from wav file:
dataFileName = 'TimBrain_VisualCortex_BYB_Recording.wav';
[data,Fs] = audioread(dataFileName);

% Downsample data by a factor of 20:
data_new = downsample(data,20);
% (alternative is to decimate 19 from every 20 samples):
% data_new_2 = decimate(data,20);

%-------------------------------------------------------------------------------
% Plot a spectrogram of the data:
figure('color','w');
spectrogram(data_new,256,250,256,500,'yaxis');
ylim([0 90]);
colormap(winter);
brighten(-0.7);

%-------------------------------------------------------------------------------
% Smoothed alpha range:
[d,f,t] = spectrogram(data_new,256,250,256,500,'yaxis');
d_real = real(d);
alphaRange = mean(d_real((5:7),:),1);
smoothedAlphaRange = smooth((abs(alphaRange)),250,'moving');
figure('color','w');
plot(t/60,smoothedAlphaRange);
xlim([0 max(t/60)])
