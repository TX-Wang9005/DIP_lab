function outputImage =  powerlawTransform(inputImage, c, r)
    a = double(inputImage) / 255;
    outputImage = single(c .* a.^r);
end

