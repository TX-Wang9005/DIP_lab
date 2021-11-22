clear;
close all;
input = imread('Fig0507(a).tif');
mu = 0;
sigma = (20/256)^2;
output_g = addGaussianNoise (input, mu, sigma );
Ps = 0.1;
Pp = 0.1;
output_p = addImpulseNoise (input, 0, Pp);
output_s = addImpulseNoise (input, Ps, 0);
output_ps = addImpulseNoise (input, Ps, Pp);
subplot(2,3,1);imshow(input);title("input")
subplot(2,3,2);imshow(output_g);title("Gaussian noise")
subplot(2,3,3);imshow(output_p);title("Pp = 0.1")
subplot(2,3,4);imshow(output_s);title("Ps = 0.1")
subplot(2,3,5);imshow(output_ps);title("Pp = Ps = 0.1")


