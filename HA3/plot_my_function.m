function [  ] = plot_my_function( x, f_h )

    xAxis = [-x:0.05:x];
    yAxis = zeros(length(xAxis));

    for idx = 1:length(xAxis)
        yAxis(idx) = f_h(xAxis(idx));
    end
    figure(1);
    plot(xAxis,yAxis);  
    hold off;
    grid on;
    xlabel('X');
    ylabel('Y');
    title('My Function');
end

