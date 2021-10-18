function [outputImage, T] = histEqualization(inputImage)
    [M,N,C] = size(inputImage);
    outputImage = zeros(M, N, C, 'uint8');
    inputHist = imageHist(inputImage);
    %plot(inputHist);title('Histogram of input image')
    s = M*N;
    p = inputHist / s;
    T = uint8(zeros(256,1));
    sum = 0;
    for i = 1 : 256
        sum = sum + 255 * p(i, 1);
        T(i,1) = round(sum);
    end   
    for i = 1 : M
        for j = 1 : N
            outputImage(i,j) = T(inputImage(i,j) + 1,1);
        end
    end
    outputHist = imageHist(outputImage);
    %plot(outputHist);title('Histogram of enhanced image')
end

