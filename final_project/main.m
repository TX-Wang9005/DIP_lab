%% target
clear;
close all;
Target1 = imread('vc.jpg');

figure
imshow(Target1);

%% source
Source1=imread('star.jpg');
figure
imshow(Source1);

%% source selection
[x,y,z]=size(Source1);

buffer=Source1(240:340,360:460,:);  %100*100
%buffer=Source1(196:396,300:500,:);  %200*200 

I0 = im2double(imread('vc.jpg'));
I1 = im2double(buffer);
r1 = CT(im2double(Source1),im2double(Target1)); %color transform
%r1 = cf_reinhard(im2double(Target1),im2double(Source1)); %reinhard
%r1 = CT(I1,I0);          % selective color transfer
%r1 = cf_reinhard(I0,I1); % selective color transfer
figure; imshow(r1); %title('result');

%% graph cut
BW1 = graphcut1(r1);

figure
imshow(labeloverlay(r1,BW1,'Colormap',[1 1 0]));

out1=im2uint8(r1).*uint8(BW1);

figure
imshow(out1);

%% resize
small1=imresize(out1,0.5);
%imshow(small1);

x = 240;
y = 360;
outputImage1 = imageEdit(Source1, small1,x, y);

%% output
figure
imshow(outputImage1);