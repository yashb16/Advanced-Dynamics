clc
clear all

syms y1 y2 y2_d t

x = 7*t;
x_dd = diff(diff(x));

% theta = [0 ; 0.5*t ; t ; 1.5*t];
% theta_d = diff(theta,t);

initcon = [0.75 ; 0];
tspan = [0 ; 40];

for i=1:3
    [t , y] = ode45(@(t,y) fun(t, y, x_dd, i) , tspan , initcon)
    subplot(3,1,i)
    plot(t , y(:,1))
    hold on
    xlabel('Time in seconds')
    ylabel('L(t) in meters')
    title('')
end



function f = fun(t, y, x_dd, j)

f = zeros(2,1);

y1 = y(1);
y2 = y(2);

mp = 2;
k = 18;
lo = 0.5;
g = 9.81;

% theta = [0 ; 0.5*t ; 1*t;];
% theta_d = [0 ; 0.5 ; 1];

% theta = [1.5*t ; 2*t ; 2.5*t];
% theta_d = [1.5 ; 2 ; 2.5];

% theta = [2.9*t ; 2.99*t ; 2.999*t];
% theta_d = [2.9 ; 2.99 ; 2.999];

% theta = [3.0*t ; 3.001*t ; 3.01*t];
% theta_d = [3.0 ; 3.001 ; 3.01];

% theta = [0.03*t*t ; 0.04*t*t ; 0.05*t*t];
% theta_d = [0.06*t ; 0.08*t ; 0.1*t];

% theta_d = diff(theta);
% theta_d = double(theta_d);

%(k*lo - mp*g*cos(theta) + mp*x_dd*sin(theta) - (k-mp*(theta_d^2))*y1)/mp

f(2) = (k*lo - mp*g*cos(theta(j)) + mp*x_dd*sin(theta(j)) - (k-mp*((theta_d(j))^2))*y1)/mp;
f(1) = y2;
end
