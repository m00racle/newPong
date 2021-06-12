# NEW PONG
This is the pong for gaming creation course.
I decided to make a new file in order to make the process simpler in one directory.

Here I can make the virtual screen size using the [Ulydev push libs](https://github.com/Ulydev/push). (learn this more I guess.)
Note to self: Lua function does not support parameter assignment and thus no default function parameter values. 
So simple a Lua programming language is it has no fancy features even on its syntatic function feature. I just have to live with it. 
One thing I must remember is to always read the documentation because the sequence of the parameter values inputs are important!

Pong Day 2:

[x] make the game scene (ball, stick, and scores)

[x] make the stick for player 1 and player 2 moves when certain key is pressed down (hold)!

[x] ~~Make the new font to make the scene looks retro~~

I guess I must just use the basic font provided by the course at this moment. The coloring limitations on this platform makes it hard to fint the correct font to put in the middle of the field as the logo for the game. 

[x] Choose one font (the best) from all other options. 

In Pong day -2 I have collected some interesting fonts.
All are open source and also quite good.
I forgot the website which provided the font true text font (ttf) files but there are some good option there:
1. the Minecrafter is Minecraft like style of font.
1. The Pixemania is also a good retro font with the touch of the shadow.
1. The base font I took from the course's GitHub repo.

~~WARNING: BUG: 
[x] the player 1 pad only moves upwards no matter the key pressed!!~~

Pong day 3 TODO:
[x] learn how to make class like object in Lua
    [ ] I need more time in this part, please refer to this [class making method](http://lua-users.org/wiki/SimpleLuaClasses) and compare should I use class() function.
    [x] check whether I can have private variable declaration in a class? Nope Lua does not offer privacy [see this documentation](https://www.lua.org/pil/16.4.html)
[ ] all the properties and method such as movement of pads and ball must be encapsulated in this class.
[ ] make the pads movement limited to the screen sizes
[ ] make the ball move
[ ] limit ball movement to upper and bottom screen borders
[ ] simulate collision for ball
[x] if possible see the possibility to use the class concept in Lua (by default Lua does not support class) 

For now we will focus more on the collision detection to limit the object movements. 
The ball and the pads should adhere the collision limitations.