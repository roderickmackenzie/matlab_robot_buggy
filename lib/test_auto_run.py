#!/usr/bin/env python
import os
from time import sleep
import RPi.GPIO as GPIO

from lib import gpio_open
from lib import gpio_close
from lib import leds
import sys

exec_code=False

def count_down_test():
	seq=["1111", "0111", "0011", "0001", "0000","1111", "0111", "0011", "0001", "0000"]
	for i in range(0,len(seq)):
		ret=os.path.isdir("/dev/input/by-id")
		if ret==True:
			return False
		leds(seq[i])
		sleep(1.0)
	return True

def test_auto_run():
	global exec_code
	if exec_code==False:
		if count_down_test()==True:
			exec_code=True
			id=os.fork()
			if id==0:
				if os.path.isfile('/home/pi/autorun.m')==True:
					print "Running autorun code"
					os.chdir("/home/pi/")
					#debug("autorun")
					os.system("octave autorun.m")
					sys.exit()
				else:
					print "Running buggy test code"
					os.chdir("/home/pi/lib")
					#debug("run")
					os.system("octave buggy_test.m")
					sys.exit()

