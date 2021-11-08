%% Input Image
clear;
close all;
inputImage = imread('Fig0441(a).tif');
inputImage = im2single(inputImage);
[M,N] = size(inputImage);
subplot(2, 2, 1); imshow(inputImage); title('input')
%% shift
for x = 1 : M
    for y = 1:N
        inputImage(x,y) = inputImage(x,y) * (-1)^(x + y);
    end
end
%% D = 60
input_f = fft2(inputImage);
GHPF = myGHPF(60,M,N);
answer_1 = real(ifft2(GHPF.*input_f));
for x = 1 : M
    for y = 1:N
        answer_1(x,y) = answer_1(x,y) * (-1)^(x + y);
    end
end
subplot(2,2,2); imshow(answer_1); title('D = 60')
%% D = 160
GHPF = myGHPF(160,M,N);
answer_2 = real(ifft2(GHPF.*input_f));
for x = 1 : M
    for y = 1:N
        answer_2(x,y) = answer_2(x,y) * (-1)^(x + y);
    end
end
subplot(2,2,3); imshow(answer_2); title('D = 160')