Worksheet 3 - Output to the real world
=====================================

Motor control - basic output
----------------------------

The buggy has two motors.  These can be used to drive the buggy forwards, backwards or to turn it, by running one motor forwards and one backwards.  By the end of this section you will be able to move the buggy in any direction.

The Octave/MATLAB command to drive the motors is:

```
motors(power1,power2,delay)
```

Power1 and power2 control the power going to the motors, the power must be a number from 0 to 100. The delay is the time for which the motors run.  So for example if you wanted to move the buggy forwards for one second, you would use the command.

```
motors(100,100,1)
```

If you want to run a motor in reverse simply put a minus in front of the motor power.  For example, 

```
motors(-100,-100,1)
```

To stop the motors, use the command:

```
motors(0,0,1)
```

**Question 1:**   Now, make a new script called my_motor_script.m and save it under /home/pi/.  Make sure you add addpath(‘/home/pi/lib’) to the top of the script so that, Octave can find the  buggy functions. [I’m not going to tell you to do this again, I’m going to assume you know this has to be done by you automaticly.] Now try out the commands above to move the motors.  Did you wire them up correctly?  If they spin in different directions, just swap the wires around in the motor driver board.

```
Hint 1: You will need to use the addpath(‘/home/pi/lib/’) command before these commands will work though.

Hint 2: Position your buggy so the wheels are off the ground, you can use the box your PI came in to do this. If you don’t do this your buggy will fly off the table.
```

**Step 1.1:** We are going to write a script to drive the buggy forward two meters then drive it backwards for two meters, then repeat this.  Edit the script my_motor_script.m, so that it contains a while loop, which will run for ever (hint: while(1) .... end).  In the while loop, add the motor commands to drive the buggy forward and backwards initially set the time the motors run to be 5 seconds.

**Step 1.2:** Place your buggy on the tool box or some other object so it's wheels are off the ground and not touching anything.  Now click run, and the motors should start to drive forward and then backwards.

**Step 1.3:**  Try not to let your buggy run the motors for too long as it will run down the batteries.  Press ctr+c to stop the scrip running, then type:

```
motors(0,0,1) 
```
To stop the motors.

**Step 1.3:**  Now, assuming your script works, re-save you script as /home/pi/autorun.m. Unplug all the cables from the buggy turn it off and place it on the floor.  Turn the buggy on with the power switch, and it should run of batteries. It  will take about 30 seconds to boot, but when it does it will run the file autorun.m and your buggy should start going forwards and backwards.

**Step 1.4:**  Tune the timings in your motor commands so that the buggy goes exactly 2 meters forwards and two meters backwards.

**Question 2:**  We are now going to experiment with making the buggy turn, after this exercise the buggy will be able to drive in a square, to make the buggy turn you will have to stop one wheel and drive the other forward, you will be able to turn faster by running one motor forward and running one in reverse.  Edit your script so that the buggy drives forward, turns right, moves forward, turns right, moves forward.... etc.... until it has reached it's starting position.  The buggy should move in a square.


Advanced motor control
----------------------

The commands you just used to control the motor are simple, and work effectively.  The drawback of these commands is that while the commands are running, your code can not do anything else.  There is another more advanced motor control command that enables you to do other things while the motors are running.  This command is

```
motors_adv(power,power)
```

If you issue this command the motors will start, and just keep running.  Notice there is no timing command, thus once you turn the motors on you will have to turn it off by issuing:

```
motors_adv(0,0)
```

Often when controlling hardware there are various versions of commands, some easy to use and some harder with more power.

**Question 3.1:**  Notice that in the previous examples, when you issued the command motors(100,100,5) command the buggy did a wheely.  This because the buggy is slightly heavier towards the back and has a lot of motor power.  We are now going to write two functions to gently ramp the power of the motors when setting off, so that it stops the buggy doing a wheely.  Make a new script called start_now.m and using a for loop and the motors_adv command, ramp the power of the motors from 0 to 100, over a period of 3 seconds.

**Question 3.2:**  Now make a new script called stop_now.m and make the function ramp the power of the buggy from 100 to 0 over a period of 3 seconds.

**Question 3.3:**  Turn you scripts stop_now and start_now, into functions so that they can be called from a third script start_stop.m.  Edit your script start_stop.m, so that it runs starts the buggy, runs the motors for three seconds, then stops the buggy.

**Question 3.4:**  Now edit your script called stop_stat, so that it gradually starts moving the buggy, then runs the motors on 60 percent power for 5 seconds, then gradually stops it.  What do you notice?

**Question 3.5:**  You should have noticed that the buggy accelerated from a standing start to 100% power, then as you ran the motors_adv(70,70) command, it suddenly slowed down, next as it was about to decelerate it accelerated to 100% power then slowed to a stop.  The motion of the buggy should have been a bit jerky.  If you had been in a car like this you would get whip lash!  The reason for the jerkiness, lies in your functions stop_now and start_now, always starting and ending at 100% power.  To prevent this you would have to know the current speed of the buggy and start any acceleration at this speed.  The command:

```
get_motors_state()
```

returns an array of size two, the 1st element contains the speed of the first motor, the 2nd element is the speed of the second motor.

**Question 3.6:**  Make a new script called goto_speed.m.  The purpose of this script will be to smoothly accelerate the buggy from it's current speed to a desired speed.
* Make the script start your buggy moving forward at speed 100 for 3 seconds.
* Then define a variable called target, which contains the next desired speed of the buggy, set it's value to 0.  We are going to slow (or speed up) the buggy in 10 steps over a period of 5 seconds.
*  Subtract the current speed of the buggy from the target speed, to get the difference in speed between it's current speed and the desired speed .  Now divide this number by 10, and store the result in a viable called ds.
* Write a while loop to count from the current speed to the desired speed in steps of ds, use the variable current_speed to store the current speed of the buggy, display this variable to the screen.
* Next insert a sleep command to make the loop pause for 0.5 seconds each time it runs.
* Finally add the motors_adv command to the loop, so that the variable current_speed is sent to the motors.  After completing these steps, your buggy should start moving the decelerate from 100 to 0.  Now change the initial speed to 70 and see what happens.


**Question 3.7a:**  Make the script goto_speed into a function, and add an input parameter into the function definition which allows the user to choose the number of steps taken to reach the desired speed.  Generate another script which called fast_slow.m, this script should use the function goto_speed to do the following:

* Accelerate the buggy from a standing start to 100% speed over a period of 5 seconds
* Gradually reduce the speed to 50% power over a period of three seconds.
* Rapidly accelerate to 100%, then remain at this power for 4 seconds.
* Suddenly stop.



Controlling output pins on the PI
---------------------------------

So far you have used relatively high level commands to control the motors, hidden behind these motor commands is quite a lot of [complex code](https://en.wikipedia.org/wiki/Pulse-width_modulation).  However, very often you will need to be able to turn and off individual outputs from a computer.  You might for example want to detonate a war head, activate an air bag or turn on some lights.  To do these type of actions you must understand how to control voltages on the output pins of a computer.  In this example we will be controlling an LED bar graph, although you could replace the LEDs with any component you wanted to drive.

**Step 1:**  Find in your tool box, the LED bar graph component and wire it into your circuit board as shown below, the resistors should go into the black/blue strip.  Then connect the other side of the LEDs to the PI using the jumper cables, refer to Figure 2 to understand which pins on the PI the LEDs should be connected to, these pins on the PI are called GPIO pins or general-purpose input/output pins.

**Question 3.7b:**  Which GPIO pins are the motors connected to?

<p align="center">
<img src="./images/drawing.png" width=40%>

Figure 1: The LED bar graph wired into the bread board.
</p>

<p align="center">
<img src="./images/pinout.jpg" width=40%>

Figure 2: The pin out of the PI.
</p>

**Question 3.8:** The resistors are used to limit the current flowing thought the LED, so that it does not burn out.  If you don't use the resistors, then the LEDs will glow very bright for a few moments before getting dim and permanently breaking (don't do this!).  If the PI supplies 3.3V from it's output pins and the resistors have a value of 330 Ohms pins, how much current will flow through the LED when turned on?  Does it matter which way around the LED is placed? 

 **Question 3.9:** In your report draw a circuit diagram of the LED, raspberry PI (you should represent this as a 3.3 V battery), the resistor label all the voltages and currents in the circuit.

**Question 3.10:** If you look closely at each resistor, you will see that they have some colored lines on them, these lines tell you which value the resistors are in Ohms.  Use [this](http://www.resistorguide.com/resistor-color-code/) guide to write down the value of the resistors in figure 3.  If you look at the ultrasonic sensor driver board you will see two more resistors, write down the value of these resistors in your report.

<p align="center">
<img src="./images/resistors.jpg" width=40%>

Figure 3: Examples of resistors.
</p>

**Step 2:** Now the LEDs have been connected, the pins can be turned on with the command

```
set_pin(GPIO_PIN_NUMBER,1)
```

and can be turned off with the command
```
set_pin(GPIO_PIN_NUMBER,0)
```

**Question 3.11:** Make a short script called ws_3_3_11.m to turn all four LEDs on then wait one second then turn all the LEDs off.  If it does not work, you have probably connected your LED block the wrong way around, just lift it off the board rotate it through 180 degrees and plug it back in. [LEDs only work one way around, I did not tell you this before, because there was a 50% chance of you plugging it in the right way :)].

**Question 3.12:** Edit your script so that the LEDs will flash on and off with a one second interval for ever. 

**Question 3.13:** Now make a new script to turn your LEDs randomly at regular intervals of 0.5 seconds.

```
Hint, first pick a random number between 1 and 4, then use an if-elseif-end statement, to turn the on a given pattern of LEDs depending on which random number was chosen.
``

**Question  Make a new script called knight_rider.m and make the active LED bounce backwards and forwards along the display, as shown in this video :): 
https://www.youtube.com/watch?v=hG44lIO_bss
This can be done with a while loop,  the pin_out command and the wait command. [If you’ve not seen the TV program…. you’ve missed nothing. :) ]
Question 5: Write a program to turn on the LEDs when the distance detected from the echo sensor is less than 10cm, and to turn them off when the the distance is larger than 10cm.  Save this as echo_led.m



Old
---
out the values from the echo sensor.  Now using an if statement, run the motors for 1 second if the distance detected is more than 45cm, if a distance of less than 45 cm, is detected make the code wait for 5 second using the sleep command.


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
