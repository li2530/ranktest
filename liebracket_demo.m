%% This the demo script for the Liebracket function

clear
clc
close all

% Define the symbolic variables
x1 = sym('x1','real')
x2 = sym('x2','real')
x3 =sym('x3','real')
x4 = sym('x4','real')
ad_fng = sym('ad_fng','real')

%% First example:

% Define the vector fields
f = [ x2, x1*x4^2 - sin(x3), x4, 0 ]'
g = sym([  0 0 0 1]')

% Define the order of variables
x = [x1,x2,x3,x4]

% Set the order the iterated lie bracket
n = 3;

% Call the Lie Bracket Function
ad_fng=liebracket(f,g,x,n)

%% Second example:

% Define the vector fields
f = [ x1*x2*x3, x1^2, x2^3 ]'
g = [  x3, x1, x2^2]'

% Define the order of variables
x = [x1,x2,x3]

% Set the order the iterated lie bracket
n = 1;

% Call the Lie Bracket Function
ad_fng=liebracket(f,g,x,n)
