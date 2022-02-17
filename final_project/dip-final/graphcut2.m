function BW = graphcut2(r)
L = superpixels(r,500);
front=[173 58;76 516;568 528;394 353;425 258;387 59];
f = drawpolygon('Position',front);
foreground = createMask(f,r);

%b1=impoly;
b1=[17 189;23 254;57 175];
b1 = drawpolygon('Position',b1);
%b1 = drawrectangle('Position',[30 180 30 60],'Color','r');
b2 = drawrectangle('Position',[440 290 50 50],'Color','r');

background = createMask(b1,r)+createMask(b2,r);
BW = lazysnapping(r,L,foreground,background);
end

