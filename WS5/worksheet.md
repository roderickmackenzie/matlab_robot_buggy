Worksheet 5 - The camera
========================

The camera
----------

You will have noticed that your buggy has a camera.  In this worksheet we are going to imagine the buggy is on the surface of a foreign planet such as Mars, the buggy is looking for interesting geographical features.  Different types of rocks often have different colors, we will be programming the buggy to search for interesting types of rocks, then it sees an area of interesting rocks the buggy will take pictures of it in detail.


**Step 1/Question 5.1:** Make a new octave (MATLAB) script, add the command
```
addpath(‘/home/pi/lib’)
```

as usual to the script. Then add the command
```
camera()
```

to the script. Save and run the script and you will see that an image has been written to /home/pi/image.jpg.  To open this image, click on the folder icon in the top left of the screen (it is the third icon from the left, next to the raspberry).  If you now double click on image.jpg you will see a picture of what the camera was looking at.  Try to take a picture of your group with the camera and add this to your report.


**Question 5.2:** Copy and paste the function below to a new script script called get_color, discuss as a group what it does.   Then copy it to your report and write a comment on each line describing how it works.  What is the advantage of setting s to a very big number and what is the advantage of setting s to a small number.  Describe the inputs and outputs of the function.  Finally describe in lest than 20 words how RGB images are stored in a computers memory, note this is discussed in the example sheets.

```
function [r,g,b] = get_color(a,x_start,y_start,s) ;
r=0.0;
g=0.0;
b=0.0;
count=0;
for x=x_start:x_start+s
	for y=y_start:y_start+s
		r=r+int32(a(y,x,1));
		g=g+int32(a(y,x,2));
		b=b+int32(a(y,x,3));
		count=count+1.0;
	end
end

r=r/count;
g=g/count;
b=b/count;

end
```

We are going to use the function above to perform some basic image recognition base on color alone.  By the end of this work sheet the buggy will be moving randomly on the floor on the lab taking pictures of the floor.  If the color of the floor changes significantly it will slow down and take 5 images of the floor at different locations, then speed up again and start moving randomly.  While it is doing this it will avoid objects.

**Question 5.3:** Make a new script which will move the buggy forward for 15 seconds on the floor.

**Question 5.4:** Use a *while* loop to take images of the floor every 2 seconds, and save them to */home/pi/image.jpg*

**Question 5.5:** Add the command

```
mkdir new_dir_name
```

to the beginning of the script to make a new directory called */home/pi/floor*.

**Question 5.6:**  Each time an image is taken use the [movefile](https://www.mathworks.com/help/matlab/ref/movefile.html) command

```
movefile source_file destination_file
```
Command to move the image to the location */home/pi/floor/{image_numer}.jpg*, so for example after three images are taken you will have the following files in your floor directory:

```
0.jpg
1.jpg
2.jpg
3.jpg
4.jpg
```

Hint to generate the destination path, you will have to use the sprintf command.  This way the buggy will collect images of the floor for later analysis.  Once you have done this place your buggy on the floor, and let it take 10 images of the floor.  After it has stopped, pick the buggy up off the floor and see what it has imaged.

**Question 5.7:**  Use the imread command i.e.

```
a=imread('/home/pi/image.jpg')
```

and the *imshow* command to view the images it has taken, the camera is actually mounted upside down on the buggy so you may want to use the [flipud](https://www.mathworks.com/help/matlab/ref/flipud.html) command 

```
a=flipud(a);
```

to flip the image vertically.  Then use the get_color function to obtain the averaged RGB values for each image.  Calculate the average red intensity, average green and blue intensity of the images.  Write these values in your report.

**Question 5.8:** Adjust your script from 5.6 to use the get_color and the *imread* each time it takes a picture of the floor.  It should compare the values returned by get_color, to determine if it has just taken an image of the floor or not.  You can decide if it has taken an image of the floor by comparing the values returned by get_color, to the average values of the floor calculated by you in the previous question.  If the values are different by more than 20% then you can assume the buggy has not taken a picture of the floor but something else.  If it has taken a picture of the floor print the words "floor" and if not it should print the words "not floor!".

**Question 5.9:** Adjust your script from 5.8 to move at speed 80 and take an image of the floor every 4 seconds.  If a surface which is not the floor is detected then the buggy should stop.  Take an image, run the motors for 0.5 seconds, then take another image, then repeat this process 10 times.  Then start moving forward normally again.

**Question 5.10:** Adjust your script from 5.9, so that every 0.5 seconds the buggy reads a value from the ultrasonic sensor.  If a value of less than 100cm is returned, then the buggy sould rotate 270 degrees, and then start moving forward again.

**Question 5.11:** Finally go and find some more 330 Ohm resistors, and select four more GPIO pins.  Wire up the LEDs to the GPIO pins, and adjust your script from 5.10 so that every time an image is taken, thee *average* of the RGB values of the image are displayed on the LEDs in binary.

Navagaion
-----------------
[<<Lab 4](https://github.com/roderickmackenzie/matlab_robot_buggy/blob/master/WS4/worksheet.md) |
[Lab 6>>](https://github.com/roderickmackenzie/matlab_robot_buggy/blob/master/WS6/worksheet.md)
