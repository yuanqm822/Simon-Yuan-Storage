%move z Functional connectivity files and compute mean image
%coded by Simon Yuan @ 6/15/2020

%% move z Functional Connectivity Files
clc; clear;
for roinum = 1:4
    for sid = [101:111,113,116:119,201:206,302:303,305:307,310,312:321]
        for session = 1:4
            orig_path = ['G:\Qiming_Cerebellum\old_activation\6_FC\FC_result\Raw\S',num2str(session)];
            targ_path = ['G:\Qiming_Cerebellum\old_activation\6_FC\FC_result\Original\ROI',num2str(roinum),'\seperated\sub',num2str(sid)];
            if exist(targ_path,'dir')==0
                mkdir(targ_path)
            end
            zfcfile = dir([orig_path,'\zROI',num2str(roinum),'FCMap_sub',num2str(sid),'.nii']);
            zfcfilename = {zfcfile.name};
            copyfile([orig_path,'\',char(zfcfilename)],[targ_path,'\S',num2str(session),char(zfcfilename)]);
        end
    end
end

%% Compute mean zFC image
%add REST to MATLAB path;
%deactivate DPABI when using REST.
clear all;
for roinum = 1:4
    for sid = [101:111,113,116:119,201:206,302:303,305:307,310,312:321]
    origpath = ['G:\Qiming_Cerebellum\old_activation\6_FC\FC_result\Original\ROI',num2str(roinum),'\seperated\sub',num2str(sid)];
    outpath = ['G:\Qiming_Cerebellum\old_activation\6_FC\FC_result\Original\ROI',num2str(roinum),'\mean'];
    if exist(outpath,'dir')==0
            mkdir(outpath)
    end
    rest_Mean(origpath,outpath,['meanzFC_sub',num2str(sid),'.nii']);
    end
end
disp('CALCULATION FINISHED')
    
    
    
    
    
    
    