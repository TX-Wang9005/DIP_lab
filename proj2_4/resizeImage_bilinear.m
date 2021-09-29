function resizedImage = resizeImage_bilinear(originalImage, scalingFactor)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [M,N,C] = size(originalImage);
    M_r = ceil(M * scalingFactor);
    N_r = ceil(N * scalingFactor);
    f = scalingFactor;
    resizedImage = zeros(M_r, N_r, C, 'uint8');
    s = 1 / f;
    for i = 1 : M_r
        for j = 1 : N_r
            i_r = 1 + (i - 1) * s;
            j_r = 1 + (j - 1) * s;
            i_f = floor(i_r);
            j_f = floor(j_r);
            a = i_r - i_f;
            b = j_r - j_f;
            if floor(i_r) ~= i_r || floor(j_r) ~= j_r
                fxy = originalImage(i_f,j_f);
                fxy_d = originalImage(i_f, min(N,j_f + 1));
                fxy_r = originalImage(min(M,i_f + 1),j_f);
                fxy_dr = originalImage(min(M,i_f + 1),min(N,j_f + 1));
                resizedImage(i,j) = (1-a)*((1-b)*fxy + b*fxy_d) + a*((1-b)*fxy_r + b * fxy_dr);
            else
                resizedImage(i,j) = originalImage(i_r, j_r);
            end
        end   
    end
end

