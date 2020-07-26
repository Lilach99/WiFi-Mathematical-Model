% calculate and plot the throughput according to the mathematical model:

linkLengths = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    
estimatedThpt = ones(6, 10);
estimatedThpt(1, :) = estimateThpt(-1);   % standard ST
estimatedThpt(2, :) = estimateThpt(2);    % 2APD ST
estimatedThpt(3, :) = estimateThpt(3);    % 3APD ST
estimatedThpt(4, :) = estimateThpt(1);    % 1APD ST
estimatedThpt(5, :) = estimateThpt(0.5);  % 0.5APD ST
estimatedThpt(6, :) = estimateThpt(0.25); % 0.25APD ST

plotEstimatedThpt(linkLengths, estimatedThpt);

