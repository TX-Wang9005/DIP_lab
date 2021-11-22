function output_s = addSinNoise(input_s, A, u0, v0)
    [M,N] = size(input_s);
    noise = zeros(M,N);
    for x = 1 : M
        for y = 1 : N
            noise(x,y) = A * sin(2*pi*(u0 * x / M + v0 * y / N));
        end
    end
    output_s = input_s + noise;
end

