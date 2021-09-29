function new_Image = reduceIntensityLevel(originalImage,intensityLevel)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
step = 255 / (intensityLevel - 1);
new_Image = originalImage ./ step .* step;
end

