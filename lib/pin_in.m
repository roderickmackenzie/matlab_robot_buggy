function [ ret ] = pin_in()

pintext = [] ;


file_id=fopen('/home/pi/io/switch.dat','r');
states=fscanf(file_id,'%s');
fclose(file_id);

ret=[1,1];


for n = 1:length(states)
  ret(n) = str2num(states(n)) 
  
end

end
