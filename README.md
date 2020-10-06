# EEG processing

## plotall.m

plotall function plots all the channel signals containg 
in the .edf (Europian Data Format) file which is generated 
by EMOTIV EPOC+ headset.

** You need `edfread()` function installed **

Link: [click here](https://www.mathworks.com/matlabcentral/fileexchange/31900-edfread)

Input: Path to .edf file (ex: <folder_name>/<file>.edf)
Output: Matrix of 14 channel data (14x<data_length>)      

Code: 
```matlab
plotall("1.edf");
```

Output looks like this.
![Plots of all channels](plotall_output.png)

## scatter2dall.m

This function generates set of scatter plots of all possible 
combination of binary feature sets

Input: param1: Data matrix with any number of features (mxn)  
       param2: labels for the given data set(only two classes)
       param3: integer valuse representing the section of     
               plots to show                        

Output: Scatter plots with 20 maximum plots 

## topograph.m

This function generates a topographic plot for given EDF file.
** You need `edfread()` function installed. **
Link: [click here](https://www.mathworks.com/matlabcentral/fileexchange/31900-edfread)

Input: Path to .edf file (ex: <folder_name>/<file>.edf)

Code: 
```matlab
topograph("1.edf");
```

Output looks like this.
![Topographic plot](topograph.png)

You can find some EDF data in this publication.
[Person identification from EEG using various machine learning techniques with inter-hemispheric amplitude ratio](https://doi.org/10.1371/journal.pone.0238872)
