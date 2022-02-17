%% target
clear;
close all;
Target1 = imread('vc.jpg');
Target2 = imread('vc2.jpg');
Target3 = imread('noodle.jpg');
Target4 = imread('white.jpg');
%figure
%imshow(Target1);
%figure
%imshow(Target2);
figure
imshow(Target3);
figure
imshow(Target4);
%% source
Source1=imread('star.jpg');
%figure
%imshow(Source1);
Source2=imread('desert.jpg');
figure
imshow(Source2);
Source3=imread('graduate.jpg');
figure
imshow(Source3);
%% color transfer
r1=CT(double(Source1)/255,double(Target1)/255);
r2=CT(double(Source1)/255,double(Target2)/255);
r3=CT(double(Source2)/255,double(Target3)/255);
r4=CT(double(Source3)/255,double(Target4)/255);
figure; imshow(r1); %title('result');
figure; imshow(r2); %title('result');
figure; imshow(r3); %title('result');
figure; imshow(r4); %title('result');
%% graph cut
%{
L = superpixels(r2,500);
figure
BW1 = boundarymask(L);
imshow(labeloverlay(r2,BW1,'Transparency',0));
%}

BW1 = graphcut1(r1);
BW2 = graphcut2(r2);
BW3 = graphcut3(r3);
BW4 = graphcut4(r4);
figure
imshow(labeloverlay(r1,BW1,'Colormap',[1 1 0]));
figure
imshow(labeloverlay(r2,BW2,'Colormap',[1 1 0]))
figure
imshow(labeloverlay(r3,BW3,'Colormap',[1 1 0]))
out1=im2uint8(r1).*uint8(BW1);
out2=im2uint8(r2).*uint8(BW2);
out3=im2uint8(r3).*uint8(BW3);
out4=im2uint8(r4).*uint8(BW4);
figure
imshow(out1);
figure
imshow(out2);
figure
imshow(out3);
%% resize
small1=imresize(out1,0.5);
%imshow(small1);
small2=imresize(out2,0.25);
%imshow(small2);
small3=imresize(out3,0.25);
%imshow(small3);
small4=imresize(out4,0.15);
%% edit
x = 240;
y = 360;
outputImage1 = imageEdit(Source1, small1,x, y);
x = 240;
y = 1;
outputImage2 = imageEdit(outputImage1, small2,x, y);
x = 120;
y = 1;
outputImage3 = imageEdit(Source2, small3,x, y);
x = 170;
y = 45;
outputImage4 = imageEdit(Source3, small4,x, y);
%% output
figure
imshow(outputImage2)
figure
imshow(outputImage3)
figure
imshow(outputImage4)