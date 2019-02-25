Worksheet 4
===========

The buggy challenge
-------------------
Your buggy is trapped in a valley, infested by a rather large rabbit who likes to eat buggies.  Your buggy must find the exit to the valley without bumping into the valley walls, or encountering the rabbit.  The rabbit lives in an area marked off by *black masking tape*, if the buggy enters the area where the bunny lives it will get eaten, and the game will be over.

There are also some rocks (smarties) scattered around the valley which your buggy must avoid as they can get trapped in the wheels.  The exit is denoted by a white chalk road (in this case an A3 sheet of white paper.)

As a group, edit your buggy code so that your buggy will search for and find the white road as quickly as possible without bumping into the rabbit or running over the smarties.  50% will be given if you attempt the exercise with a reasonable answer.  Another 25% will be given for for finding the white piece of paper and the remaining 25% will be given depending on how well your buggy performs, and any cool your answer is(!)  Rules of the game:

- The buggy must find the white piece of paper to win the game.
- If it bumps into the bunny, the game is over and you can only get a maximum of 75% for this task.
- Your buggy must avoid mountains (plastic boxes) and valley walls (detonated by the barrier).  If it hits these object the game will not end but it will waste time.
- Avoid the smarties so that the buggy does not get stuck.

How you achieve this aim is up to you. Here are some ideas of how to solve the problem.

- Use your answers to WS3 to detect the smarties and the bunny (note the bunny will never leave the area surrounded by the black tape.

- Use the echo sensor to avoid the objects.

- Move the buggy randomly, until it sees the white piece of paper.
- Do a systematic search for the exit.

Mod your buggy
--------------
Your buggy has enough hardware to accomplish this task, but if you fancy adding extra motors and or acoustic sensors we do have some spare. But you have to figure out how to use them.  I think 4 motors might be a fun thing to try.   :wink:


How to use your scripts from WS3 with the buggy
-----------------------------------------------
In MATLAB you used the *imread* command, although this was useful at reading images from files on a big computer, on the buggy we need to get a live image from the camera rather than reading data from a file. Use the *camera()* command to take a new image which will save it in /home/pi/image.jpg, and then the imread command to read in the image, followed by the flipud command to orientate the image correctly, followed by get_color to extract the average rgb values.  You will need to do this a lot, so it therefore makes sense to put them all in a single function.

Step 1: Define a new function, called get_real_world_rgb, in a new file called get_real_world_rgb.m which calls, camera(), imread(), and get_color in order, and returns the r,g,b values returned by get_color.



Question 5
----------
Step 1: Make a new script buggy.m, which defines the variable count.  Then using the variable count, counts from 0 to 100, using a while loop.  In side the while loop, use the get_real_world_rgb command to get r,g,b values.  Pass count to get_real_world_rgb.
Step 2: Using the delta function, within the loop, write out the text. ‘moving buggy forwards’, if  get_real_world_rgb returns rgb values corresponding to the desk.  And writes out the text ‘turn and reverse!!!!! Object detected!!!’ if the rgb values don’t correspond to the desk.
Step 3: Edit your script so that if an object is detected, it:
Prints out “1111”
waits for 1 second.
Prints out “0000”
waits for 1 second.
Prints out “1111”
waits for 1 second.
Prints out “0000”
waits for 1 second.

Question 6:
-----------
Your script buggy.m is now ready to be copied over to the buggy and tested. Before you do that, in buggy.m where you pass the variable count to get_real_world_rgb, replace it with -1.  This will make get_real_world_rgb call the camera() command. Also replace the disp command you used to print 1111 and 0000 to the screen with the command to turn on and off the LEDs.  Finally, replace ‘moving buggy forwards’ and ‘turn and reverse!!!!! Object detected!!!’ with commands to move the motors of the buggy.  Get a demonstrator to check your script before you copy it to the buggy, and test it. [Hint, if you want to test the buggy on the carpet you will need to determine the rgb values of the carpet for the buggy to work]
Question 7: Edit your script so that, when it starts it automatic takes a picture of what it first sees then compares all subsequent images to these values to determine if an object has been encountered.
