%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                               %
% This function generates set of scatter plots of all possible  %
% combination of binary feature sets                            %
%                                                               %
% Author: Isuru Jayarathne                                      %
% Email: isuru.jayarathne@gmail.com                             %
%                                                               %
% Date_Created: 01/02/2016                                      %
% Last_Modified: 02/02/2017                                     %
%                                                               %
% Input: param1: Data matrix with any number of features (mxn)  %
%        param2: labels for the given data set(only two classes)%
%        param3: integer valuse representing the section of     %
%                plots to show                                  %
% Output: Scatter plots with 20 maximum plots                   %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function scatter2dall(data,labels,page)

n = size(data,2);

% getting all the binary combination for the given data set
comb = combnk(1:n,2);

% split data set two two classes
cls1 = data(find(labels==0),:);
cls2 = data(find(labels==1),:);

% number of plots to show in one figure
plots = 20;

% set last plot number
maxplot = page*plots;

if(maxplot>size(comb,1))
    maxplot = size(comb,1);
end

% maximize the figure window
figure('units','normalized','outerposition',[0 0 1 1]);

for i = (page-1)*plots+1:maxplot
    % set plot position and the title
    subplot(5,4,i-(page-1)*plots);    
    
    % plot 1st class
    scatter(cls1(:,comb(i,1)),cls1(:,comb(i,2)),'*r');
    hold on;
    % plot 2nd class
    scatter(cls2(:,comb(i,1)),cls2(:,comb(i,2)),'ob');
    % set title for the plot
    title(strcat(num2str(comb(i,1)),' and_',num2str(comb(i,2))));
end
 
end