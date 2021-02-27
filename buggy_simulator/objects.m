classdef objects
   properties
	objs;
	pol0;
	pol1;
   end

   methods
      function obj = objects(self)
			objs(1:1) = object();
			obj.pol0=1.0;
			obj.pol1=-1.0;
			obj.objs=objs;
      end

      function ret = add_obj(self,o)
			self.objs(max(size(self.objs)))=o;
			self.objs(max(size(self.objs))+1)=o;
			%self.objs(1)=o;
			ret=self;
      end

      function ret = draw(self)
			clf
			hold on
			for i=1:max(size(self.objs)-1)
				self.objs(i).draw();
			end
      end

      function [ ret_x ret_y] = intersect(self,x2,y2,x3,y3)
			pos=1;
			ret_x=[];
			ret_y=[];
			for i=1:max(size(self.objs)-1)
				if (self.objs(i).transparent==false)
					for l=1:max(size(self.objs(i).x_lines))
						x0=self.objs(i).x_lines(l);
						y0=self.objs(i).y_lines(l);
						if (l+1>max(size(self.objs(i).x_lines)))
							x1=self.objs(i).x_lines(1);
							y1=self.objs(i).y_lines(1);
						else
							x1=self.objs(i).x_lines(l+1);
							y1=self.objs(i).y_lines(l+1);
						end

						[x y hit]=intersection (x0,y0,x1,y1,x2,y2,x3,y3);
						if (hit==true)
							ret_x(pos)=x;
							ret_y(pos)=y;
							pos=pos+1;
						end
					end
				end

			end
      end

      function ret = find_buggy(self)
			for i=1:max(size(self.objs)-1)
				if (strcmp(self.objs(i).name,'buggy')==true);
					ret=i;
					return
				end

			end
      end

	function ret=motors(self,m0,m1,time)
		hit=true;
		ib=self.find_buggy();
		n=0

		while n<time
			obj=self.objs(ib);
			x2=obj.x0;
			y2=obj.y0;
			self.objs(ib)=obj.move(m0*self.pol0,self.pol1*m1)
			self.draw();

			x3=x2+sin(obj.ang)*110.0;
			y3=y2+cos(obj.ang)*110.0;

			%[x y ]=self.intersect(x2,y2,x3,y3);
			%if hit==true
			%	plot(x, y, 'ro', 'MarkerSize', 30);
			%end

			%line([x2 x3],[y2 y3],'color','b');
			%printf("echo=%f\n",self.echo_sensor());
			pause(0.05);
			n=n+0.20;
		end
		ret=self;
	end

	function ret=echo_sensor(self)
		x=0;
		y=0;
		hit=true;

		ib=self.find_buggy();
		obj=self.objs(ib);
		x2=obj.x0;
		y2=obj.y0;

		x3=x2+sin(obj.ang)*110.0;
		y3=y2+cos(obj.ang)*110.0;

		[x y ]=self.intersect(x2,y2,x3,y3);

		plot(x, y, 'ro', 'MarkerSize', 30);

		x=x-x2;
		y=y-y2;
		dist=[];
		for i=1:max(size(x))
			dist(i)=(x(i)*x(i)+y(i)*y(i))^0.5;
		end

		ret=min(dist);

	end

	function ret=poweroff(self)
		ib=self.find_buggy();
		self.objs(ib).power=false;
		self.objs(ib)=self.objs(ib).buggy(self.objs(ib).x0,self.objs(ib).y0);
		self.draw();
		ret=self;
	end

	function ret=gpio_write(self,pin_number,value)
		ib=self.find_buggy();
		self.objs(ib).gpio_pins(pin_number)=value;
		self.objs(ib)=self.objs(ib).buggy(self.objs(ib).x0,self.objs(ib).y0);
		self.draw();
		ret=self;
	end


	function ret=pin_in(self)
		ret=load('switches.txt');
	end


	function ret=camera(self)
		file_name=sprintf("%d.jpg",randi([0 15] ,1,1));
		full_path=fullfile(fileparts(mfilename('fullpath')),"images",file_name)
		a=imread(full_path);
		imwrite(a,'image.jpg','jpg');
	end
   end




end
