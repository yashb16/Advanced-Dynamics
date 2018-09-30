syms x 

y = x*x + 2*x + 1;

d = qur(y,x)

function q = qur(a,b)

q = diff(a,b);

end