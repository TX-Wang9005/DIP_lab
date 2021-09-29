clear;
%close all;
inputImage = imread('Fig0220(a).tif');
resizedImage = resizeImage_bilinear(inputImage, 1/12.5);
newImage = resizeImage_bilinear(resizedImage, 12.5);
imshow(newImage);