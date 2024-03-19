
clear all
fun=@vie_green2d;
global wavelen ppw
% wavelens = [0.00012207031 0.00024414062 0.00048828125 0.0009765625 0.001953125 0.00390625 0.0078125 0.015625];
wavelens = [0.00048828125 0.00024414062 0.00012207031];
for ii = 1:size(wavelens,2)
wavelen=wavelens(ii);
ppw=4.0;
tol=1e-6;
ds = wavelen/ppw;
N=round(1/ds);
outputfile=['QTT_VIE2D_admissible_N_',num2str(N),'_tol_',num2str(tol),'.txt'];
if exist(outputfile, 'file')==2
    delete(outputfile);
end
diary(outputfile) 
disp(["N=",num2str(N)])
% N=8192;
s = log2(N);
d=2*s;
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

