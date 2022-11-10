clear
clc
close all
%% Set Hyper-Parameter
Width = 3
N = 2
% Define the symbolic variables
x1 = sym('x1','real')
x2 = sym('x2','real')
x3 = sym('x3','real')
x4 = sym('x4','real')
x5 = sym('x5','real')
x6 = sym('x6','real')
ad_fng = sym('ad_fng','real')
%%%%%%%%%%%%%%%%%%%%%%
A = sym('A%d%d',[N Width])
% Define the vector fields
%% data
r1 = sym([  8/17 -15/17 ]')
 
r2 = sym([  -48/73 55/73 ]')
%% parameter
vec1 =[x1,x2]'
vec2 =[x3,x4]'
vec3 =[x5,x6]'
%% output 1
outputG1A1=exp(dot(vec1,r1))
outputG1A2=exp(dot(vec2,r1))
outputG1A3=exp(dot(vec3,r1))
%% output 2
outputG2A1=exp(dot(vec1,r2))
outputG2A2=exp(dot(vec2,r2))
outputG2A3=exp(dot(vec3,r2))
%%
f = [outputG1A1*r1(1),outputG1A1*r1(2),outputG1A2*r1(1),outputG1A2*r1(2),outputG1A3*r1(1),outputG1A3*r1(2)]'
g = [outputG2A1*r2(1),outputG2A1*r2(2),outputG2A2*r2(1),outputG2A2*r2(2),outputG2A3*r2(1),outputG2A3*r2(2)]'
% Define the order of variables

x = [x1,x2,x3,x4,x5,x6]


% Set the order of the iterated lie bracket
 
n = 10;

% Call the Lie Bracket Function
ad_fng=liebracket(g,f,x,n)
D=[f(:),g(:),ad_fng(:,2),ad_fng(:,3),ad_fng(:,4),ad_fng(:,5)]
%D=[f(:),g(:),ad_fng(:,2)]