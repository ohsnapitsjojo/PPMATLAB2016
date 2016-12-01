function [ signals ] = A23_fcn( )
    
    fid = fopen('A23_Ascii_Fread.dat','r');
    [data,count] = fread(fid);
    data_char = char(data');
    
    signals = zeros(3,2001);
    jdx = 1;                        % index in signals matrix
    idx = 61;                       % staring index of number search
    
    while(idx < count)
        if 48 <= data(idx) && data(idx) <= 57   % 0-9 in ASCII
            number = data_char(idx:idx+4);
            number = str2double(number);
            signals(jdx) = number;
            jdx = jdx+1;
            idx = idx+4;
        end
        idx = idx+1;
    end
    % Plot
    figure;
    subplot(2,1,1);
    plot(signals(1,:),signals(2,:));
    title('Signal1');
    xlabel('time');
    
    subplot(2,1,2);
    plot(signals(1,:),signals(3,:));
    title('Signal2');
    xlabel('time');
    
end

