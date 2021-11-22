clear;
close all;
input = imread('Fig0526(a).tif');
input = im2single(input);
subplot(2,3,1);imshow(input);title("input")
%%
T = 1;
a = 0.1;
b = 0.1;
input_f = fftshift(fft2(input));
[output_f, H] = addMotionBlur(input_f, T, a, b);
output_ans = real(ifft2(ifftshift(output_f)));
subplot(2,3,2);imshow(output_ans);title("blur image")
%%
output_s = addSinNoise(output_ans, 0.1, 100, 100);
subplot(2,3,3);imshow(output_s);title("blur+noise")
input_d = fftshift(fft2(output_s));
%%
answer_1 = wienerFiltering(input_d, H, 0.001);
original_1 = real(ifft2(ifftshift(answer_1)));
subplot(2,3,4);imshow(original_1);title("k = 0.001")
answer_2 = wienerFiltering(input_d, H, 0.01);
original_2 = real(ifft2(ifftshift(answer_2)));
subplot(2,3,5);imshow(original_2);title("k = 0.01")
answer_3 = wienerFiltering(input_d, H, 0.1);
original_3 = real(ifft2(ifftshift(answer_3)));
subplot(2,3,6);imshow(original_3);title("k = 0.1")
psnr_1 = computePSNR(input, original_1);
psnr_2 = computePSNR(input, original_2);
psnr_3 = computePSNR(input, original_3);
display(psnr_1);
display(psnr_2);
display(psnr_3);