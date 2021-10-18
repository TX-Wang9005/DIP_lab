function outputImage = spatialFiltering(inputImage, mask)
    [M,N,C] = size(inputImage);
    Mask_s = size(mask);
    a = floor(Mask_s(1) / 2);
    b = floor(Mask_s(2) / 2);
    outputImage = zeros(M, N, C, 'single');
    
    processImage = padarray(inputImage, [a,b], 'both');
    for i = 1 : M
        for j = 1 : N
            outputImage(i, j) = processImage(i, j) * mask(3, 3) + processImage(i, j+1) * mask(3, 2) + processImage(i, j+2) * mask(3, 1) + processImage(i+1, j) * mask(2, 3) + processImage(i+1, j+1) * mask(2, 2) + processImage(i+1, j+2) * mask(2, 1) + processImage(i+2, j) * mask(1, 3) + processImage(i+2, j+1) * mask(1, 2) + processImage(i+2, j+2) * mask(1, 1);
        end
    end
            
end

