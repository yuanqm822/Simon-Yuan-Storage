%SUIT ANALYSES FOR CEREBELLUM 
%coded by Simon Yuan @ 5/15/2020
%commented scripts for dartel
%run each section seperately to avoid bugs
clc; clear;
%sub = [201:215,219:223,225:228];
sub = [101:111,113,116:119,201:206,302:303,305:307,310,312:321];
path='G:\Qiming_Cerebellum\old_activation\2_suit\T1ImgCoreg';
spm_suit %initializing spm_suit
%% suit_isolate & segmetation
for s=1:length(sub)
    sid = sub(s);
    disp(['sub',num2str(sid)]);
    subpath = fullfile(path,['sub',num2str(sid)],'\');
    file = dir(fullfile(subpath,'*Crop_1.nii'));
    filename = strcat(file.folder,'\',file.name);
    suit_isolate(filename)
end
%% suit_normalize 
parfor s=1:length(sub)
    sid = sub(s);
    disp(['sub',num2str(sid)]);
    subpath = fullfile(path,['sub',num2str(sid)],'\');
%     file1 = dir(fullfile(subpath,'*Crop_1_seg1.nii'));
    file1 = dir(fullfile(subpath,'c_*Crop_1.nii'));
%     file2 = dir(fullfile(subpath,'*Crop_1_seg2.nii'));
    file3 = dir(fullfile(subpath,'*Crop_1_pcereb_corr.nii'));
    filename1 = strcat(file1.folder,'\',file1.name);
%     filename2 = strcat(file2.folder,'\',file2.name);
    filename3 = strcat(file3.folder,'\',file3.name);
%     job.subjND(s).gray = {[filename1]}; % where subjName is a cell array of subject names
%     job.subjND(s).white = {[filename2]};
%     job.subjND(s).isolation = {[filename3]};
    suit_normalize(filename1,'mask',filename3);
end
% suit_normalize_dartel(job)
%% suit_reslice 
resultpath = 'G:\Qiming_Cerebellum\old_activation\2_suit\Results\orig';
for s=1:length(sub)
    sid = sub(s);
    disp(['sub',num2str(sid)]);
    subpath = fullfile(path,['sub',num2str(sid)],'\');
    sourcefile = dir(fullfile(resultpath,['switchcost_sub',num2str(sid),'.nii']));
    file1 = dir(fullfile(subpath,'mc*snc.mat'));
    file2 = dir(fullfile(subpath,'u_a_*seg1.nii'));
    file3 = dir(fullfile(subpath,'c*pcereb_corr.nii'));
    sourcefilename = [sourcefile.folder,'\',sourcefile.name];
    filename1 = [file1.folder,'\',file1.name];
    filename2 = [file2.folder,'\',file2.name];
    filename3 = [file3.folder,'\',file3.name];
%     job.subj(s).affineTr={[filename1]};       % where subjName is a cell array of subject names
%     job.subj(s).flowfield={[filename2]};       
%     job.subj(s).resample{1}={[sourcefilename]}; % Cell array containing all images to be resliced.
%     job.subj(s).mask={[filename3]};
    suit_reslice([sourcefilename],filename1,'mask',filename3);
end
% suit_reslice_dartel(job);
disp('ALL SUIT ANALYSES HAVE BEEN COMPLETED!');
    