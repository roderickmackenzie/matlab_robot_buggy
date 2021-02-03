classdef object
   properties
	x0
	y0
	x_lines=[]
	y_lines=[]
	colors=[]
	ang=21*(2*3.1415926/360.0)
	transparent
	name=''
	leds="11110000"
   end

   methods
      function ret = box(self,x0,y0,dx,dy,color)
			self.x_lines=[self.x_lines ; x0 x0+dx x0+dx x0    ];
			self.y_lines=[self.y_lines ; y0 y0    y0+dy y0+dy ];
			self.colors=[self.colors ; color ];
			self.transparent=false;
			ret=self
      end

      function ret = buggy(self,x0,y0)
			x1=[0.0 5.0 5.0 0.0   ; -1.0 0.0 0.0 -1.0 ; -1.0 0.0 0.0 -1.0  ; 5.0 6.0 6.0 5.0 ; 5.0 6.0 6.0 5.0 ];
			y1=[0.0 0.0 10.0 10.0 ;  0.0 0.0 1.0 1.0  ;  9.0 9.0 10.0 10.0 ; 0.0 0.0 1.0 1.0 ; 9.0 9.0 10.0 10.0 ];
			self.colors=['b','r','r','r','r' ];
			for i=1:8
				x1=[x1 ; 1.0 4.0 4.0 1.0  ];
				y1=[y1 ; 0.5+i 0.5+i 1.5+i 1.5+i  ];
				if self.leds(i)=='1'
					self.colors=[self.colors 'r'];
				else
					self.colors=[self.colors 'g'];
				end
			end

			x1=x1-mean(mean(x1));
			y1=y1-mean(mean(y1));
			x=x1*cos(2*3.14-self.ang)-y1*sin(2*3.14-self.ang);
			y=y1*cos(2*3.14-self.ang)+x1*sin(2*3.14-self.ang);


			x=x+x0;
			y=y+y0;
			self.x0=x0;
			self.y0=y0;

			self.x_lines=x;
			self.y_lines=y;

			self.transparent=true;
			self.name='buggy';
			ret=self;
      end

      function draw(self)
			hold on
			for section =1:size(self.x_lines)(1)
				fill(self.x_lines(section,:),self.y_lines(section,:),self.colors(section));
			end
      end

   end


end
