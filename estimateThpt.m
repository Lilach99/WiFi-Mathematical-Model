function [S] = estimateThpt(slotTimeFactor)

    % network parameters
    phyRate = 6*10^6;
    linkLengths = 1000*[10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    c = 3*10^8;                                              % light speed in air
    APD = linkLengths/c;                                     % air propagation delay
    packetLength = 1460;                                     % in bytes
    packetDuration = ones(1, 10)*pktLengthFunc(packetLength, phyRate);
    ackDuration = ones(1, 10)*ackLengthFunc(phyRate);

    % standard parameters - 802.11a
    SIFS = ones(1, 10)*16*10^-6;
    if(slotTimeFactor == -1)
        slotTime = ones(1, 10)*9*10^-6; 
    else 
        slotTime = slotTimeFactor*APD;
    end
    DIFS = SIFS + 2*slotTime;
    
    % model parameters
    n = 2;                                                   % number of stations in a pTp link
    tau = 0.09;                                               % probability of transmission in a time slot: rate 2Mbps for each side, PHY rate of 6Mbps
    Ptr = 1-(1-tau)^2;                                       % probability of existance of at least one transmission in a time slot
    Ps = (n*tau*(1-tau)^(n-1))/(Ptr);                        % probability of exactly one transmission, given there was at least one transmission
    Ts = packetDuration + DIFS + SIFS + ackDuration + 2*APD; % busy medium time for a successful transmission
    Tcmin = packetDuration + DIFS + APD;
    Tcmax = packetDuration + DIFS + APD + APD;
    Tc = (Tcmin + Tcmax)/2;                                  % expectation of busy medium time for a collided transmission - assuming uniform distribution
    % throughput calculation - fraction of time the channel is used for successful transmisssion
    Snum = Ptr*Ps*packetDuration;                            % numerator of estimated throughput expression
    Sdenom = (1-Ptr)*slotTime + Ptr*Ps*Ts + Ptr*(1-Ps)*Tc;   % denominatior of estimated throughput expression
    S = Snum./Sdenom;
    
end

