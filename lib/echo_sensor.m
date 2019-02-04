function [ dis ] = echo_sensor() ;

	file_id=fopen('/home/pi/io/echo.dat','r');
	dis=fscanf(file_id,'%f');
	fclose(file_id);

end
