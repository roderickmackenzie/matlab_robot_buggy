Worksheet 0 - The buggy emulator
===========

Introduction
----------
This lab was originally introduced to give 1st year students a taste of how to use computers to control hardware and how to make computers interact with the real world (See figure 1).  Unfortunately, between March 2019 and now, there was a global pandemic, this makes it hard to run large group labs with 300+ students in them.  Added to this the robots are fairly complicated devices lots of wires which would be very hard to clean.  I therefore had to come up with a virtual buggy lab which gives you most of the experience of the real lab but in a safe (and hopefully fun!) way.  The answer is the virtual buggy lab:  I have written a buggy simulator and a virtual environment which which enables you to simulate the actions of the buggy in matlab.  The only thing you will miss out on is the actual screwing together of the buggy, which is a real shame but was more a fun exercise rather than anything where you learnt a great deal. 

<p align="center">
<img src="./images/buggy.jpg"  width=25% >

Figure 1: The robot assembled.
</p>

Emulators in the real world
------------------

In the real world you often need to write [emulators](https://en.wikipedia.org/wiki/Emulator), to simulate a piece of equipment or computer system.  You may have to do this because ;1) the real equipment is not yet developed think of writing code for a new mobile phone chip which has not yet been fabricated ;2) the equipment is [too old so does not exist any more](http://www.emulator-zone.com/doc.php/nes/) such as a Nintendo emulator to run your old sonic the hedgehog games; 3) Or because testing your device out in the real world is too expensive.  An example of the latter is in developing automated driving systems.  It's far quicker (and safer!) to test your new machine learning algorithms out on a virtual world than let them drive around a real car.  Usually, one uses an emulator to develop the code for a product, then moves onto the real hardware one available.  In our scenario, it's just all too dangerous to run the lab as usual.

The buggy emulator
-----------------
You can download the buggy emulator from [here](https://github.com/roderickmackenzie/matlab_robot_buggy/tree/master/buggy_simulator), download the zip file and unzip it on your PC in an empty directory.  I would recommend on your desktop.  You can look around and edit the code it is just MATLAB, you should be able to understand most of it.  Open the file called *autorun.m* and press play.  You should see a robot buggy appear on the screen and start moving around.

Doing this lab with the emulator
-----------------
Just as you would have to in the real world, I am going to give you the emulator and the *real* lab sheets which are unadapted for the emulator, it is your job to get through the labs and do the tasks with the emulator.  If you were developing a product, you would then go and test your code you developed with the help of the emulator on the real buggy (We won't be doing this for obvious reasons).  Read though all the experimental sections of the lab sheets so you understand what is going on.  As ever I will be helping you get through the example sheets, with a team of demonstrators.

Going further on your own
-----------------
The computer the buggy is based around is called the Rasbry PI, it is a very low cost computer which you can get from Amazon or RS for about 30 pounds.  If you find this lab fun and want to go further, I highly recommend you get one.  It's a very good entrance into the world of home automation, robotics, and even writing code in C/Linux.  This year (due to Covid) I would recommend this more than usual.  Spending significant time 'hacking' on the PI will probably teach you far more than I can teach you in a semester of computing lectures.

Assessment
----------
For each work sheet (apart from this one!) there are some questions or work to do in your own time or during the lab.  There will be a hand in box place on moodle towards the end of the lab.

On to worksheet 1
-----------------
[Worksheet 1](https://github.com/roderickmackenzie/matlab_robot_buggy/blob/master/WS1/worksheet.md)
