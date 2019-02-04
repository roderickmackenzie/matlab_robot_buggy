function [] = pin_out(pins,delay)

	file_id=fopen('/home/pi/io/leds.dat','w');
	fprintf(file_id,'%s',pins);
	fclose(file_id);
	pause(delay)
	file_id=fopen('/home/pi/io/leds.dat','w');
	fprintf(file_id,'0000');
	fclose(file_id);

end
