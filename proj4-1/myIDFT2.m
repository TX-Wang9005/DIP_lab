function output = myIDFT2(input)
    [M,N] = size(input);
    output = zeros(M, N);
    for x = 0 : M - 1
        for y = 0 : N - 1
            s = 0;
            for u = 0 : M - 1
                for v = 0 : N - 1
                    s = s + input(u + 1,v + 1)*exp(2 * 1i * pi *(u * x / M + v * y / N));
                end
            end
            output(x + 1,y + 1) = s / M / N;
        end
    end
    output = im2single(output);
end

