clear;
close all;
inputImage = imread('Fig0441(a).tif');
inputImage = im2single(inputImage);
subplot(1, 2, 1); imshow(inputImage); title('inputImage')
[M,N] = size(inputImage);
m_Image = zeros(M,N); 
for x = 0 : M - 1 
    for y = 0 : N-1
        m_Image(x+1,y+1) = inputImage(x+1,y+1) * (-1)^(x+y);
    end
end
outputImage = fft2(m_Image);
fl = log(abs(outputImage)+1);
fm = max(fl(:));
spec = im2gray(fl/fm);
subplot(1, 2, 2); imshow(spec); title('Spectrum')
DC_s = abs(outputImage(M/2+1,N/2+1))/M/N;
display(DC_s);
DC = 0;
for x = 1 : M
    for y = 1 : N
        DC = DC + inputImage(x,y);
    end
end
DC = DC / M / N;
display(DC);