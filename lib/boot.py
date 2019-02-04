#!/usr/bin/env python
import os
from time import sleep
from lib import measure
import RPi.GPIO as GPIO

from lib import gpio_open
from lib import gpio_close
from lib import motor
from lib import measure
from lib import measure2
from lib import leds
import shutil
from test_auto_run import test_auto_run
import picamera
import sys

camera = picamera.PiCamera()
camera.resolution=(640,480)
camera.framerate=90

old_power1=0.0
old_power2=0.0


files_dir='/home/pi/io'
def init():
	global files_dir
	if os.path.isdir(files_dir)==False:
		os.mkdir(files_dir)

	if os.path.isfile(os.path.join(files_dir,'echo2.dat'))==True:
		os.remove(os.path.join(files_dir,'echo2.dat'))

	f=open(os.path.join(files_dir,'leds.dat'),"w")
	f.write('0000')
	f.close()

	f=open(os.path.join(files_dir,'motors.dat'),"w")
	f.write('0.0 0.0')
	f.close()

	f=open(os.path.join(files_dir,'camera.dat'),"w")
	f.write('0')
	f.close()

def debug(text):
	f=open("/home/pi/debug.txt","a")
	f.write(text+"\n")
	f.close()


def poll_switch():
	pins=[ 2,3]
	ret=""
	for i in range(0,len(pins)):

		GPIO.setup(pins[i],GPIO.IN)

		if GPIO.input(pins[i])==1:
			ret=ret+"1"
		else:
			ret=ret+"0"

		f=open(os.path.join(files_dir,'switch.dat'),"w")
		f.write(str(ret))
		f.close()

def poll_measure():
	global files_dirc
	ret=measure()
	if ret!=-1.0:
		f=open(os.path.join(files_dir,'echo.dat'),"w")
		f.write(str(ret))
		f.close()

def poll_measure2():
	if os.path.isfile("/home/pi/enable_sensor2")==True:
		global files_dirc
		ret=measure2()
		if ret!=-1.0:
			f=open(os.path.join(files_dir,'echo2.dat'),"w")
			f.write(str(ret))
			f.close()

def poll_camera():
	global camera
	try:
		if os.path.isfile(os.path.join(files_dir,'camera.dat'))==True:
			f=open(os.path.join(files_dir,'camera.dat'),"r")
			lines=f.readlines()
			f.close()
			for i in range(0,len(lines)):
				lines[i]=lines[i].rstrip()
			lines=lines[0].split()
			lines=int(lines[0][0])

			if lines==1:
				camera.capture('/home/pi/image.jpg','jpeg',True)
				os.remove(os.path.join(files_dir,'camera.dat'))
	except:
		print('camera error',sys.exc_info())


def poll_motor():
	global files_dir
	global old_power1
	global old_power2
	power1=0.0
	power2=0.0
	try:
		f=open(os.path.join(files_dir,'motors.dat'),"r")
		lines=f.readlines()
		f.close()
		for i in range(0,len(lines)):
			lines[i]=lines[i].rstrip()
		lines=lines[0].split()
		power1=float(lines[0])
		power2=float(lines[1])

		if power1!=old_power1 or power2!=old_power2:
			motor(power1,power2)
			old_power1=power1
			old_power2=power2
	except:
		print('error in motor')

def poll_leds():
	global files_dir
	try:
		f=open(os.path.join(files_dir,'leds.dat'),"r")
		lines=f.readlines()
		f.close()
		for i in range(0,len(lines)):
			lines[i]=lines[i].rstrip()
		lines=lines[0]
		leds(lines)
	except:
		print('error in leds')

init()
gpio_open()

print "buggy autorun"
debug("booted")
lines=[]

while(1):
	poll_motor()
	test_auto_run()
	poll_measure()
	poll_measure2()
	poll_leds()
	poll_switch()
	poll_camera()
	sleep(0.1)

gpio_close()
