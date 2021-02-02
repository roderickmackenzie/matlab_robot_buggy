classdef objects
   properties
	objs;
   end

   methods
      function obj = objects(self)
			objs(1:1) = object();
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
				if (strcmp(self.objs(i).name,'buggy')==true)
					ret=i
					return
				end

			end
      end

   end


end
