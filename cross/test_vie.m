
clear all
fun=@vie_green;
global wavelen ppw

% wavelens = [0.001953125 0.00390625 0.0078125 0.015625 0.03125 0.0625];
wavelens = [0.0625];
for ii = 1:size(wavelens,2)
wavelen=wavelens(ii);
ppw=4.0;
ds = wavelen/ppw;
N=round(1/ds);
outputfile=['QTT_VIE_admissible_N_',num2str(N),'.txt'];
if exist(outputfile, 'file')==2
    delete(outputfile);
end
diary(outputfile) 
disp(["N=",num2str(N)])
tol=1e-2;
% N=8192;
s = log2(N);
d=3*s;
inp=zeros(d,1);
inp(:)=4;
tic;
[y]=amen_cross(inp, fun, tol);
% tt=dmrg_cross(d,inp,fun,tol);
toc
y1=round(y,tol);
% norm(y1-y)/norm(y)

maxrank = max(rank(y1))
memory=mem(y1)*16/1e9
diary off
end

