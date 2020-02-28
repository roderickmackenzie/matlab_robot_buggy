Worksheet 4 - Input from the real world
=======================================

Old
---
out the values from the echo sensor.  Now using an if statement, run the motors for 1 second if the distance detected is more than 45cm, if a distance of less than 45 cm, is detected make the code wait for 5 second using the sleep command.


Question 5: Write a program to turn on the LEDs when the distance detected from the echo sensor is less than 10cm, and to turn them off when the the distance is larger than 10cm.  Save this as echo_led.m

Q3) We are now going to edit the script to reverse the direction of the buggy if, an object is detected.  Define a variable outside the while loop called ‘direction’ set it to 1.0.  Now, if a distance below 45 cm is detected make the script multiply direction by -1.0 and wait for one second.  Now, edit the script by using an ‘if-else’ statement, to drive the buggy forwards if direction is set to 1.0 and backwards if direction is set to -1.0.
Q4) 
    • Note 1: autorun.m will only be executed, when no keyboard or mouse are present.  If you want to test autorun.m, while the screen is still connected to you PC, just unplug the keyboard and mouse, and it will be executed.
    • Note 2: Do remember to turn off the buggy before connecting it to the PC again.  If you don’t there is a risk power will be fed from the batteries to the USB port of the PC, which won’t have a good outcome. [https://www.youtube.com/watch?v=2SopsQEfoc4]
Q5) By setting one motor to a much lower power level than the other, it is possible to make the buggy turn.  Edit your script, so that when the buggy detects an object, it will:
    • Reverse for 2 seconds
    • Start going forwards again, but it run one motor slower than the other for a 3 seconds to make it turn.
    • Go forwards on full power with both motors for 3 seconds.
    • Then run the other motor slow for 3 seconds to straighten up the buggy.
This sect of actions should enable your buggy to move around one of your team mates stood in the way.  Pay with the code until it works, you may have to adjust the timings, and use a bit of creativity.  Also it may or not work so well on carpet, feel free to go and find a surface which is not carpet – like the ESLC.

Input from the outside world
Ask a demonstrator (or me :) ) for a ‘block of red switches’, I have not put these in the kits as the pins get damaged very easily.  In this final section to the work sheet, we are going to be using the switches to get input from the outside world.  Again, just like with the LEDs, these switches could be replaced with any type of sensors, gas sensors, light sensors, heat sensors, you name it you can connect it to the PI.  However, to keep things simple we are first going to play with simple off on switches first.
The bread board is getting pretty crowed now, but if you squeeze you resisters for your echo sensor right to the end, and then push the LEDs just up against them, there is enough room for the red block of switches.  This can be seen in figure 5.

Figure 5: Adding the switches to the bread board.

Wire up the switches according to the wiring diagram in figure 6, if you get lost ask a demonstrator for help.

Figure 6: Adding the switches to the bread board. The yellow boxes are resistors, they are the same as the 330 Ohm ones you used for the LEDs.

Once the switches are installed you can read their state using the pin_in() function in octave, this returns a 1D array containing the position of the switches.  Try playing with the switches and see what pin_in() returns.  The switches don’t stick to the bread board very well because they have short legs.  To turn the switches on and off I suggest you hold the red switch block down with one fingure, and toggle the switches with the a screwdriver.

Question 1: We are now going to write a script to make the buggy drive in a big circle.  If switch 1 is on, then your buggy will drive in a clockwise circle, if switch 1 is off it will drive anti clockwise circle.  When the buggy meets an object, it will stop for one second, then display the following sequences on the LEDs 1111,1110,1101,1100,1011,1010, 1001,1000,0111,0110,0101,0100,0011,0010,0001, 0000, with a 0.1 second wait between each combination of numbers.  These numbers are actually binary numbers counting from 15 to 0, (we will learn about binary numbers in second year).  Once the buggy has counted from 1111 to 0000, it should resume driving in a circle.  The task has been broken down into a series of steps below.  
    • Step 1: Make a new script called circle.m and save it. Then, use the pin_in() function, to determine if switch 1 is on or off.
    • Step 2: Using an if statement, if switch 1 is on drive the left motor faster than the right motor for 1 second.  If switch 1 is off, drive the right motor faster than the left motor for 1 second.  Test your script.
    • Step 3: After the commands for running the motors, use the echo sensor to test for an object closer than 20 cm.  If an object is detected, make the buggy code wait for 5 seconds.
    • Step 4: Use a while loop to (hint while(1)…...end)  to make your loop run forever. Now, using a series of pin_out(“xxxx”,0.1) statements, and sleep commands make the buggy display the series of binary numbers given in the above question, if an object is detected.  As soon as the number 0000 is displayed on the LEDs, the buggy should resume driving in a circle.
    • Step 5: Once your code is working take your buggy down to the Atrium of the ESLC, and test it in the big open space.

Once you have completed all the tasks, use a usb stick to extract the .m files from the buggy, copy them onto your PC, zip them, then upload them to moodle.  Each group member must do this individually although it’s a group exercise.  Next week’s session will not be so group orientated.


----------

The echo sensor


We are now going to start using the PI to control hardware.  Let’s first start off with the echo sensor as we already have it installed.  Make a new script called echo_test.m, and save this under /home/pi/.  To control the hardware of the buggy, we are going to have to use functions, which know how to talk to the hardware.  These functions are stored in /home/pi/lib.  Add the line

addpath(‘/home/pi/lib’)

to the top of your script, this will tell Octave where the functions are stored.

Now under that add the line:

echo_sensor()

and run the script.

Try placing your hand in front of the echo sensor and then moving it away, how does the number change? If the number does not change, or you get a minus number check the wiring on your echo sensor very carefully.  If all else fails call a demonstrator over for help.

Q1) Using a while loop and the sleep command, make Octave print out a distance measurement every second.  Something funny happens, when you run this script.  It will only show you the output once the script ends.  Octave does this, to make the program quicker to run [MATLAB does not do this], printing text to the screen is very slow.  However, sometimes it is useful to see the text generated by our program as it runs.  To force Octave to print out text, as the program runs add the command

fflush(stdout)
just after the command used to print the distance.

Q2) Edit your program so that it prints out the words “Too close!”, when you hold less than 5 cm front of the sensor, “I miss you!”, when your hand is not there, and “Just right”, when your hand is 20-25 cm away. Save this all under echo_test.m
