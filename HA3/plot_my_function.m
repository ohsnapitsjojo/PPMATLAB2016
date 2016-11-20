function [ figure_handle ] = plot_my_function( x, f_h )

    % Berechne y-Werte
    y = arrayfun(f_h,x);
    
    % erzeuge neues Figure
    figure_handle = figure;
    
    % erzeuge plot von y über x
    plot(x,y);  
    hold off;
    grid on;
    xlabel('X');
    ylabel('Y');
    title(['My Function (' func2str(f_h) ')']);
    
end

