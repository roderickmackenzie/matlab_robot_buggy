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
```

**Question 3.14:** Make a new script called knight_rider.m and make the active LED bounce backwards and forwards along the display, as shown in this [video](https://www.youtube.com/watch?v=hG44lIO_bss) :).  This can be done with a while loop,  the set_pin command and the wait command. [If you’ve not seen the TV program…. you’ve missed nothing. :) ]


Developing your self as an engineer
-----------------------------------

For a good engineer, engineering should be as much a hobby as a profession.  You should continually be trying to improve your skills every day both in your free time and when working. Some simple ways to do this are to subscribe to some interesting Engineering youtube channels, or to learn another programming language.  Why don't you try:
* Learning Python: Here are some good links to get started.
	* https://www.python.org/about/gettingstarted/



