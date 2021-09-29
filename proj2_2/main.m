clear;
close all;
inputImage = imread('Fig0221(a).tif');

new_Image = reduceIntensityLevel(inputImage, 2);
imshow(new_Image);