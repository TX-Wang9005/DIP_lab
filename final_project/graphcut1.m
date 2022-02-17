function BW = graphcut1(RGB)
L = superpixels(RGB,500);
f = drawrectangle(gca,'Position',[100 70 70 200],'Color','b');
foreground = createMask(f,RGB);
b1 = drawrectangle(gca,'Position',[20 20 50 50],'Color','r');
b2 = drawrectangle(gca,'Position',[1 269 35 35],'Color','r');
background = createMask(b1,RGB);% + createMask(b2,RGB);
BW = lazysnapping(RGB,L,foreground,background);
end