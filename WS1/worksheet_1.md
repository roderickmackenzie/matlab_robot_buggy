Worksheet 1
===========
Introduction
----------
This series of four labs will take you through the process of building a computer controlled robot buggy.  In essence there are two parts to the buggy.  The mechanical buggy with it’s motors, gear boxes and wheels, and the electronic system which controls the buggy.  Our buggies will be controlled by a Raspberry PI computer.  This is a fully fledged computer on a single board, it uses the same type of powerful [microprocessors](https://en.wikipedia.org/wiki/ARM_architecture) which are in your mobile phone.  It has screen output, USB ports, Network ports, WiFi and everything you would expect from a normal desktop computer.  It is my hope that by introducing you to this computer early on in your degree, you will be able to use it in your projects later, or indeed use it in your own projects at home.  First we are going to configure the Raspberry PI computer, then we are going to build the buggy.

Your robot buggy kit
-----------------
The robot buggy kit is sown in figures 1 and 2.  Figure 1, shows how the components should be stored in the toolbox, and figure 2 includes the larger components which will not fit in the box.  When you return your buggy at the end of the buggy building sessions, all the components should be placed into the toolbox exactly as you found them.
<p align="center">
<img src="./images_small/kit.png">

Figure 1: The robot buggy kit in it's toolbox, when you return your buggy kit, it should be set out in exactly the same way as you got it.
</p>

<p align="center">
<img src="./images_small/all.png"  width=50% >

Figure 2: The robot buggy kit spread out on a table, including larger components which will not fit in the box.
</p>

Your box should contain:
|  Item              |  Number  	| Provider  |  Order code |
| ------------------ | -------- 	| --------  | -------- |
|  Wheels            |  x4      	| Amazon |  |
|  Screwdriver       |  x1      	| RS |  |
|  Posts 			 |  x4      	| RS |  |
|  Yellow motors 	 |  x4      	| Amazon |  |
|  Black USB wire 	 |  x1      	| Amazon |  |
|  Pre-made motor wire |  x1    	| UoN |  |
|  Raspberry PI |  x1           	| RS |  |
|  Acoustic sensor   |  x1      	| Amazon |  |
|  Wires             |  lots    	| Amazon |  |
|  Acoustic sensor holder | x1  	| UoN |  |
|  L298 motor driver board | x1  	| Amazon |  |
|  Red dipswitches | x1  			| RS |  |
|  LED bar graph | x1  				| RS |  |
|  Acoustic sensor interface | x1  	| UoN |  |
|  Camera holder | x1  				| UoN |  |
|  Camera+ribbon cable | x1 		| RS |  |
|  Raspberry PI enclosure | x1		| RS |  |

It should also contain the following number of bolts and nuts:

|  Item              |  Number  	|  	Provider  |  Order code |
| ------------------ | -------- 	|   --------  | -------- |
|  Motor supports screws   |  x8    |  |  |
|  Long metal screws |  x8       	|  |  |
|  Plastic screws M3 short  |  x2   |  |  |
|  M3 plastic nuts       |  x5      |  |  |
|  M3 nuts           |  x18      	|  |  |
|  Plastic hex supports long (15mm) |  x2 | Rapid/RS | 33-2044/102-6520 |
|  Plastic hex supports short |  x4 |  |  |
|  Plastic screws M3 long  |  x3    | RS | 527-987 |
|  Long metal M3 screw for sensor |  x1 | RS |  560-647*     |



Section 1: Constructing the top of the buggy
--------------------------------------------

**Step 1**: Locate:
* The top plate to the buggy, this is a brown piece of acrylic with a white thing stuck to it (this white thing is called a bread board).
* The case for the raspberry PI, this is clear acrylic box, which comes in 2/3 parts
* A long *PLASTIC* screw and a *PLASTIC* washer.

These components are shown in figure 3.   If you do not have any of these components go and ask a demonstrator for them.  *Do not use a metal screw this will short the PI and destroy it.*

<p align="center">
<img src="./images_small/top_plate_case.jpg"  width=40% >

Figure 3: The top bottom half of the PI case, fixed to the top of the buggy.
</p>

Hold the top plate to the buggy in your hands, and notice that the breadboard is slightly offset from the center of the board, arrange the bottom of the PI case and the top of the buggy so that it looks like Figure 3.  Then take the long screw and pass it though one of the large holes in the PI case, until it pokes out the other side.  Then pass the screw though a hole in the top plate to the buggy and fasten it in place with the nut.  The result should look like Figure 3, if something does not fit, don't force it ask a demonstrator for help.


**Step 2:** Locate the [raspberry PI](https://en.wikipedia.org/wiki/Raspberry_Pi) in your toolbox.  When handling the raspberry pi, it is important to note that you are directly handling the circuit board of a computer.  Circuit boards are very delicate, and can be damaged by moisture form your hands and static electricity from your body.  It is also important to note that all the metallic bits on the back of the board will have electricity running through them, (so I would not recommend licking them!), so it is important you don't place the raspberry PI on any metallic objects such as metal pens, rulers, coins etc... Locate the SD card in your kit (the demonstrators may will have these), and insert the SD card into the PI as shown in figure 4.  The SD card acts as the internal hard disk for the PI, it contains both the operating system ([Raspbian which is a version of Linux](https://www.raspberrypi.org/downloads/raspbian/)), and acts a place to store your work.

<p align="center">
<img src="./images_small/pi_and_card.jpg"  width=40% >

Figure 4: Inserting the SD card into the PI.
</p>

**Step 3:** Insert the PI into the base of the case. See figure 5.  Note there is a little slot for the SD card to poke out of on the right of the case.  If it does not fit, don't force it ask for help.

<p align="center">
<img src="./images_small/pi_in_case.jpg"  width=40% >

Figure 5: The PI inserted into the case.
</p>

**Step 4:** Find the top of the PI case and clip it on over the rest of the PI.  This plastic case protects most of the circuit board but leaves the IO (Input/Output) pins exposed.  This is shown in figure 6.

<p align="center">
<img src="./images_small/pi_with_top.jpg"  width=40% >

**Step 5:** Find the two short hex spacers, and two long hex spacers, as shown in figure 6.  Screw these together and insert them into the front of the buggy as shown in figure 7, fasten the hex spacers in place with two plastic nuts.

<p align="center">
<img src="./images_small/ultrasonic_legs.jpg"  width=40% >

Figure 6: Building the legs for the ultrasonic sensor. 
</p>

<p align="center">
<img src="./images_small/ultrasonic_legs_attach.jpg"  width=40% >

Figure 7: Attaching the legs for the ultrasonic sensor to the buggy, using two **plastic** nuts.
</p>

**Step 6:** Now find the 3D printed holder for the ultrasonic range finder in your tool kit.  You will also need a long M3 bolt and screw, build together the holder as shown in figure 8.  (Hint you might need to borrow a second screwdriver form you neighbor to tighten the nut).  Once the sensor holder is screwed together, screw it to the hex spacers as shown in figure 9, using long PLASTIC screws.


<p align="center">
<img src="./images_small/ultrasonic_holder.jpg"  width=40% >

Figure 8: Building the ultrasonic sensor holder.
</p>

<p align="center">
<img src="./images_small/ultrasonic_attach.jpg"  width=40% >

Figure 8: Attaching the ultrasonic sensor to the buggy, with two long plastic screws.
</p>

**Step 7:** Find the PI camera and it's 3D printed holder in your tool box, also find two short M3 metal bolts, and two M3 nuts.  Build the camera holder as shown in figure 9, and then attach it to the buggy as shown in figure 10.  Do note that the ribbon cable attached to the camera is very delicate, if you bend it so there is a kink in it, then it will break all the connections within the cable.  It is the same type of cable as used in mobile phones, treat it with care.

<p align="center">
<img src="./images_small/camera_holder.jpg"  width=40% >

Figure 9: Building camera holder.
</p>

<p align="center">
<img src="./images_small/camera_attach.jpg"  width=40% >

Figure 10: Attaching the camera holder to the buggy.
</p>


Section 2: Constructing the bottom of the buggy
-----------------------------------------------
**Step 1:** The main components of the buggy are two large plastic plates, so far you have used one plate to build the top of the buggy. Now, go and find the second one of these plates, this time it does not have any bread board attached to it.  This is shown in figure 11.

<p align="center">
<img src="./images_small/btm_plate.jpg"  width=40% >

Figure 11: The bottom plate of the buggy
</p>


**Step 2:** Now go and find the gear boxes for the buggy,  they are bright yellow and look what is shown in figure 12.  From one pair there should be two with wires coming out of them, and the other pair should not have any wires.  At each corner of the base plate, there are slots to attach each of the four gear boxes, as highlighted in red in figure 11. Using two of the t-shaped plastic pieces shown in figure 12, the mount the motor to the bottom of the base plate by placing one on each side.  Also look at figure 13 to show you how the finished item should look.  Note, in figure 13 the two gear boxes with wires are mounted together, and the ones with no wires are mounted together.   You should do the same.

<p align="center">
<img src="./images_small/btm_motor.png"  width=40% >

Figure 12: The gear boxes of the buggy, this one has a motor attached to it.
</p>


**Step 3:** As shown in figure 12, the motor case should be attached to the base plate by threading one of the motor mounts through the board and placing the other in the groove on the outer edge of the plate. The bolts in the kit can then be threaded through the motor mounts and motor casing to hold the motor in place. Once the bolts are in place, the nuts should be used to securely fasten the motor casing in place on the base.  Note, the nuts must go on the inside of the buggy, and the screw heads on the outside, or the bots will stick into the wheels.

<p align="center">
<img src="./images_small/btm_motor_attached.jpg"  width=40% >

Figure 13: The gear boxes and motors attached to the buggy.
</p>

**Step 4:** This process can be repeated with all of the motor mounts in all four corners of the base plate. Ensure that the motor casings containing the motors are both attached to the same end of the base. Once all motors are attached, thread the motor wires through the opposite side of the base plate as shown in figure 12.  Finally push the wheels onto the shafts coming out of the gear boxes.

**Step 5:** The threaded posts can now be attached to each corner of the base plate. The posts can be placed in all four corners of the base plate as shown in figure 14, and then secured in place with nuts as shown in figure 15.

<p align="center">
<img src="./images_small/post.jpg"  width=40% >

Figure 14: Threaded post attached to the base plate using a nut on the underside of the plate
</p>

<p align="center">
<img src="./images_small/post_and_nut.jpg"  width=40% >


Figure 15: The posts are attached by placing the threaded end through the hole in the corner of the plates and securing with a nut.
</p>


Section 3: Wiring the motors
----------------------------
**Step 3.1:**  The raspberry PI can not deliver enough current to drive things which require a large amount of current such as a motor.  We therefore need some form of current amplifier which will amplify the small signals coming from the PI to larger current signals which can drive the motor.  To do this we will use a motor driver board, the one we are using is an L289N, take the motor driver from your tool box, and the cable shown in figure 16.  Figure 16 shows the process of fitting the control cable to the motor driver board.  If your motor driver is new, you will have to remove the two little [jumpers](https://en.wikipedia.org/wiki/Jumper_(computing)) from the board before fitting the cable.  These jumpers are needed for a different type of motor.  Notice that there is a right way and a wrong way to fit the cable, the metallic bits on the cable should be facing away from you.

<p align="center">
<img src="./images_small/wiring_motor_driver.jpg"  width=80% >

Figure 3.1: Fitting the control cable to the motor driver board, note there is a wrong way and a right way to fit the cable. The metal tabs on the cable should be facing away from you, and towards the board.
</p>

**Step 3.2:**  Now ask a demonstrator for a power supply module to the buggy.  These consist of four components, and on-off switch, a battery holder, and a USB power converter, they are all joined together in a 3D printed enclosure.  The buggy requires two different voltages to run, a 5V supply which powers the PI, and a 12V supply which drives the motors.  Having a very steady 5V supply is essential to for the PI to run smoothly, the motors can tolerate a voltage between about +15V and +10V.  The red and black wires coming out of the battery pack provide the motors with 10V-15V.  Connect the red and the black wires to the motor controller board as shown in figure 17 .  The red wire should go in the far left hole, and the black wire in the middle hole.  If you put them in the wrong holes, you make see SMOKE!!!  IF IN DOUBT ASK FOR HELP!! You will have to use the screwdriver to clamp the wires in place.

<p align="center">
<img src="./images_small/bat_and_motor_driver.jpg"  width=80% >

Figure 3.2: Attaching the power supply to the motor driver board.
</p>

**Step 3.3:** Fill the battery holder with batteries.  You will be able to get batteries from a demonstrator.  We have a lot of left over batteries from last year, I would like to use these up first before opening new boxes of batteries (for environmental reasons).  Use the a voltmeter to test the voltage of second hand batteries, if the voltage is below 1.1V, then they are probably flat.  Put these into the battery recycling bin, and find some more with a higher voltage.  Once you have populated your power supply with batteries flick the switch on the power supply and you should get a red light as shown in figure 3.2.  Now turn the power supply back off.

**Step 3.4:** Once you have wired up the motor driver board, find in your toolbox:
* Two short plastic hex standoffs.
* Two plastic nuts.
* Two plastic screws.
Then use them to attach the motor driver board to the bottom of the buggy as shown in figure 3.3

<p align="center">
<img src="./images_small/fasten_motor_board.jpg"  width=40% >

Figure 3.3: Attaching motor controller board to the buggy.
</p>

Section 4: Joining top and bottom of the buggy
----------------------------------------------
**Step 4.1:** Now place the top of the buggy on the bottom of the buggy as shown in figure 4.1.

<p align="center">
<img src="./images_small/join.jpg"  width=40% >

Figure 4.1: Joining the top and bottom of the buggy.
</p>

**Step 4.2:** Once you have placed the top of the buggy on the bottom, place the battery holder on top of it, then use four metal nuts to secure it, as shown in figure 4.2.

<p align="center">
<img src="./images_small/fasten_top_to_bottom.jpg"  width=40% >

Figure 4.2: Securing the top to the bottom of the buggy.
</p>

**Step 4.3:** Now connect the control wires to the PI, from the motor board.  Figure 4.3, shows you how to do this.  Be very careful to connect the wires the correct way around and onto the correct pins.  If you get it wrong you may damage your PI.  To figure out the correct way around they should go, you will have to look at the wires going into the motor driver board and compare them to the the wiring diagram.

<p align="center">
<img src="./images_small/motor_wiring.jpg"  width=40% >

Figure 4.3: Connecting the motor wires
</p>

Section 5: Joining up the camera
--------------------------------
**Step 5.1:** It is now time to attach the camera to the PI.  The camera is connect to the PI using a very delicate ribbon cable.  If you kink this cable (i.e. bend it by more than about 50 degrees it) it will break the internal wires.  There is a white socket on your PI, as shown in figure 5.1.  With your screwdriver or your nails very gently loosen the white plastic clip until it is loose.  Then slip the cable into the socket as shown (it's a bit fiddly so be patient and don't bend the cable - if you need demonstrator help ask for it..).  There are two sides to the connector, one side with the metal contacts and one side with a plastic covering.  The cable must be inserted in the orientation shown in the figure or the camera will not work.


<p align="center">
<img src="./images_small/attach_camera.jpg"  width=40% >

Figure 5.1:  Attaching the camera to the PI.
</p>

Section 6: Attaching the ultrasonic sensor
------------------------------------------
**Step 6.1:** Now find the ultrasonic sensor and the driver board to the sensor in you tool box, these items are depicted in figure 6.1.  Also go and find in the box of wires:
* Two female-female jumper wires.
* Two female-male jumper wires.
Attach the female-male jumpers leads to the sensor driver board, on the far left and far right hand pins.  And attach the female-female wires to the two inside pins.

<p align="center">
<img src="./images_small/ultrasonic_sensor.jpg"  width=40% >

Figure 6.1:  Building the ultrasonic sensor, and attaching the wires.  The female-male jumpers leads should be on the far left and right pins, while the female-female wires should attach to the two inside pins.  It does not matter which color wires you use, in the next steps we will connect this sensor to the PI.
</p>

**Step 6.2:**  We will power the PI using it's micro USB port, the power will come from the batteries via a voltage converter which will step down the 10-15V supply from the batteries to a steady 5 Volts.  If you look at figure 6.2, you can see a diagram of the output pins on the PI.  Click on the picture to zoom in.  The section of the diagram labeled GPIO Pin out tells you what each of the pins does on the PI, some pins can be used to control things, some pins can be used to read information in from sensors.  Pin 4 and 6 expose the +5V and 0V from the power supply to the PI, we are going to tap into these pins to get the voltage we need to drive the ultrasonic sensor (and later other components).  Get two female-male wires, and connect them to pin 4 and 6, as shown in figure 6.2.  Then connect the wires to the bread board as shown in the diagram.  The wire coming from pin 4 should go to the red strip on the bread board, and the wire coming out of pin 6 should go to the blue or black strip on your bread board.

<p align="center">
<img src="./images_small/ultrasonic_sensor.svg.png"  width=40% >

Figure 6.2:  Building the ultrasonic sensor, and attaching the wires.  The female-male jumpers leads should be on the far left and right pins, while the female-female wires should attach to the two inside pins.
</p>

~~~~
**What is breadboard?**

Breadboards allow you to quickly and easily build electronic circuits without the need to solder wires together.  By placing wires and components into the holes in the board you can build a circuit within minuets. Each hole in the breadboard is electrically connected to all the other holes in it's row, as shown by the red lines in figure 6.3.

<p align="center">
<img src="./images_small/bread_board.jpg"  width=40% >

Figure 6.3:  Layout of the breadboard, with the image on the left showing the common connections between pins.
</p>
~~~~


Old
---
Step 6: Now on the computer next to the one which is writing the image to the SD card (i.e. using another computer).  Connect the PI up to the PC monitor using the HDMI cable which you will find in the buggy kit.  Also, carefully, disconnect keyboard and mouse from the PC and reconnect them to your PI. Now, insert the SD card into your PI.  Your PI is now set up and ready to go.  All new need now is power!  We will get this from the USB port of the computer.  In your buggy kit, you should see a white, USB cable, with a micro USB end, this looks like a phone charging cable.  Connect one end to a PC, and the other end to the PI.  We are using the computer as a power supply, at the moment.  Later on we will power the PI off batteries.  Be very careful not to power the PI off the computer and batteries at the same time, as you could damage the computer.  I also suggest, you try to power the PI off the computer as much as you can, so you don’t drain your batteries.

Step 7: Once the power is connected, the PI should begin to boot up. After a minute or so, you should be able to see the desktop of the raspberry pi and be able to interact with its installed programs as shown in figure 3. If this doesn’t happen, ensure the SD card is correctly inserted, and ask for help!
Step 8: Have a  quick play with the PI’s desktop and start a few programs.  You can see that it is really a fully functioning computer.  Try to find the word processor (hint: It’s called Libreoffice)


Building the buggy
----------

Step 7: In your box you will have two power battery packs, one which can take four AA cells and one which can take five AA cells, we are going to join them together, so they can produce about 12V, enough to power the buggies motors.  Using a few bits of sticky pad (you will have to layer them to make them high enough to stick), join the two packs together (back to back), as shown in figure 8.

Step 8: You should, have a battery clip in your box (it’s the sort of clip you would expect to attach to a 9V battery), attach two single junction boxes to it as shown in the figure 9.  The junction boxes come in strips of 10, to get a single one, just twist or cut one off the strip.  You may also have to use the wire cutters to remove a bit of wire so the wires can be easily screwed in to make a good contact.

Step 9: The black wire coming out of the x4 AA battery pack is a bit too long, cut it to around 7cm (if it has not already been cut).  Once this is done, connect it to the red wire with from the battery clip, using the junction box.  Then, clip the battery clip onto the x5 AA cell battery pack.  This is all shown in figure 10.

Step 10: The battery pack should, now have two wires coming out of it, a black one with a junction box on it and a red one with no junction box on it.  Find another single junction box and attach it to the battery pack, so both wires coming out for the battery pack have junction boxes on them.  Then get a single jumper lead, with two male ends on it.  Cut it in half, strip the ends and screw them into the junction boxes attached to the battery pack.  The final battery pack, assembly should look as shown in figure 11.


Step 11: You should have a big pack of AA batteries in your kit, find 8 of them, and fill up the x5 battery holder with them, and x3 slots in the x4 battery holder.  As shown in figure 12.  NOTE: WE ARE INTENTIONAL NOT FILLING THE x4 BATTERY HOLDER FULLY, AS WE DO NOT YET WANT TO POWER THE BUGGY.  ONCE YOU HAVE WIRED UP THE BUGGY, GET A DEMONSTRATOR TO CHECK THE WIRING.  THEN PUT IN THE FINAL BATTERY. :)

 Once you have done this, use some more stick pads to attach the battery holder to the buggy, over the axils with the motors as shown in figure 13.  Ensure the battery pack is placed on the end above the motors to put the weight of the buggy over the powered wheels.







>>Note: You must ensure you connect the jumper cable to the correct pin on the raspberry pi in order for this to work

Step 6: In order to correctly connect the echo sensor, you must first place two resistors, R1 and R2, with resistances of 4.7 kΩ [color code yellow, purple red, gold] and 10 kΩ [brown ,red, black, black, brown] respectively. The resistors are to be placed onto the breadboard in the positions shown in figure 28. You will have to trim the end of the resistor wires in order to get them to sit flush to the board, as shown in figure 25.

Step 7: Once the resistors are in place, you can connect the rest of the pins using the jumper cables according to the diagram in figure 16. Once the echo sensor is connected, you can then use blue tack to attach it the top plate battery pack as show in figure 27.  If you don’t have blue tack, it should just sit there on it’s own.



Testing the Buggy
Now the Buggy is complete. Ask a demonstrator to come over and check all the wiring is OK. If all is well, place the buggy on the ground and turn it on.  The image that was written to the PI contains a script that will automatically run when the raspberry pi is turned on. This stage will allow you to make sure that the buggy has been built properly, so ensure you look to make sure the motors are functioning correctly and in a straight line. If the echo sensor is working correctly, the buggy should reverse when in proximity to solid objects. 
In the case of the buggy not functioning correctly, get a demonstrator to come over and check the connections.

Marked assignment due at the end of the lab.  This is worth 20% of this series of labs:
Get a demonstrator to take a photo of your group with the completed buggy with a camera phone.  You must then each individually upload this photo to moodle into the hand in box called “Buggy: Assignment 1”.  Really this is just a nice way of checking that you were at the lab and were involved in building the buggy. Not all assignments in this lab will be that easy. ;)

Wile group work is fun, it’s also fun to do your own thing.  So for this worksheet, all parts are to be done individually, except Question 1 which you will have to do in a group. The usual plagiarism rules will apply for all but question 1. As ever, the demonstrators in the lab are here to help you.  For all questions but number 1, you can use matlab on the computers in C19/C20, you don’t need the buggy.

>This work sheet is worth 25% of the lab.

<center>
<img src="./images/pen.png">
</center>
<center>
Figure 1: An example of the buggy course.
</center>

However to do this task we need sample images of the black tape, smarties and the white piece of paper.  Ask Rod (or a demonstrator ) for these objects.  Take pictures of each of the objects with the buggy camera naming them black.jpg, eggs.jpg and exit.jpg.  [Hint: I would not eat the smarties… they have spent quite a long time kicking around my office!]

**Step 4:** Insert a USB stick into the PI, and copy off the images to a USB stick.  If you  can’t work out how to do this, ask a demonstrator.  We will be using these images in the rest of the questions.

The rest of the work sheet will be individual work, not group work, done on the PCs in the computer room, on your laptop or at home.  (Usual plagiarism rules apply... sorry) When you finished the programming your code, we will copy your files back to the PI, and test them.

Question 2
----------
Start up MATLAB on your PC.  We are now going to write some simple code to do some image recognition.  The image recognition will be based on color detection.  In a new script called q1.m use the imread and imshow command to read in the image and display the image of the floor.  What do you notice about the image?  Use the manual to look up what the flipud command does.  Have a go at using it.  What does it do to the image?  Save this script as q1.m

Question 3
----------
**Step 1:** We are now going to write a function to calculate the average color of a image, and use the average color the camera sees to identify objects.  Think how placing an orange and then an apple in an image would affect the average color of the image.  If you can’t remember how functions work, revise this section in your notes.  Make a new MATLAB file and save it as *get_color.m*.  In this file we are going to make a function, copy and paste the following code, which will define a function into the file:

~~~~
function [r g b] = get_color(data)
r=1;
g=2;
b=3;
end
~~~~

Save your file *get_color.m* then from then on the command line type

~~~~
[r g b]=get_color(1)
~~~~

What values does this function return?  Change the function so that it returns r=5, g=6 and b=7. 

**Step 2:** Color images are made up of pixels, each pixel has a red, green and blue component, the values of the red, green and blue components can range form 0 to 255.  So for example, a very red pixel would be represented by the three numbers 255,0,0 or a very green pixel would be represented by the three numbers 0,255,0 and a blue pixel would be represented by the values 0,0,255.  What value would a black and gray pixel be represented by?

Have a play with this web page to understand this a bit better:
[web page](https://www.w3schools.com/colors/colors_converter.asp)  What are the RGB values of your favourite color?  Look up the RGB values for purple and save them in your script as a comment.

**Setp 3**: By looking at the color components of any image 
we can guess what could be in the image.  For example if the image is of the floor in the L3 lab, it will consist of lots of gray pixels.  If the image is full of colorful Easter eggs, it will have a wide range of colors etc...

In the next part of the example sheet we are going to edit the the function *get_color(x)* return the average intensity of red, green and blue pixels in our image.  By following the steps you will be able to do this.

Question 4
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


**Step 3:** We now need to define two nested loops to iterate over every pixel in our image.  For now we are going to pretend our image is 100x100 pixels big.  Inside the function *get_color*, underneath your *imshow* command define two nested for loops, one which counts using the variable x from 1 to 100 and one which counts using the variable y from 1 to 100.  If you can't remember what a nested loop is refer to your notes.

**step 4**:  Using the *sprintf* and the *disp* commands print out all the values of *x* and *y*, over which the loops count.

**step 5**:  We know that this image is bigger than 100x100 pixels.  Use the *size* command to store the *x* and *y* size of the image in the variables *x_len* and *y_len*.  Change your for loops so rather than counting to 100, they count to x_len and y_len.

**Step 6**:  In the CW2 we played with a black and white (sometimes called gray scale) image of the science museum.  We learnt that gray scale images are stored in a 2D matrix, with a value between 0-255 representing the value of each pixel. Zero represents the color black and 255 represents the color white, and all values between being shades of gray.  If one wanted to extract the intensity at 50,50 pixel form an image stored in the array *data*, we would use the code:

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

Edit your *sprtinf* statement to display the red, green and blue values of the pixels at every x,y value your nested for loops count over.

Question 5
----------
**Step 1:** We are now going to edit the function so that it sums, all the values of the red pixels in the the image. First delete the lines:

~~~~
r=1;
g=2;
b=3;
~~~~

from your function.  At the top of your function (but still in your function) define the counter r=0.0. Within the nested loop add the line of code

~~~~
r=r+int32(a(x,y,1));
~~~~

>What is this line of code doing?  Write your answer as a comment in your script.

By writing *int32* before the a, we are just telling MATLAB/Octave to use an *int32* type variable to store the sum of all the red pixels.  An *int32*, is a special type of variable which can store very big numbers, we are using this as we expect the value of *r* to get very big.  The technical term for this is *type casting*.  Now add corresponding lines for the blue, and green colors, just as we did for the red color.  After your nested loops add the commands:

~~~~
r
g
b
~~~~

To show you the totals of the red green and blue in the images.
Now test out the function again on the command line.  You should get some large values for r,g and b returned.

**Step 2:** Returning the sum of red, green and blue, pixels is not so useful. What we want really is the function to return the average values of the red, green and blue pixels.  So add to your function a variable (called count) which adds up the number of pixels over which the r,g,b values are summed.  Then at the end of your function, divide r,g and b values by count.  [An alternative way of doing this is to divide the totals by y_len*x_len] Test your function again by running the script, *detect.m*.  It should now return the average pixel intensity, for the region defined in figure 1.

**Step 3:** Change your script *detect.m* to load *black.jpg* and *eggs.jpg*.  What values do you get out?  Are they different for each object?  If so how different?

Question 6
----------
**Step 1:** We have now written a function to detect the color of an object.  All we need now it to change our program to figure out which color relates to which object.  Depending on the light in the room the exact values from the camera may change so rather than saying the average color from a section of black tape is 0,0,0 we could say that black tape has values of red<50 and green<50, blue<50.  I would use this code to check if an object is black or not:

~~~~
if (r<50)
    if (g<50)
        if (b<50)
           disp("The object is black!!")
        end
    end
end
~~~~

copy and paste this code into *detect.m*.  Does it work?  Copy and paste this code, while changing the values to detect the color white representing the exit.  Does it work or does it get confused?

Question 7 (bonus question):
----------------------------
Now try to adjust your script to identify the picture of the Easter eggs. 
