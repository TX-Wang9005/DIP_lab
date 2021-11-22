function output_s = addGaussianNoise (input_s, mu, sigma )
J = im2double(input_s);
output_s = J + sqrt(sigma)*randn(size(J)) + mu;
output_s = im2uint8(output_s);
end

