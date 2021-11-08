%% Input Image
clear;
close all;
inputImage = imread('Fig0431(d).tif');
inputImage = im2single(inputImage);
inputImage = imresize(inputImage,0.25);
[M, N] = size(inputImage);
subplot(3, 3, 1); imshow(inputImage); title('input')
%% Do padding
pad_Image = padarray(inputImage, [M N], 0, 'post');
subplot(3, 3, 2); imshow(pad_Image); title('Padding_Image')
%% Do shift

m_Image = zeros(2*M,2*N); 
for x = 0 : 2*M - 1 
    for y = 0 : 2*N-1
        m_Image(x+1,y+1) = pad_Image(x+1,y+1) * (-1)^(x+y);
    end
end
subplot(3, 3, 3); imshow(m_Image); title('Multiply (-1)^(x+y)')

%%  do FFT2
%input_f = myDFT2(m_Image);
input_f = myFFT2(m_Image);
%% spectrum of P
spec = log(abs(input_f) + 1);
spec = im2gray(spec/max(spec(:)));
subplot(3, 3, 4); imshow(spec); title('DFT')
%% spectrum of H
H = myGLPF(20, 2*M, 2*N);
GLPF = log(abs(H) + 1);
GLPF = im2gray(GLPF/max(GLPF(:)));
subplot(3, 3, 5); imshow(GLPF); title('H')
%% spectrum of HP
HP = input_f .* H;
HP_s = log(abs(HP) + 1);
HP_s = im2gray(HP_s/max(HP_s(:)));
subplot(3, 3, 6); imshow(HP_s); title('HP')
%% Do IFFT2
%output_p = myIDFT2(HP);
output_p = myIFFT2(HP);
%% return to spatial
for x = 0 : 2*M-1
    for y = 0 : 2*N-1
        output_p(x+1,y+1) = real(output_p(x+1,y+1)*(-1)^(x+y));
    end
end
subplot(3, 3, 7); imshow(output_p); title('g')
%% find answer
outputImage = zeros(M,N);
for x = 1 : M
    for y = 1 : N
        outputImage(x,y) = output_p(x,y);
    end
end
subplot(3, 3, 8); imshow(outputImage); title('g')



