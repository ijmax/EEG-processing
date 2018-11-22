function topograph(fname)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                      %
% This function generates a topographic plot for the   %
% given .edf file with 14 channels which is generated  %
% by Emotiv control panel.                             %
%                                                      %
% Author: Isuru Jayarathne                             %
% Email: isuru.jayarathne@gmail.com                    %
%                                                      %
% Input: European Data Format (.edf) file              %
% Ouptput: Topographic plot of the data                %
%                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [hdr, record] = edfread(fname);
    
    % Seperate data fields
    data = record(3:16,:);
    
    % Define the locatiopns of the electrodes of EMOTIV Epoc+ headset
    xc = [2.5; 1.5; 3; 2; 1; 2; 3; 5; 6; 7; 6; 5; 6.5; 5.5];
    yc = [7; 5.7; 5.8; 5; 4; 2; 1; 1; 2; 4; 5; 5.8; 6; 7];
    lbls = {'AF3','F7','F3','FC5','T7','P7','O1','O2','P8','T8','FC6','F4','F8','AF4'};
    
    trlen = [];

    for i=1:14
        dat =data(i,:);
        % Normalize the channel data
        dat = (dat - min(dat))./(max(dat) - min(dat));
        % Calculate power
        ftr = fft(dat);
        pow = ftr.*conj(ftr);
        tpow = sum(pow);
        % Concatinate the values to array
        trlen = vertcat(trlen,tpow);
    end
    
    % Interpolate the points
    xi=linspace(min(xc),max(xc),30);
    yi=linspace(min(yc),max(yc),30);

    [XI YI]=meshgrid(xi,yi);
    ZI = griddata(xc,yc,trlen,XI,YI,'natural');
    
    % Plot the graph
    figure;
    contourf(XI,YI,ZI,20);
    hold on;    
    scatter(xc,yc,'b','filled');
    text(xc+0.1,yc+0.1,lbls);
    
    % Turn off the plot labels and axis
    set(gca,'Visible','off')
    % Set color map to jet
    colormap(jet);
    hold off;
end
