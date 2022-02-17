function BW = graphcut3(r)
L = superpixels(r,500);

f = drawrectangle(gca,'Position',[90 70 60 150],'Color','b');

foreground = createMask(f,r);
b1 = drawrectangle(gca,'Position',[1 1 50 50],'Color','r');
b2 = drawrectangle(gca,'Position',[180 50 20 90],'Color','r');
background = createMask(b1,r) + createMask(b2,r);
BW = lazysnapping(r,L,foreground,background);
figure
imshow(labeloverlay(r,BW,'Colormap',[0 1 0]))
end



