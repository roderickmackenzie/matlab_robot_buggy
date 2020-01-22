%This is a new version of the buggy test without the camera

addpath('/home/pi/lib')
camera()
power=-100
rotate=false
motors_adv(0,0)
pin_out_adv("1111")

while(1)
	dist=echo_sensor();
	if dist!=-1
		dist
		fflush(stdout);
		if (dist<100)
				sleep(0.1)
				dist=echo_sensor();
				if (dist<100)
					pin_out_adv("1010")
					motors(-power,power,3)
					pin_out_adv("1111")
				end
		end


	end
	motors_adv(power,power)
	sleep(0.1)
end


