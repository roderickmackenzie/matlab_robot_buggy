classdef object
   properties
	x0
	y0
	x_lines=[]
	y_lines=[]
	ang=21*(2*3.1415926/360.0)
	transparent
	name=''
   end

   methods
      function ret = box(self,x0,y0,dx,dy)
			self.x_lines=[self.x_lines x0 x0+dx x0+dx x0    ]
			self.y_lines=[self.y_lines y0 y0    y0+dy y0+dy ]
			self.transparent=false
			ret=self
      end

      function ret = buggy(self,x0,y0)
			x1=[0.0 5.0 10.0 ]
			y1=[0.0 20.0 0.0]
			x1=x1-mean(x1)
			y1=y1-mean(y1)
			x=x1*cos(2*3.14-self.ang)-y1*sin(2*3.14-self.ang)
			y=y1*cos(2*3.14-self.ang)+x1*sin(2*3.14-self.ang)


			x=x+x0
			y=y+y0
			self.x0=x0
			self.y0=y0

			self.x_lines=x
			self.y_lines=y
			self.transparent=true
			self.name='buggy'
			ret=self
      end

      function draw(self)
			hold on
			fill(self.x_lines,self.y_lines,'g')
      end

   end


end
