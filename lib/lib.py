#!/usr/bin/env python
import sys
import RPi.GPIO as GPIO
import time
from time import sleep
from echo_sensor import echo_sensor_setup


def gpio_open():
	echo_sensor_setup()


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


def gpio_close():
		GPIO.cleanup()


