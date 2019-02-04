function [ dis ] = echo_sensor2() ;
	if exist('/home/pi/io/echo2.dat')==2
		file_id=fopen('/home/pi/io/echo2.dat','r');
		dis=fscanf(file_id,'%f');
		fclose(file_id);
	else
		dis=-1
	end
end
