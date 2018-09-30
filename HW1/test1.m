clc

syms th1 th2 th1_d th2_d th1_dd th2_dd;

% The equations are not in standard form, so the first step is to separate the expressions of ?1 and ?2. 
% For this purpose, the equations from the book are written in the A?.x? = B?.
A = [4 1.8*cos(th2-th1) ; 0.48*cos(th2-th1) 0.36];
B = [1.8*(th2_d^2)*sin(th2-th1)-49*sin(th1) ; -0.48*(th1_d^2)*sin(th2-th1)-5.88*sin(th2)];

% The equation is solved using the linsolve function
th_dd = linsolve(A,B);

th1_dd = th_dd(1)
th2_dd = th_dd(2)
% Storing the values

