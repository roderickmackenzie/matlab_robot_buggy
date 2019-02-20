How to test the buggy
=====================

Open the terminal.

1. type ps aux |grep python
If you see a line with /home/pi/lib/boot.py then the back end software is working.
If you do not see this line then the camera is not plugged in.

2. Test the batteries.
If the voltage is below 1.25 V THROW THEM AWAY and get new ones.

3. type 'cd io'
type cat echo.dat

The value should not be 10000, if it is then fix the echo sensor.
