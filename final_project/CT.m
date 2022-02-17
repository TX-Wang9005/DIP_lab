function out = CT( T,S )

cT=makecform('srgb2lab') ;
T=applycform(T,cT); S=applycform(S,cT);
Ls=T(:,:,1); Ls=Ls(:); Lt=S(:,:,1); Lt=Lt(:);
as=T(:,:,2); as=as(:); at=S(:,:,2); at=at(:);
bs=T(:,:,3); bs=bs(:); bt=S(:,:,3); bt=bt(:);
mLS=mean(Ls); mLT=mean(Lt);
maS=mean(as); maT=mean(at);
mbS=mean(bs); mbT=mean(bt);
s_Lsource=std(Ls,0); s_Ltarget=std(Lt,0);
s_asource=std(as,0); s_atarget=std(at,0);
s_bsource=std(bs,0); s_btarget=std(bt,0);
S(:,:,1)=((S(:,:,1)-mLT).*(s_Lsource/s_Ltarget))+mLS;   %
S(:,:,2)=((S(:,:,2)-maT).*(s_asource/s_atarget))+maS;   %
S(:,:,3)=((S(:,:,3)-mbT).*(s_bsource/s_btarget))+mbS;   %
cT=makecform('lab2srgb');
out=applycform(S,cT);
end

