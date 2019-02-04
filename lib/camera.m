function [] = camera() ;

file_id=fopen('/home/pi/io/camera.dat','w');
fprintf(file_id,'1');
fclose(file_id);
while(exist('/home/pi/io/camera.dat')==!0)
1;
end
sleep(0.5)
end
