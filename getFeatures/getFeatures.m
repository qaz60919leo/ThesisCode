clear;
% files=dir('C:\Users\user\Desktop\Matlab_Test\sourceIMAGE\mdb*.pgm');
% filesNum=size(files,1);
filepath = 'C:\Users\user\Desktop\Matlab_Cancer\sourceIMAGE\';
outputPathCT = 'C:\Users\user\Desktop\Matlab_Cancer\cropTagIMG\';
outputPathCS = 'C:\Users\user\Desktop\Matlab_Cancer\cropSkinIMG\';
outputPathCC = 'C:\Users\user\Desktop\Matlab_Cancer\CancerIMG\';
%%%%%%%
splitData = csvread('MIAS_split.csv');
list=[];

for Num = 1:size(splitData,1)
    NameNum = splitData(Num,1);
   fileName = [filepath 'mdb' sprintf('%03d',NameNum) '.pgm'];
   f = imread(fileName);
   f = imadjust(f);
   f = tagCrop(f);
   
   %save tagCrop image to fold
   fileName = [outputPathCT 'mdb' sprintf('%03d',NameNum) '.pgm'];
   imwrite(f,fileName,'pgm');
   
   f = skinCrop(f);
   %save skinCrop image to fold
   fileName = [outputPathCS 'mdb' sprintf('%03d',NameNum) '.pgm'];
   imwrite(f,fileName,'pgm');
   
   cancerROI = findROI(f);
   cancerROI = cropROI(cancerROI);
   %save cancerROI image to fold
   fileName = [outputPathCC 'mdb' sprintf('%03d',NameNum) '.jpg'];
   imwrite(cancerROI,fileName,'jpg');
   
   
   %glcm features
   offset = [0 1;-1 1;-1 0;-1 -1];
   glcm=graycomatrix(cancerROI,'Offset',offset);
   glcmp=graycoprops(glcm);
   list(Num,1)=glcmp.Contrast(1);
   list(Num,2)=glcmp.Correlation(1);
   list(Num,3)=glcmp.Energy(1);
   list(Num,4)=glcmp.Homogeneity(1);
   list(Num,5)=glcmp.Contrast(2);
   list(Num,6)=glcmp.Correlation(2);
   list(Num,7)=glcmp.Energy(2);
   list(Num,8)=glcmp.Homogeneity(2);
   list(Num,9)=glcmp.Contrast(3);
   list(Num,10)=glcmp.Correlation(3);
   list(Num,11)=glcmp.Energy(3);
   list(Num,12)=glcmp.Homogeneity(3);
   list(Num,13)=glcmp.Contrast(4);
   list(Num,14)=glcmp.Correlation(4);
   list(Num,15)=glcmp.Energy(4);
   list(Num,16)=glcmp.Homogeneity(4);
   
   %shape features
   [area,peri,ap]=ShapeFeature(cancerROI);
   list(Num,17) = area;
   list(Num,18) = peri;
   list(Num,19) = ap;
   
   for i=1:size(list,1)
       for j=1:size(list,2)
           if isnan(list(i,j))
               list(i,j)=0;
           end
       end
   end
end
csvwrite('glcmlist.csv',list);