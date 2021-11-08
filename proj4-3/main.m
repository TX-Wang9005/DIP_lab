%% inputImage
clear;
close all;
inputImage = imread('Fig0441(a).tif');
inputImage = im2single(inputImage);
[M,N] = size(inputImage);
subplot(2, 3, 1); imshow(inputImage); title('input')
%% shift
for x = 1 : M
    for y = 1:N
        inputImage(x,y) = inputImage(x,y) * (-1)^(x + y);
    end
end
%% D = 10
input_f = fft2(inputImage);
GLPF_1 = myGLPF(10,M,N);
answer_1 = real(ifft2(GLPF_1.*input_f));
for x = 1 : M
    for y = 1:N
        answer_1(x,y) = answer_1(x,y) * (-1)^(x + y);
    end
end
subplot(2,3,2); imshow(answer_1); title('D = 10')
%% D = 30
GLPF_2 = myGLPF(30,M,N);
answer_2 = real(ifft2(GLPF_2.*input_f));
for x = 1 : M
    for y = 1:N
        answer_2(x,y) = answer_2(x,y) * (-1)^(x + y);
    end
end
subplot(2,3,3); imshow(answer_2); title('D = 30')
%% D = 60
GLPF_3 = myGLPF(60,M,N);
answer_3 = real(ifft2(GLPF_3.*input_f));
for x = 1 : M
    for y = 1:N
        answer_3(x,y) = answer_3(x,y) * (-1)^(x + y);
    end
end
subplot(2,3,4); imshow(answer_3); title('D = 60')
%% D = 160
GLPF_4 = myGLPF(160,M,N);
answer_4 = real(ifft2(GLPF_4.*input_f));
for x = 1 : M
    for y = 1:N
        answer_4(x,y) = answer_4(x,y) * (-1)^(x + y);
    end
end
subplot(2,3,5); imshow(answer_4); title('D = 160')
%% D = 460
GLPF_5 = myGLPF(460,M,N);
answer_5 = real(ifft2(GLPF_5.*input_f));
for x = 1 : M
    for y = 1:N
        answer_5(x,y) = answer_5(x,y) * (-1)^(x + y);
    end
end
subplot(2,3,6); imshow(answer_5); title('D = 460')
