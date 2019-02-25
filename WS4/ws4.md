Worksheet 4
===========

Your buggy is trapped in a valley, infested by a rather large rabbit which likes to eat buggies.  Your buggy must find the exit to the valley without bumping into the valley walls, or encountering the rabbit.  There are also some rocks (smarties) scattered around the valley which your buggy must avoid as they can get trapped in the wheels.  The exit is denoted by a white chalk road (in this case an A3 sheet of white paper.)  As a group, edit your buggy code so that your buggy will search for and find the white road as quickly as possible without bumping into the rabbit or running over the smarties. This task is worth 25% of the project mark.  50% will be given if you attempt the exercise with a reasonable answer.  The other 25% of the marks will be given, for finding the white piece of paper.  And the remaining 25% will be given depending on how well your buggy performs, and any cool your answer is(!)  Rules of the game:

-The buggy must find the white piece of paper to win the game.
-If it bumps into the bunny, the game is over and you can only get a maximum of 75% for this task.
-Your buggy must avoid mountains (plastic boxes) and valley walls (detonated by the barrier).  If it hits these object the game will not end but it will waste time.
-Avoid the smarties so that the buggy does not get stuck.

How you achieve this aim is up to you. Here are some ideas of how to solve the problem.
-Use your answers to WS3 to detect the problem 


        ◦ Move the buggy randomly, until it sees the white piece of paper (The easy option).
        ◦ Do a systematic search for the piece of paper.
        ◦ Try to store where the buggy has been and search based on the past history of the moments.
    • Your buggy has enough hardware to accomplish this task, but if you fancy adding extra motors and or acoustic sensors we do have some spare. But you have to figure out how to use them :)


Question 6:
-----------
On the raspberry PI, if you wanted to get an image from the camera and identify what it was.  You would use the camera() command to take a new image which will save it in /home/pi/image.jpg, and then the imread command to read in the image, followed by the flipud command to orientate the image correctly, followed by get_color to extract the average rgb values.  You will need to do this a lot, so it therefore makes sense to put them all in a single function.

Step 1: Define a new function, called get_real_world_rgb, in a new file called get_real_world_rgb.m which calls, camera(), imread(), and get_color in order, and returns the r,g,b values returned by get_color.
Step 2: Clearly the camera() command won’t work on the PC as it does not have a camera attached to it, and if you try to run this function it will just return an error.  Therefore, edit  get_real_world_rgb so that it accepts a variable called count.  In the function get_real_world_rgb, move the function calls camera(), imread(), and get_color commands in side an if statement, and only allow them the be executed if count is equal to -1.  Thus the functions which only work on the buggy, will only be called if count==-1.
Step 3: Now edit the function again, to display the words ‘running on a PC’, if count is not equal to -1.  By changing the value of count, you can now select if the functions applicable to the PI are run or not, thus your code is now multi platform. :)
Step 4: Very often you won’t have access to a piece of equipment you have been asked to program.  An example of this could be developing code to run a cruise missile, not every programmer who programs the missile will have one on his desk.  So often programmers need to write functions to act like hardware would act even though the hardware is not present.
We are now going to edit the function,  get_real_world_rgb, to act as if it were on the PI, even though we are using it on a PC.  Within the if statement where ‘running on a PC’ is printed out, add an if else statement, where if the value of count equals 5, the image object.jpg is loaded into variable ‘a’, and  if the value of count is not equal to 5 the image desk.jpg is loaded into variable ‘a’, then follow this by the  get_color commands to enable the function to return the r,g,b values of the image.  What you should have now is a function, which will capture data from the camera of the PI, when count is equal to -1, and then count is above -1 it will load images from disk to pretend the function is running on the PI.
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
