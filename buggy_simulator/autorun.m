clear all
objs=buggy_control();
objs.pol0=1.0;
objs.pol1=1.0;
%objs=objs.motors(100,80,2);
objs.echo_sensor();
objs.pin_in()
objs.camera()

ads
while(1)
	objs.gpio_write(26,1);
	objs.gpio_write(19,1);
	objs.gpio_write(13,1);
	objs.gpio_write(6,1);
	pause(1e-3)
	objs.gpio_write(26,0);
	objs.gpio_write(19,0);
	objs.gpio_write(13,0);
	objs.gpio_write(6,0);
	pause(1e-3)
	objs.poweroff();
end
adds
objs=objs.gpio_write(26,1)
objs=objs.motors(100,100,2);
for n=1:2
	objs=objs.gpio_write(26,0);
	pause(1)
	objs=objs.gpio_write(26,1);
	objs.echo()
	pause(1)
end
%objs=objs.poweroff();
objs=objs.motors(100,-100,2);

objs=objs.motors(100,100,4);
objs=objs.gpio_write(26,0)
for n=1:4
	objs=objs.gpio_write(26,0);
	pause(1)
	objs=objs.gpio_write(26,1);
	objs.echo()
	pause(1)
end
objs=objs.poweroff();
