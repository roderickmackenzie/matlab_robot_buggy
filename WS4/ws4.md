Worksheet 4
===========

The buggy challenge
-------------------
Your buggy is trapped in a valley, infested by a rather large rabbit who likes to eat buggies.  Your buggy must find the exit to the valley without bumping into the valley walls, or encountering the rabbit.  The rabbit lives in an area marked off by *black masking tape*, if the buggy enters the area where the bunny lives it will get eaten, and the game will be over.

There are also some rocks (Easter eggs) scattered around the valley which your buggy must avoid as they can get trapped in the wheels.  The exit is denoted by a white chalk road (in this case an A3 sheet of white paper.)

As a group, edit your buggy code so that your buggy will search for and find the white road as quickly as possible without bumping into the rabbit or running over the smarties.  50% will be given if you attempt the exercise with a reasonable answer.  Another 25% will be given for for finding the white piece of paper and the remaining 25% will be given depending on how well your buggy performs, and any cool your answer is(!)  Rules of the game:

- The buggy must find the white piece of paper to win the game.
- If it bumps into the bunny, the game is over.
- Your buggy must avoid mountains (plastic boxes) and valley walls (detonated by the barrier).  If it hits these object the game will not end but it will waste time.
- Avoid the Easter eggs so that the buggy does not get stuck.

How you achieve this aim is up to you. Here are some ideas of how to solve the problem.

- Use your answers to WS3 to detect the smarties and the bunny (note the bunny will never leave the area surrounded by the black tape.)

- Use the echo sensor to avoid the objects such a the walls and the mountains.

- Move the buggy randomly, until it sees the white piece of paper *or* a systematic search for the exit.

Mod your buggy
--------------
- Your buggy has enough hardware to accomplish this task, but if you fancy adding extra motors and or acoustic sensors we do have some spare. But you have to figure out how to use them.  I think 4 motors might be a fun thing to try, I do have some spare motors for a few groups.   :wink:
- Try making the LEDs flash a set code depending on what the buggy is doing.

How to get your marks....
-------------------------
Take your buggy to the arena, demonstrate it works, then after you have completed the challenge, take your buggy to bits and place it back in the tool box  **The tool box must look exactly how it was when it was given to you.**  Once this has been signed off by a demonstrator, you may go!

---
Appendix
--------

How to use your scripts from WS3 with the buggy
-----------------------------------------------

In MATLAB you used the *imread* command, although this was useful at reading images from files on a PC, on the buggy we are able to get a live image from the camera rather. Use the *camera()* command to take a new image.  This command will save the image to /home/pi/image.jpg, and then the *imread* command to read in the image, followed by the *flipud* command to orientate the image correctly, followed by *get_color* function you wrote for WS3 to extract the average rgb values.  Hint: You will have to copy your *get_color* function from your PC to the buggy.


