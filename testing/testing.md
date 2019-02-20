How to test the buggy
=====================

Open the terminal.

Testing the background script is running
----------------------------------------
~~~~
type ps aux |grep python
~~~~
If you see a line with /home/pi/lib/boot.py then the back end software is working.
If you do not see this line then the camera is not plugged in.

Test the batteries
------------------
If the voltage is below 1.25 V THROW THEM AWAY and get new ones.


Testing the echo sensor
-----------------------

~~~~
cd io
cat echo.dat'
~~~~

The value should not be 10000, if it is then fix the echo sensor.

Test the motors
---------------
in the directory 'io'

type

~~~~
echo "100 100" >motors.dat
~~~~

to start the motors.

If they do not start fix the circuitry.

Then type:

~~~~
echo "0 0" >motors.dat'
~~~~

to stop the motors.
