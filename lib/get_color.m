function [r,g,b] = get_color(a,x_start,y_start,s) ;
r=0;
g=0.0;
b=0.0;
count=0;
for x=x_start:x_start+s
	for y=y_start:y_start+s
		r=r+int32(a(y,x,1));
		g=g+int32(a(y,x,2));
		b=b+int32(a(y,x,3));
		count=count+1.0;
	end
end

r=r/count;
g=g/count;
b=b/count;

end
