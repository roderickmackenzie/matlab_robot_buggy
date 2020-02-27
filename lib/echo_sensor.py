#!/usr/bin/env python
import sys
import RPi.GPIO as GPIO
import time
from time import sleep

TRIG = 27
ECHO = 17

def echo_sensor_setup():
	global TRIG
	global ECHO
	GPIO.setmode(GPIO.BCM)
	GPIO.setwarnings(False)
	GPIO.setup(TRIG,GPIO.OUT)
	GPIO.setup(ECHO,GPIO.IN)

def echo_sensor():
	global TRIG
	global ECHO

	GPIO.output(TRIG,False)

	time.sleep(0.01)

	GPIO.output(TRIG,True)
	time.sleep(0.00001)
	GPIO.output(TRIG,False)

	
	count=0
	last=GPIO.input(ECHO)


	while(1):
		cur=GPIO.input(ECHO)
		if (cur==True) and (last==False):
			break
		last=cur
		print(cur)
		count=count+1
		if count>10000:
			return -1

	count=0
	pulse_start = time.time()
	while(1):
		cur=GPIO.input(ECHO)
		if (cur==False) and (last==True):
			break
		last=cur
		print(cur)
		count=count+1
		if count>10000:
			return -1

	pulse_end = time.time()
	#f.close()

	pulse_duration = pulse_end - pulse_start

	distance = pulse_duration * 17150

	distance = round(distance,2)

	return distance

if __name__=='__main__':
	echo_sensor_setup()
	print(echo_sensor())
