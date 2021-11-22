function output_f = wienerFiltering(input_f, H, K)
   [M,N] = size(input_f);
    filter = zeros(M,N);
    for u = 1:M
        for v = 1:N
            H2 = H(u,v) * conj(H(u,v));
            filter(u,v) = (1/H(u,v)).* H2./(H2 + K);
        end
    end
    output_f = input_f .* filter;

end

