function histVector = imageHist(inputImage)
    [M,N] = size(inputImage);
    histVector = single(zeros(256,1));
    for i = 1 : M
        for j = 1 : N
            Intensity = int32(inputImage(i,j));
            histVector(Intensity + 1,1) = histVector(Intensity + 1,1) + 1;
        end
    end
end

