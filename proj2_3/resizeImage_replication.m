function resizedImage = resizeImage_replication(originalImage, scalingFactor)
    [M,N,C] = size(originalImage);
    M_r = round (M * scalingFactor);
    N_r = round (N * scalingFactor);
    f = scalingFactor;
    resizedImage = zeros(M_r, N_r, C, 'uint8');

    if scalingFactor >= 1
        for i = 1 : M
            for j = 1 : N
                for ver = 1 : f
                    for hor = 1 : f
                        resizedImage((i - 1) * scalingFactor + ver,(j - 1) * scalingFactor + hor) = originalImage(i,j);
                    end
                end
            end
        end      
    else
        s = floor(1/f);
        for i = 1 : M_r
            for j = 1 : N_r
                resizedImage(i,j) = originalImage(i * s - 2, j * s - 2);
            end
        end   
    end 

end

