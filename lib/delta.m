function [ret] = delta(r0,g0,b0,r1,g1,b1,tol) ;

r=abs(r0-r1);
g=abs(g0-g1);
b=abs(b0-b1);

ret=(r+g+b)/3;

if ret<tol
ret=0;
else
ret=1;
end
end
