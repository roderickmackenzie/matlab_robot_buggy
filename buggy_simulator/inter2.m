function [ x y hit] =intersection (x0,y0,x1,y1,x2,y2,x3,y3)

	if (x1==x0)
		if (x3==x2)
				x=-1
				y=-1
				hit=false
			return
		end
	end

	if (x1==x0)
		x=x0
	elseif (x3==x2)
		x=x2
	else
		div=((y3-y2)/(x3-x2)-(y1-y0)/(x1-x0));
		rhs=x2*(y3-y2)/(x3-x2)-y2+y0-x0*(y1-y0)/(x1-x0);
		x=rhs/div;
		y=((y1-y0)/(x1-x0))*(x-x0)+y0;
	end



	hit =false;
	y_max=max(y2,y3);
	y_min=min(y2,y3);
	x_max=max(x2,x3);
	x_min=min(x2,x3);

	if (y>y_min) && (y<y_max)
		hit=true;
	end

	if (x>x_min) && (x<x_max)
		hit=true;
	end

end 
