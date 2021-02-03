clear all

objs=objects();
o=object();
o=o.box(0,0,4,100.0,'g');
objs=objs.add_obj(o);
o=object();
o=o.box(0,0,100,4.0,'g');
objs=objs.add_obj(o);
o=object();
o=o.box(96,0,4,100,'g');
objs=objs.add_obj(o);
o=object();
o=o.box(0,96,100,4,'g');
objs=objs.add_obj(o);

o=object();
o=o.box(40,40,20,20,'g');
objs=objs.add_obj(o);

o=object();
o=o.buggy(30,20);
objs=objs.add_obj(o);

objs.draw();
objs.motors(100,100,1)

