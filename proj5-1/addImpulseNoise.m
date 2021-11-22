function output_p = addImpulseNoise (input_s, Ps, Pp)
    [M,N] = size(input_s);
    white = int16(M * N * Ps);
    black = int16(M * N * Pp);
    output_p = input_s;
    for i = 1 : white
            y_coord = randi(N);
            x_coord = randi(M);
            output_p(x_coord,y_coord) = 255;
    end
    for i = 1 : black
            y_coo = randi(N);
            x_coo = randi(M);
            output_p(x_coo,y_coo) = 0;
    end
    
end

