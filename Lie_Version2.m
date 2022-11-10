clear
clc
close all
% Define the data
r1 = sym([ -0.8 0.6 ]');
 
r2 = sym([  0.6 -0.8 ]');
%%
test_time=4
documentation=1:test_time
for N = 1:test_time
%% Set Hyper-Parameter
    Width = 2
% Define the symbolic variables
 
    ad_fng = sym('ad_fng','real');
    A = sym('A%d%d',[N+4 Width]);
%% Data Inner Product(内积线性相加)
    Dot_Data1=A*r1;
    Dot_Data2=A*r2;
%% Put Sigma(激活函数)
    Output_Data1=(A*r1).^2;%%%%%平方
    Output_Data2=(A*r2).^2;
%% Tensor Product
    f=Output_Data1*r1';
    f=f(:);
    g= Output_Data2*r2';
    g=g(:) ;
    AA=A(:) ;
    n =8;
 
% Call the Lie Bracket Function
    ad_fng=liebracket(f,g,AA,n);
    D=[f,g,ad_fng(:,2),ad_fng(:,3),ad_fng(:,4),ad_fng(:,5),ad_fng(:,6),ad_fng(:,7),ad_fng(:,8)]%,ad_fng(:,9),ad_fng(:,10)]%,ad_fng(:,11),ad_fng(:,12),ad_fng(:,13),ad_fng(:,14),ad_fng(:,15)];
    documentation(N)=rank(D)
end    
%D=[f(:),g(:),ad_fng(:,2)]