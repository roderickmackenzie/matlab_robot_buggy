classdef buggy
   properties
	objs
   end

   methods
      function ret = setup_enviroment(self)
			self.objs=objects();
			o=object();
			o=o.box(0,0,4,100.0,'g');
			self.objs=self.objs.add_obj(o);

			o=object();
			o=o.box(0,0,100,4.0,'g');
			self.objs=self.objs.add_obj(o);

			o=object();
			o=o.box(96,0,4,100,'g');
			self.objs=self.objs.add_obj(o);

			o=object();
			o=o.box(0,96,100,4,'g');
			self.objs=self.objs.add_obj(o);

			o=object();
			o=o.box(40,40,20,20,'g');
			self.objs=self.objs.add_obj(o);

			o=object();
			o=o.buggy(30,20);
			self.objs=self.objs.add_obj(o);

			self.objs.draw();
			%self.objs=self.objs.motors(100,100,1)

			%objs(1:1) = object();
			%obj.objs=objs;
			ret=self
      end

 	function ret=motors(self,m0,m1,len)
		self.objs=self.objs.motors(100,100,1)
		ret=self
	end
   end


end


