addpath('/home/pi/lib')
camera();
a=imread('/home/pi/image.jpg');
a=flipud(a);
%imshow(a)
len=size(a)

[r0,g0,b0]=get_color(a,200,200,20)
power=100

while(1)
	motors_adv(0,0)
	camera();
	a=imread('/home/pi/image.jpg');
	a=flipud(a);
	[r1,g1,b1]=get_color(a,200,200,10);
	delta_cam=delta(r0,g0,b0,r1,g1,b1,50)
	if delta_cam==1
		power=power*-1;
		disp('flip due to cam')
		fflush(stdout);
	end

	if delta_cam!=1
		count=0
		motors_adv(-power,-power)
		while(count<10)

			val=echo_sensor();
			val
			fflush(stdout);
			if val<50 && val>10
				val=1;
				motors_adv(0,0)
				sleep(2)
				power=power*-1
				disp('flip due to sensor')
				fflush(stdout);
				break
			else
				val=0;
			end

			val=echo_sensor2();
			if val!=-1
				val
				fflush(stdout);
				if val<50 && val>10
					val=1;
					motors_adv(0,0)
					sleep(2)
					power=power*-1
					disp('flip due to sensor2')
					fflush(stdout);
					break
				else
					val=0;
				end
			end

			sleep(0.1)
			count=count+1;
		end
	end

if val==1 || delta_cam==1
	flash()
	disp('turn')
	motors(-power,-power,2.0)
	motors(power,-power,rand(1)*2+1)
	%motors_adv(-power,-power)
	motors_adv(0,0)
	sleep(0.1)	
	camera();
	a=imread('/home/pi/image.jpg');
	a=flipud(a);
	[r0,g0,b0]=get_color(a,200,200,20)

end

end

