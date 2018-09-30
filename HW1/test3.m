clc
clear

tspan = [0 20];
initcon = [0.2 0.3 0.4 0.5];

[t , x] = ode45(@fun, tspan, initcon)
% convert the expressions of th_dd that was computed above to state space
% form
% Using the ode45 to solve the state space equation

%plot(t,x(:,1))
%hold on
plot(t,x(:,3))
title('\theta2 as a function of Time')
xlabel('Time (s)')
ylabel('\theta2 (rad)')
legend('\theta2(t)' , '\theta2(t)')

function f = fun(t, x)
x1 = x(1);
x2 = x(2);
y1 = x(3);
y2 = x(4);

% The equations are not in standard form, so the first step is to separate the expressions of ?1 and ?2. 
% For this purpose, the equations from the book are written in the A?.x? = B? form.
A = [3.2 1.44*cos(y1-x1) ; 1.44*cos(y1-x1) 1.08];
B = [1.44*(y2^2)*sin(y1-x1)-39.2*sin(x1) ; -1.44*(x2^2)*sin(y1-x1)-17.64*sin(y1)];

% The equation is solved using the linsolve function
th_dd = linsolve(A,B);

th1_dd = th_dd(1);
th2_dd = th_dd(2);
% Storing the values

f = [x2 ; th1_dd ; y2 ; th2_dd];
end
