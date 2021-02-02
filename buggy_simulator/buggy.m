clear all

objs=objects();
o=object();
o=o.box(0,0,4,100.0);
objs=objs.add_obj(o);
o=object();
o=o.box(0,0,100,4.0);
objs=objs.add_obj(o);
o=object();
o=o.box(96,0,4,100);
objs=objs.add_obj(o);
o=object();
o=o.box(0,96,100,4);
objs=objs.add_obj(o);

o=object();
o=o.box(40,40,20,20);
objs=objs.add_obj(o);

o=object();
o=o.buggy(30,20);
objs=objs.add_obj(o);

objs.draw();

x=0
y=0
hit=true
for n=1:1000
	ib=objs.find_buggy()
	obj=objs.objs(ib)
	x2=obj.x0
	y2=obj.y0

	x3=x2+sin(obj.ang)*110.0;
	y3=y2+cos(obj.ang)*110.0;

	objs.objs(ib).ang=objs.objs(ib).ang+0.02
	objs.objs(ib)=objs.objs(ib).buggy(x2,y2)
	objs.draw()

	[x y ]=objs.intersect(x2,y2,x3,y3);
	if hit==true
		plot(x, y, 'ro', 'MarkerSize', 30)
	end

	line([x2 x3],[y2 y3],'color','b');
	pause(0.051)
end
