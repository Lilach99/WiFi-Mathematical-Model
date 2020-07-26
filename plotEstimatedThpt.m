function [] = plotEstimatedThpt(linkLens, linkEstimatedThpt)

    figure(1) 
    colorsNames = {'green', 'red', 'blue', 'magenta', 'yellow', 'black'};

    for j=1:6
        plot(linkLens, linkEstimatedThpt(j, :), '-o', 'Color', colorsNames{j});
        hold on
    end
    title('Estimated Throughput for different slotTime values', 'FontSize', 20);
    xlabel('Link length (km)', 'FontSize', 14);
    ylabel('Estimated Link Throughput (fraction of successful transmission time)', 'FontSize', 14);
    set(gca,'FontSize', 14);
    legend({'Standard SlotTime', '2APD SlotTime', '3APD SlotTime', 'APD SlotTime', '0.5APD SlotTime', '0.25APD SlotTime'}, 'FontSize', 14, 'Location','southwest');
    %savefig([resultsPath, '\Collided_Bytes_Percentage.fig']);
    hold off
    
end

