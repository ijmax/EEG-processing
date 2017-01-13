%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                            %
% This function is for plot all the channel signals containg %
% in the .edf (Europian Data Format) file which is generated %
% by EMOTIV EPOC+ headset.                                   %
%                                                            %
% Author: Isuru Jayarathne                                   %
% Email: isuru.jayarathne@gmail.com                          %
%                                                            %
% Date_Created: 19/12/2016                                   %
% Last_Modified: 13/01/2017                                  %
%                                                            %
% Input: Path of the .edf file (ex: <folder_name>/<file>.edf %
% Output: Matrix of 14 channel data (14x<data_length>)       %
%                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function chdata = plotall(filename)

% Read .edf file
[hdr, record] = edfread(filename);

% Get markers and all non zero values to one
mark = record(20,:);
mark(mark>0) = 1;

% Get 14 channel EEG data
record = record(3:16,:);

% Get channel labels
chs = hdr.label(3:16);

% Set channel order to plot signals
odr = [1 3 5 7 9 11 13 14 12 10 8 6 4 2];

% Create new matrix to store data 
data = zeros(size(record));

figure;

for i=1:14
    ch=record(i,:);
    
    % Normalize the signal
    mx = max(ch);
    ch = (ch-mx/2)/(mx/2);
    
    % Store normalized signal
    data(i,:) = ch;
    
    % Plot signal
    subplot(7,2,odr(i));
    plot(ch);
    hold on;
    
    % Plot markers
    mark(mark<1) = min(ch);
    plot(mark*max(ch),'r');
    title(chs(i));
    hold off;
end

% set output
chdata = data;

end