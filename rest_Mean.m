%Mean Image Calculator 
%Extract by Simon @ 6/15/2020
function rest_Mean(GroupDir,outdir,outname)
olddir=pwd;
[GroupSeries, VoxelSize, ImgFileList, Header,nVolumn] =rest_to4d(GroupDir);
cd(olddir);
rest_waitbar;
meanSeries=mean(GroupSeries,4);
fprintf('Get the mean value of all the images in %s\n',GroupDir);
rest_WriteNiftiImage(meanSeries,Header,[outdir,filesep,outname]);