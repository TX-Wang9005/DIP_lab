clear;
close all;
inputImage = imread('Fig0308(a).tif');
[output, T] = histEqualization(inputImage);

subplot(3,3,1);imshow(inputImage);title('Input Image')
subplot(3,3,2);imshow(output);title('output Image')
subplot(3,3,3);stairs(T);title('Transform function')