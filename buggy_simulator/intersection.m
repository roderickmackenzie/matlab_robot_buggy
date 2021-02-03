function [ x y hit] =intersection (x0,y0,x1,y1,x2,y2,x3,y3)

    xdiff = [x0 - x1, x2 - x3];
    ydiff = [y0 - y1, y2 - y3];
	x=-1;
	y=-1;
	hit=false;

    div = rdet(xdiff, ydiff);
	if div == 0

		return;
	end
    d = [rdet([x0,y0],[x1,y1] ), rdet([x2,y2],[x3,y3])];
    x = rdet(d, xdiff) / div;
    y = rdet(d, ydiff) / div;

	hit =false;
	y_max_obj=max(y0,y1);
	y_min_obj=min(y0,y1);
	x_max_obj=max(x0,x1);
	x_min_obj=min(x0,x1);

	y_max_line=max(y2,y3);
	y_min_line=min(y2,y3);
	x_max_line=max(x2,x3);
	x_min_line=min(x2,x3);

	if (y>=y_min_obj) && (y<=y_max_obj)
		if (x>=x_min_obj) && (x<=x_max_obj)
			if (y>=y_min_line) && (y<=y_max_line)
				if (x>=x_min_line) && (x<=x_max_line)
					hit=true;
				end
			end
		end
	end


end 
