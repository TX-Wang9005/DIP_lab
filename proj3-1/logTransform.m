function outputImage = logTransform(InputImage,c)
    r = single(InputImage) / 255;
    outputImage = single(c*log2(1+r)/(c*log2(2)));
end

