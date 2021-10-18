function [output, scaledLaplacian] = laplacianFiltering(inputImage, laplacianMask, scale)
    lap = spatialFiltering(inputImage, laplacianMask);
    scaledLaplacian = scale * lap;
    output = inputImage + scaledLaplacian; 
end

