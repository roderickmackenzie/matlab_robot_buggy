function [] = motors_adv(Power1,Power2)

	file_id=fopen('/home/pi/io/motors.dat','w');
	fprintf(file_id,'%f %f %f',Power1,Power2);
	fclose(file_id);
 end
