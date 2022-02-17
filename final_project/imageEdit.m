function outputImage = imageEdit(background, target,x, y)
    [M,N,C] = size(target);
    %[M_b, N_b, C] = size(background);
    outputImage = background;
    for i = 1 : M
        for j = 1 : N
            if target(i,j,1) ~=  0 || target(i,j,2) ~=  0 || target(i,j,3) ~=  0
                outputImage(x + i - 1, y + j - 1, 1) = target(i,j, 1);
                outputImage(x + i - 1, y + j - 1, 2) = target(i,j, 2);
                outputImage(x + i - 1, y + j - 1, 3) = target(i,j, 3);
            else
                outputImage(x + i - 1, y + j - 1, 1) = background(x + i - 1, y + j - 1, 1);
                outputImage(x + i - 1, y + j - 1, 2) = background(x + i - 1, y + j - 1, 2);
                outputImage(x + i - 1, y + j - 1, 3) = background(x + i - 1, y + j - 1, 3);
            end
        end
    end
end

