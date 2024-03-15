fun=@vie_green;
global wavelen ppw

% wavelens = [0.001953125 0.00390625 0.0078125 0.015625 0.03125 0.0625];
wavelens = [0.0625];
for ii = 1:size(wavelens,2)
wavelen=wavelens(ii);
ppw=4.0;
ds = wavelen/ppw;
N=round(1/ds);
disp(["N=",num2str(N)])
tol=1e-5;
% N=8192;
s = log2(N);
d=3*s;
inp=zeros(d,1);
inp(:)=4;
[y]=amen_cross(inp, fun, tol);
end

