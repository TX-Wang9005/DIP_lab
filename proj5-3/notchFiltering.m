function [output_f, Notch] = notchFiltering(input_f, D0, u0, v0)
    [M,N] = size(input_f);
    Notch = zeros(M,N);
    for u = 1 : M
        for v = 1 : N
            D1 = ((u-M/2-u0)^2 + (v-N/2-v0)^2)^0.5;
            D2 = ((u-M/2+u0)^2 + (v-N/2+v0)^2)^0.5;
            if D1 <= D0 || D2 <= D0
                Notch(u,v) = 0;
            else
                Notch(u,v) = 1;
            end
        end    
    end
    Notch = single(Notch);
    output_f = input_f .* Notch;
end

