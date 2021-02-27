function ret = buggy_control()
	objs=objects();

	%object 1
	o=object();
	o=o.box(0,0,4,100.0,'r');
	objs=objs.add_obj(o);

	%object 2
	o=object();
	o=o.box(0,0,100,4.0,'g');
	objs=objs.add_obj(o);

	%object 3
	o=object();
	o=o.box(96,0,4,100,'b');
	objs=objs.add_obj(o);

	%object 4
	o=object();
	o=o.box(0,96,100,4,'r');
	objs=objs.add_obj(o);

	%object 5
	o=object();
	o=o.box(40,40,20,20,'g');
	objs=objs.add_obj(o);

	%object 6
	o=object();
	o=o.buggy(30,20);
	objs=objs.add_obj(o);

	objs.draw();
	ret=objs;
	disp('Buggy initialized!');
end



