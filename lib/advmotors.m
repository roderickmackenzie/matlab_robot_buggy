function [] = motors(Power1,Power2,delay)

system([ "python /home/pi/lib/motors.py " num2str(Power1) " " num2str(Power2) " " ...
  num2str(delay) ]) ;
 
 end
