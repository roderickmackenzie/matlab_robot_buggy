Worksheet 2
===========

1: Introduction, MATLAB and the Raspberry PI
--------------------------------------------

**Step 1.1:** Until now you have only programmed in the MATLAB programming language, although MATLAB it’s self is quite useful, it has some drawback:

1. It’s really really expensive, and to make sure the developers get their money for it, every time MATLAB starts, it checks a license server to see if you are allowed to use it (and if you have paid your money!).  This is non ideal for a non internet connected buggy.

2. It’s really memory/disk intensive, and although the PI is quite powerful, it would struggle with MATLAB.  Even my i7-Intel laptop sometimes struggles with MATLAB.

Luckily for you, there is an alternative to MATLAB which is free and does not have any of the above drawbacks.  It is called Octave, it’s is much less memory intensive and will run easily on our Raspberry PIs just fine. It works just like just like MATLAB, and you will feel quite at home using it.
To start Octave, click on the Raspberry, in the top left hand corner of the screen, go to Education and click on Octave, you should get something looking like Figure 1.1  Think of Octave as free/open source MATLAB.

<p align="center">
<img src="./images/octave_start.png" width=70%>

Figure 1.1: Octave running on the PI. Personally, I really like Octave and prefer using it to MATLAB.
</p>


**Step 1.2:** Basic use of Octave

Just to make you feel at home with Octave, we will now use it to write some basic computer code, just as we did when we first started learning MATLAB.

a) Generate a 10x10 random array of numbers.

b) Define an array of an array called student_marks equal to [ 10 20 30 40 50 60 70 80 90]

c) Set variable 'b' equal to the 2nd element of student_marks, and the variable ‘a’ equal to the third element of the array student_marks.

d) Calculate the average of the variables a and b.

e) Replace the 5th element of the array with 80.

See it’s just like MATLAB. :)

Exercises a-e are just warm up exercises, the will not go into your work book.
 
**Step 1.3:** Scripts in Octave, just as in MATLAB, you can make scripts in Octave.  To make a new script, click file→New→New script.  You will see a script appear on the right hand side of the screen.  A new menu has appeared looking like figure 1.2.


<p align="center">
<img src="./images/octave_script_editor.png" width=70%>

Figure 1.2: The octave script editor.
</p>

Click, File→Save as and then save the file as 'q1.m' under /home/pi/ .  On the PI, all users home directories are stored under /home/, and you are logged into the system under user ‘pi’, so you save all your work in /home/pi/.  Note that the '/' character is used to separate file and folder names, rather than the '\' character as in windows.  It is also worth noting that in Linux, there is no A:, C:, D: ... Z: drive etc, everything appears as a file.  Now in the script use the disp command to print ‘I love programming the PI!’ to the screen.  Then once you have done this, click on the cog icon, with the little yellow play button embedded in it.  Your script will then run.  The output will appear in the command window.  If you can’t see the command window click on the, use the little resize icon (see figure 1.3) to break the script editor out of the main interface.

<p align="center">
<img src="./images/resize.png" width=10%>

Figure 1.3: The resize icon.
</p>

The following exercise will refresh your knowledge of MATLAB, especially functions and files, if you find the questions hard go back though some of the example sheets, especially the ones on loops, files and plotting.

**Q2.1)** Make a new script called q2_1.m, now edit your script so that it will sum the numbers from 1 to 1000, using a for loop.  Write the answer in your work book, under section 2 question 2.1.

**Q2.2)** Make a new script q2_2.m, using a while loop make it count from -10.0 to 0.0, in steps of 0.5.

**Q2.3)** Write a script which sorts an array of 10 random numbers.  Hint: The answer’s in the lecture notes, then save it in file q2_3.m.

**Q2.4)** Write a script to integrate, the function sin(x)+0.1*sin(x) between -pi and pi.  and save it as q2_4.m.

**Q2.5)** Write a script to plot a graph of sin(x)+cos(x) between -pi and pi, label the axes using code, and save it as...

```
From now on all scripts should be saved as q[Worksheet number]_[question number].m.  If we can't identify the question to which your code relates you will get no marks for it.
```

**Q2.6)** Write a scrip to write the number from 0 to 10 in a file called save.dat, using fopen, fprintf, fclose...

**Q2.7)** Write a function called add_me to add two numbers together and return the answer.

**Q2.8)** Write a script to open a file called mode.dat, read a single number from that file and print the words 'zero' if a '0' is found in the file and the word 'one' if a '1' is found in the file.


The above questions, are really just to get you back into thinking about programming again, once you have finished today's lab, copy all the .m files you generate to a USB stick and make sure all group members have the files.  If you struggle with these, go and revise MATLAB by practicing, this is the minimum level needed for this lab.

```
Make sure you make a copy of your code after each lab to USB stick, last year some groups buggies went missing between labs.
```



