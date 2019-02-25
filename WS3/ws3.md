Worksheet 3
===========
Wile group work is fun, it’s also fun to do your own thing.  So for this worksheet, all parts are to be done individually, except Question 0 which you will have to do in a group. The usual plagiarism rules will apply for all but question 0. As ever, the demonstrators in the lab are here to help you.  For all questions but number 0, you can use matlab on the computers in C19/C20, you don’t need the buggy.
Question 0: You will have noticed that your buggy has a camera.  In this worksheet we will be using the camera to detect objects and ultimately, to help the buggy avoid objects (although that will be in the next lab).

Question 0
----------
**Step 1:** Make a new octave (MATLAB) script, add the addpath(‘/home/pi/lib’) command as usual. Then add the command camera() to the script. Save and run the script and you will see that an image has been written to /home/pi/image.jpg .  To open this image, click on the folder icon in the top left of the screen (it is the third icon from the left, next to the raspberry).  If you now double click on image.jpg you will see a picture of what the camera was looking at.

**Step 2:** Now, put the buggy on the floor, with all the wires still plugged in. Make sure the buggy has a clear view of the floor, with no wires, cables, bags books etc.. in the way. Then take another image using  your script.  Rename the image by right clicking on it, and call it ‘floor.jpg’.

**Step 3:** Next lab session your buggy will have to navigate an obstetrical course, see figure 1.  Your buggy will have to find the exit (marked by a white piece of paper), avoid being eaten by the rabbit, which is lives in an area surrounded by yellow tape, avoid bumping into the walls, and ideally find the patch of smarties before exiting the course.  These tasks can be accomplished by using a combination of the camera and the ultrasonic sensor.

<center>
<img src="./images/pen.png">
</center>
<center>
Figure 1: An example of the buggy course.
</center>

However to do this task we need sample images of the yellow tape, smarties and the white piece of paper.  Ask Rod (or a demonstrator ) for these objects.  Take pictures of each of the objects with the buggy camera naming them yellow_tape.jpg, smarties.jpg and exit.jpg.  [Hint: I would not eat the smarties… they have spent quite a long time kicking around my office!]

**Step 4:** Insert a USB stick into the PI, and copy off the images to a USB stick.  If you  can’t work out how to do this, ask a demonstrator.  We will be using these images in the rest of the questions.

The rest of the work sheet will be individual work, not group work, done on the PCs in the computer room, on your laptop or at home.  (Usual plagiarism rules apply... sorry) When you finished the programming your code, we will copy your files back to the PI, and test them.

Question 1
----------
Start up MATLAB on your PC.  We are now going to write some simple code to do some image recognition.  The image recognition will be based on color detection.  In a new script called q1.m use the imread and imshow command to read in the image and display the image.  What do you notice about the image?  Use the manual to look up what the flipud command does.  Have a go at using it.  What does it do to the image?  Save this script as q1.m

Question 2
----------
**Step 1:** We are now going to write a function to calculate the average color of a image.  If you can’t remember how functions work, revise this section in your notes.  Make a new MATLAB file and save it as get_color.m.  In this file we are going to make a function, copy and paste the following code into your file:

~~~~
function [r g b] = get_color(data)
r=1;
g=2;
b=3;
end
~~~~

Save your file get_color.m then from then on the command line type

~~~~
[r g b]=get_color(1)
~~~~

What values does this function return?

**Step 2:** Color images are made up of pixels, each pixel has a red, green and blue component, the values of the red green and blue components can range form 0 to 255.  So for example, a very red pixel would be represented by the three numbers 255,0,0 or a very green pixel would be represented by the three numbers 0,255,0 and a blue pixel would be represented by the values 0,0,255.  What value would a black and gray pixel be represented by?

Have a play with this web page to understand this a bit better:
[web page](https://www.w3schools.com/colors/colors_converter.asp)  What are the RGB values of your favourite color?

**Setp 3**: By looking at the color components of any image 
we can guess what could be in the image.  For example if the image is of the floor in the L3 lab, it will consist of lots of gray pixels.  If the image is full of smarties, it will have a wide range of colors etc...

We would like our function get_color(x) to return the average color of the pixels.

Question 3
----------
**step 1:** Rather than calling your get_color(x) function from the command line, make a new script called  *detect.m*, and in that script call you function by adding the line of code:
~~~~
get_color(1)
~~~~

**step 2**: Currently we are passing the get_color function the value of 1,  we don't want to do this we would like to pass it an image from the camera.  So using imread in the script *detect.m*, read the image *floor.jpb* into a variable *a* and pass it to your function by using the code

~~~~
get_color(a)
~~~~

Now in your *get_color()* function use the command *imshow*, so that the function will display any image which is passed to it.


**Step 3:** We now need to define two nested loops to itterate over every pixel in our image.  For now we are going to pretend our image is 100x100 pixels big.  Inside the function get_color, underneath your *imshow* command define two nested for loops, one which counts using the variable x from 1 to 100 and one which counts using the variable y from 1 to 100.

**step 4**:  Using the *sprintf* and the *disp* commands print out all the values of x and y, over which the loops count.

**step 5**:  We know that this image is bigger than 100x100 pixels.  Use the size command to store the *x* and *y* size of the image in the variables *x_len* and *y_len*.  Change your for loops so rather than counting to 100, they count to x_len and y_len.

**Step 6**:  In the coursework we played with a black and white image of the science museum.  We learnt that images are stored in a 2D matrix, a values between 0-255, with 0 being black and 255 being white, and all values between being shades of grey.  If one wanted to extract the intensity at 50,50 pixel, we would use the code:

~~~~~
data(50,50)
~~~~~

However our image is not gray scale it is a color image.  In Color images as I mentioned above we store red, green and blue pixels.  Therefore at each position in the image there is a red green and blue value stored.  To access the red value at 50,50 we would use the command

~~~~~
data(50,50,1)
~~~~~

To access the green value we would use the command:

~~~~~
data(50,50,2)
~~~~~

and to access the blue value we would use the command:

~~~~~
data(50,50,3)
~~~~~
Edit your sprtinf statement to display the red, green and blue values of the pixels at every x,y value your nested for loops count over.

Question 4
----------
**Step 1:** We are now going to edit the function so that it sums, all the values of the red pixels in the the image. First delete the lines:
~~~~
r=1;
g=2;
b=3;
~~~~
from your function.  At the top of your function define the counter r=0.0, in the loop add the line 
~~~~
r=r+int32(a(x,y,1));
~~~~

By writing int32 before the a, we are just telling MATLAB/Octave to use an int32 type variable to store the sum of all the red pixels.  An int32, is a special type of variable which can store very big numbers, we are using this as we expect the value of r to get very big.  The technical term for this is type casting.  Now add corresponding lies for the blue, and green colors, just as we did for the red color.  After your loop add the commands:

~~~~
r
g
b
~~~~

To show you the totals of the red green and blue in the images.
Now test out the function again on the command line.  You should get some large values for r,g and b returned.

**Step 2:** Returning the sum of red, green and blue, pixels is not so useful. What we want really is the function to return the average values of the red, green and blue pixels.  So add to your function a variable (called count) which adds up the number of pixels over which the r,g,b values are summed.  Then at the end of your function, divide r,g and b values by count.  [An alternative way of doing this is to divide the totals by y_len*x_len] Test your function again by running the script, detect.m.  It should now return the average pixel intensity, for the region defined in figure 1.

**Step 3:** Change your script Try to load yellow.jpg and smarties.jpg.  What values do you get out?  Are they different for each object?  If so how different?

Question 2:
-----------
 We have now written a function to detect the colour of an object.  All we need now is another function to compare the detected r,g,b values to know r,g,b values to decide if an object has been detected.  Define a new function in a new .m file which is called delta as follows:
ret=delta(r0,g0,b0,r1,g1,b1,tol)
This function will take two sets of RGB values and compare them.  It will return -1 if they differ more than tol (tolerance), and 0 if they differ by less than tol.  Calculate the difference between the two sets of RGB values using the equation.


Question 3:
-----------
Use the function you developed in question 1 to identify the r,g,b values for the picture of the desk and the picture of the object.  Write a script to load in an image and tell the user using the disp command if it is a picture of the desk or the object.

Question 4:
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
