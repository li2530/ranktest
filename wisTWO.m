clear
clc
close all
% Define the data
r1 = sym([0.8 0.6 ]');
 
r2 = sym([ 1.0 0 ]');
 
%%
test_time=3
documentation=1:test_time
for N = 1:test_time
%% Set Hyper-Parameter
    Width = 2
% Define the symbolic variables
 
    ad_fng = sym('ad_fng','real');
    A = sym('A%d%d',[N+1, 1]);
    W = sym('W%d%d',[N+1 Width]);
%% 原函数
 
    Data1=exp(W*r1);
    Data2=exp(W*r2);
     
 
%% Data Inner Product(内积线性相加) 带有一阶导数
    Dot_Data1=exp(W*r1);
    Dot_Data2=exp(W*r2);
    
%% Put Sigma(激活函数)带有一阶导数
    Output_Data1=A.*Dot_Data1; 
    Output_Data2=A.*Dot_Data2;
    
%% Tensor Product
    f=Output_Data1*r1';
    ff=[Data1,f];
    f=ff(:);
    
    g= Output_Data2*r2';
    gg=[Data2,g]
    g=gg(:) ;
   
    
    WW=W(:);
    AA=A(:) ;
    SYM=[A,W];
    SYM=SYM(:);
    n =4;
 
% Call the Lie Bracket Function
    ad_fng=liebracket(f,g,SYM,n);
    %ad_fnh=liebracket(f,h,SYM,n);
    %ad_gnh=liebracket(g,h,SYM,n);
    ad_gnf=liebracket(g,f,SYM,n);
    %ad_hnf=liebracket(h,f,SYM,n);r
    %ad_hng=liebracket(h,g,SYM,n);
    %D=[f,g,h,ad_fng(:,:),ad_fnh(:,:),ad_gnh(:,:),ad_gnf(:,:),ad_hnf(:,:),ad_hng(:,:)];
    D=[f,g,ad_fng(:,:),ad_gnf(:,:)];%ad_fng(:,3),ad_fng(:,4),ad_fng(:,5),ad_fng(:,6),ad_fng(:,7),ad_fng(:,8)]%,ad_fng(:,9),ad_fng(:,10)]%,ad_fng(:,11),ad_fng(:,12),ad_fng(:,13),ad_fng(:,14),ad_fng(:,15)];
    documentation(N)=rank(D);
end    
%D=[f(:),g(:),ad_fng(:,2)]