
clear all
fun=@fio3d;
global N
testmatvec=1;
% wavelens = [0.001953125 0.00390625 0.0078125 0.015625 0.03125 0.0625 0.1250];
Ns = [32];
for ii = 1:size(Ns,2)
N=Ns(ii);
outputfile=['QTT_FIO3D_sphere_N_',num2str(N),'.txt'];
if exist(outputfile, 'file')==2
    delete(outputfile);
end
diary(outputfile) 
disp(["N=",num2str(N)])
tol=1e-3;
% N=8192;
s = log2(N);
d=3*s;
inp=zeros(d,1);
inp(:)=4;
tic;
[y]=amen_cross(inp, fun, tol);
% tt=dmrg_cross(d,inp,fun,tol);
disp('time/rank/memory for the FIO operator:')
toc
y1=round(y,tol);
% norm(y1-y)/norm(y)

maxrank_A = max(rank(y1))
memory_A=mem(y1)*16/1e9



%% unfold the tt_tensor into tt_matrix and test mat-vec with a random input vector (whose TT rank is sqrt(N^0.5))
if(testmatvec==1)
    tmat=tt_matrix(y1,2,2);
    dims=[];
    for i=1:d
        dims=[dims,2];
    end
    brand = randn(dims);
    tb=tt_tensor(brand,tol);
    tic;
    tc = tmat*tb;
    disp('time/rank/memory for the matvec:')
    toc
    maxrank_c = max(rank(tc))
    memory_c=mem(tc)*16/1e9
end

diary off
end

