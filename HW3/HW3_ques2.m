clc
clear all

syms y1 y2 y2_d t

x = 7*t;
x_dd = diff(diff(x));

theta = [0 ; 0.5*t ; t ; 1.5*t];
theta_d = diff(theta,t);

initcon = [0.75 ; 0];
tspan = [0 ; 40];

for i=1:4
    [t , y] = ode45(@(t,y) fun(y, x_dd, i, theta_d(i) , t) , tspan , initcon)
    plot(t , y(:,1))
    hold on
end

xlabel('Time in seconds')
ylabel('L(t) in meters')
title('Q2. (a) to (d)')


function f = fun(y, x_dd, j, d , t)

f = zeros(2,1);

y1 = y(1);
y2 = y(2);

mp = 2;
k = 18;
lo = 0.5;
g = 9.81;

x_dd = x_dd;
theta = [0 ; 0.5*t ; t ; 1.5*t];
theta_d = d;

%(k*lo - mp*g*cos(theta) + mp*x_dd*sin(theta) - (k-mp*(theta_d^2))*y1)/mp

f(2) = (k*lo - mp*g*cos(theta(j)) + mp*x_dd*sin(theta(j)) - (k-mp*(theta_d^2))*y1)/mp;
f(1) = y2;
end
