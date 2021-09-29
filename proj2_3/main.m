clear;
%close all;
inputImage = imread('Fig0220(a).tif');
resizedImage = resizeImage_replication(inputImage, 1/10);
newImage = resizeImage_replication(resizedImage, 10);
imshow(newImage);