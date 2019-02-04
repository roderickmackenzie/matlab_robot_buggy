function [] = motors(Power1,Power2,delay)

	file_id=fopen('/home/pi/io/motors.dat','w');
	fprintf(file_id,'%f %f %f',Power1,Power2);
	fclose(file_id);
	pause(delay)
 	file_id=fopen('/home/pi/io/motors.dat','w');
	fprintf(file_id,'%f %f %f',0.0,0.0);
	fclose(file_id);
 end


