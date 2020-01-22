function [] = pin_out_adv(pins)

	file_id=fopen('/home/pi/io/leds.dat','w');
	fprintf(file_id,'%s',pins);
	fclose(file_id);
end
