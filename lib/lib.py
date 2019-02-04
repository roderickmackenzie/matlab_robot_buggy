#!/usr/bin/env python
import sys
import RPi.GPIO as GPIO
import time
from time import sleep

pwm1=None
pwm2=None
TRIG = 27
ECHO = 17

TRIG2 = 9
ECHO2 = 11

def gpio_open():
	global TRIG
	global ECHO
	global TRIG2
	global ECHO2
	GPIO.setmode(GPIO.BCM)
	GPIO.setwarnings(False)
	GPIO.setup(TRIG,GPIO.OUT)
	GPIO.setup(ECHO,GPIO.IN)

	GPIO.setup(TRIG2,GPIO.OUT)
	GPIO.setup(ECHO2,GPIO.IN)

def leds(inp):
	pins=[26,19,13,6]
	if len(inp)!=4:
		print("Input the wrong size")
		return -1

	pos=[]
	for i in range(0,4):
		if inp[i]=="1":
			pos.append(True)
		else:
			pos.append(False)

	for i in range(0,len(pins)):
		GPIO.setup(pins[i],GPIO.OUT)

	for i in range(0,len(pins)):
		GPIO.output(pins[i],pos[i])

def measure():
	global TRIG
	global ECHO

	GPIO.output(TRIG,False)

	time.sleep(0.05)

	GPIO.output(TRIG,True)
	time.sleep(0.00001)
	GPIO.output(TRIG,False)

	
	count=0
	pulse_start = time.time()
	while GPIO.input(ECHO)==0:
		pulse_start = time.time()
		count=count+1
		if count>10000:
			return 10000

	count=0
	pulse_end = time.time()
	while GPIO.input(ECHO)==1:
		pulse_end = time.time()
		count=count+1
		if count>10000:
			return 10000



	pulse_duration = pulse_end - pulse_start

	distance = pulse_duration * 17150

	distance = round(distance,2)

	return distance

def measure2():
	global TRIG2
	global ECHO2

	GPIO.output(TRIG2,False)

	time.sleep(0.05)

	GPIO.output(TRIG2,True)
	time.sleep(0.00001)
	GPIO.output(TRIG2,False)


	count=0
	pulse_start = time.time()
	while GPIO.input(ECHO2)==0:
		pulse_start = time.time()
		count=count+1
		if count>10000:
			return 10000

	count=0
	pulse_end = time.time()
	while GPIO.input(ECHO2)==1:
		pulse_end = time.time()
		count=count+1
		if count>10000:
			return 10000



	pulse_duration = pulse_end - pulse_start

	distance = pulse_duration * 17150

	distance = round(distance,2)

	return distance

def gpio_close():
		GPIO.cleanup()

def motor(power1,power2):
	global pwm1
	global pwm2
	motor1A = 23	#Input A
	motor1B = 24	#Input B
	motor1E = 18		#PWM

	motor2A = 16
	motor2B = 20
	motor2E = 21

	fd1=True
	fd0=False
	fd1=False

	if power1>0:
		fd0=True

	if power2>0:
		fd1=True


	#setup pins
	GPIO.setup(motor1A,GPIO.OUT)
	GPIO.setup(motor1B,GPIO.OUT)
	GPIO.setup(motor1E,GPIO.OUT)

	GPIO.setup(motor2A,GPIO.OUT)
	GPIO.setup(motor2B,GPIO.OUT)
	GPIO.setup(motor2E,GPIO.OUT)

	#motor0


	pwm1 = GPIO.PWM(motor1E,100)

	if fd0 == True:
		GPIO.output(motor1A,GPIO.HIGH)
		GPIO.output(motor1B,GPIO.LOW)
		GPIO.output(motor1E,GPIO.HIGH)
	else:
		GPIO.output(motor1A,GPIO.LOW)
		GPIO.output(motor1B,GPIO.HIGH)
		GPIO.output(motor1E,GPIO.HIGH)


	#motor1


	pwm2 = GPIO.PWM(motor2E,100)


	fd1 = not fd1 
	if fd1 == True:

		GPIO.output(motor2A,GPIO.HIGH)
		GPIO.output(motor2B,GPIO.LOW)
		GPIO.output(motor2E,GPIO.HIGH)
	else:
		GPIO.output(motor2A,GPIO.LOW)
		GPIO.output(motor2B,GPIO.HIGH)
		GPIO.output(motor2E,GPIO.HIGH)

	pwm1.start(abs(power1))
	pwm2.start(abs(power2))



