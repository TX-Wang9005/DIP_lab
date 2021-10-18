clear;
close all;
inputImage = imread('Fig0338(a).tif');
inputImage = single(inputImage) / 255;
kernel = [0 1 0; 1, -4, 1; 0 1 0];
[output, scaledLaplacian] = laplacianFiltering(inputImage, kernel, 3);
kernel_D = [1 1 1; 1, -8, 1; 1 1 1];
[output_D, scaledLaplacian_D] = laplacianFiltering(inputImage, kernel_D, 3);
con = conv2(inputImage, kernel, 'same');
con_D = conv2(inputImage, kernel_D, 'same');
subplot(2, 2, 1); imshow(inputImage); title('3.46(a)')
subplot(2, 2, 2); imshow(scaledLaplacian); title('3.46(b)(scaled)')
subplot(2, 2, 3); imshow(output); title('3.46(c)')
subplot(2, 2, 4); imshow(output_D); title('3.46(d)');
