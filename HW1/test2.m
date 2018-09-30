clc
clear

syms x th1 th2 th1_d th2_d th1_dd th2_dd;

[t , x] = ode45(@fun, [0 20], [0.2 0.3 0.4 0.5])
% convert the expressions of th_dd that was computed above to state space
% form
% Using the ode45 to solve the state space equation

plot(t,x(:,1))
hold on
plot(t,x(:,3))
title('\theta1 and \theta2 as a function of Time')
xlabel('Time (s)')
ylabel('\theta (rad)')
legend('\theta1(t)' , '\theta2(t)')



% To convert the 2nd order differential equation to single order, we have
% used the state space method
function f = fun(t, x)
th1 = x(1);
th1_d = x(2);
th2 = x(3);
th2_d = x(4);

% The values of p and q were taken from the 1st code 
p = (12*cos(th1 - th2)*sin(th1 - th2)*th1_d^2 + 9*sin(th1 - th2)*th2_d^2 + 245*sin(th1) - 147*cos(th1 - th2)*sin(th2))/(4*(3*cos(th1 - th2)^2 - 5));
q = -(20*sin(th1 - th2)*th1_d^2 + 9*cos(th1 - th2)*sin(th1 - th2)*th2_d^2 - 245*sin(th2) + 245*cos(th1 - th2)*sin(th1))/(3*(3*cos(th1 - th2)^2 - 5));
 
f = [th1_d ; p ; th2_d ; q];
end

