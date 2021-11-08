function output = myDFT2(input)
    [M,N] = size(input);
    output = zeros(M, N);
    for u = 0 : M - 1
        for v = 0 : N - 1
            s = 0;
            for x = 0 : M - 1
                for y = 0 : N - 1
                    s = s + input(x + 1,y + 1)*exp(-2 * 1i * pi *(u * x / M + v * y / N));
                end
            end
            output(u + 1,v + 1) = s;
        end
    end
    output = im2single(output);
end

