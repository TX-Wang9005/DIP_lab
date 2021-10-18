clear;
close all;
inputImage = imread('Fig0308(a).tif');
log_Image = logTransform(inputImage, 1);
gamma_Image1 =  powerlawTransform(inputImage, 1, 0.04);
gamma_Image2 =  powerlawTransform(inputImage, 1, 0.5);
gamma_Image3 =  powerlawTransform(inputImage, 1, 0.8);
gamma_Image4 =  powerlawTransform(inputImage, 1, 2);
gamma_Image5 =  powerlawTransform(inputImage, 1, 5);
subplot(3,3,1);imshow(inputImage);title('Input Image')
subplot(3,3,2);imshow(log_Image);title('Log Image')
subplot(3,3,3);imshow(gamma_Image1);title('gamma = 0.04')
subplot(3,3,4);imshow(gamma_Image2);title('gamma = 0.5')
subplot(3,3,5);imshow(gamma_Image3);title('gamma = 0.8')
subplot(3,3,6);imshow(gamma_Image4);title('gamma = 2')
subplot(3,3,7);imshow(gamma_Image5);title('gamma = 5')