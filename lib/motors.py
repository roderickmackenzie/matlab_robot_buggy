#!/usr/bin/env python
import sys
import RPi.GPIO as GPIO
import time
from time import sleep

class motors():
	def __init__(self):
		self.pwm1=None
		self.pwm2=None
		self.power1_mul=1.0
		self.power2_mul=1.0

		f=open('/home/pi/lib/motors_mul.inp')
		lines=f.readlines()
		f.close()
		for i in range(0,len(lines)):
			lines[i]=lines[i].rstrip()
		lines=lines[0].split()
		self.power1_mul=float(lines[0])
		self.power2_mul=float(lines[1])

	def go(self,power1,power2):
		power1=power1*self.power1_mul
		power2=power2*self.power2_mul

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


		self.pwm1 = GPIO.PWM(motor1E,100)

		if fd0 == True:
			GPIO.output(motor1A,GPIO.HIGH)
			GPIO.output(motor1B,GPIO.LOW)
			GPIO.output(motor1E,GPIO.HIGH)
		else:
			GPIO.output(motor1A,GPIO.LOW)
			GPIO.output(motor1B,GPIO.HIGH)
			GPIO.output(motor1E,GPIO.HIGH)


		#motor1


		self.pwm2 = GPIO.PWM(motor2E,100)


		fd1 = not fd1 
		if fd1 == True:

			GPIO.output(motor2A,GPIO.HIGH)
			GPIO.output(motor2B,GPIO.LOW)
			GPIO.output(motor2E,GPIO.HIGH)
		else:
			GPIO.output(motor2A,GPIO.LOW)
			GPIO.output(motor2B,GPIO.HIGH)
			GPIO.output(motor2E,GPIO.HIGH)

		self.pwm1.start(abs(power1))
		self.pwm2.start(abs(power2))


