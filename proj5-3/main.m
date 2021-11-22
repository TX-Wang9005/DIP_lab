%%
clear;
close all;
input = imread('Fig0526(a).tif');
input = im2single(input);
subplot(3,3,1);imshow(input);title("input")
%%
[M,N] = size(input);
u0 = 100;
v0 = 100;
output_s = addSinNoise(input, 0.5, u0, v0);
subplot(3,3,2);imshow(output_s);title("output s")
%%
pf = fftshift(fft2(output_s));
spec = log(abs(pf) + 1);
spec = im2gray(spec/max(spec(:)));
subplot(3,3,3);imshow(spec);title("frequency domain")
%%
[output_f, Notch] = notchFiltering(pf, 2, u0,v0);
subplot(3,3,4);imshow(Notch);title("notch filter")
spec_n = log(abs(output_f) + 1);
spec_n = im2gray(spec_n/max(spec_n(:)));
subplot(3,3,5);imshow(spec_n);title("notch filter image")
output_f = fftshift(output_f);
output_ans = real(ifft2(output_f));
subplot(3,3,6);imshow(output_ans);title("output image")
%%
psnr = computePSNR(input, output_ans);
display(psnr);
