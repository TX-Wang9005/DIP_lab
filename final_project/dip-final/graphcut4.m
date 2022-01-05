function BW = graphcut4(r)
L = superpixels(r,500);
f1 = drawpolygon(gca,'Position',[151.25 30;89.75 186.75;256.25 198.75;208.25 5],'Color','b');
f2 = drawpolygon(gca,'Position',[70.25 218.25;92.75 419.25;43.25 575.25;265.25 587.25;269.75 230.25],'Color','b');
foreground = createMask(f1,r) + createMask(f2,r);
b1 = drawpolygon(gca,'Position',[208.25 630.75;250.25 855.75;341.75 870.75;346.25 599.25],'Color','r');
b2 = drawpolygon(gca,'Position',[251.75 12;277.25 179.25;338.75 183.75;341.75 19],'Color','r');
b3 = drawpolygon(gca,'Position',[286 304;275 386;298 431;339 436;341 303],'Color','r');
b4 = drawpolygon(gca,'Position',[7.25 165.75;34.25 165.75;50.75 477.75;-0.25 462.75],'Color','r');
background =createMask(b1,r) + createMask(b2, r) + createMask(b3,r) + createMask(b4,r);
BW = lazysnapping(r,L,foreground,background);
end

