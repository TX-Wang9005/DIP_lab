function output = myGLPF(D0, M, N)
    output = zeros(M,N);
    for u = 1:M
        for v = 1:N
            output(u,v) = exp(-((u-M/2)^2+(v-N/2)^2)/2/D0/D0);
        end
    end
end

