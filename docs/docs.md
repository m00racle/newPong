# NEW PONG DOCUMENTATION
This is the documentation for the Pong Project. I decided to move the project documentation here and focus the README.md as the user friendly information on what is this Project is.

## TABLE OF CONTENTS
1. [Agenda](##AGENDA)
1. [Add Class Library](##-Add-Class-Library)
1. [REAL WINDOW WIDTH AND VIRTUAL WIDTH](##-REAL-WINDOW-WIDTH-AND-VIRTUAL-WIDTH)
1. [NOTES ON LUA](##-NOTES-ON-LUA)

## AGENDA
~~BIG : [DOWNLOAD THIS CS50 GAME CODE](http://cdn.cs50.net/games/2018/spring/lectures/0/src0.zip)~~

~~BIG: [SEE THE VIDEO LINK OF CS50 GAMING](https://cs50.harvard.edu/games/2018/weeks/0/)~~

### Pong Day 2:

- [x] make the game scene (ball, stick, and scores)
- [x] make the stick for player 1 and player 2 moves when certain key is pressed down (hold)!
- [x] ~~Make the new font to make the scene looks retro~~

I guess I must just use the basic font provided by the course at this moment. The coloring limitations on this platform makes it hard to fint the correct font to put in the middle of the field as the logo for the game. 

- [x] Choose one font (the best) from all other options. 

In Pong day -2 I have collected some interesting fonts.
All are open source and also quite good.
I forgot the website which provided the font true text font (ttf) files but there are some good option there:
1. the Minecrafter is Minecraft like style of font.
1. The Pixemania is also a good retro font with the touch of the shadow.
1. The base font I took from the course's GitHub repo.

~~WARNING: BUG: 
- [x] the player 1 pad only moves upwards no matter the key pressed!!~~

### Pong day 3 :

- [x] all the properties and method such as movement of pads and ball must be encapsulated in this class.
- [x] make the pads movement limited to the screen sizes
- [x] make the ball move randomly in initial launch
- [x] limit ball movement to upper and bottom screen borders
- [x] simulate collision for ball
- [x] formulate the collision effect to the ball direction!!
- [x] if possible see the possibility to use the class concept in Lua (by default Lua does not support class) 

For now we will focus more on the collision detection to limit the object movements. 
The ball and the pads should adhere the collision limitations.

There is one more thing when it comes to class. There is a construct to a class object written in Lua.
Recommend to try this here is the [link to the file in GitHub](https://github.com/m00racle/hump/blob/master/class.lua). 

- [x] Just copy this class and use it into new file called class and then include it into main.lua
- [x] Then modify all classes to use this construct.

### Pong Day 4
Seek the [SEE THE VIDEO LINK OF CS50 GAMING](https://cs50.harvard.edu/games/2018/weeks/0/) and compare the technique use there with ours.
- [x] compare ball simulation class
### Pong Day 4
Seek the [SEE THE VIDEO LINK OF CS50 GAMING](https://cs50.harvard.edu/games/2018/weeks/0/) and compare the technique use there with ours.

:
- [x] compare ball simulation class
- [x] : compare and make collision simulation between the ball and pads. 
- [x] : add getter for the position of each pad and ball but let it postiton please be creative about it!
- [x] : upgrade our code on pad and ball if necessary but focus on our own ideas
- [x] : upgrade the main.lua to equipt with game state: start, play read pong/pong-7/main.lua

    - this is to make the game in pause and play condition.
    - I think this will be a good point to use the title to be shown/rendered during pause and hidden during play.

### Pong Day 5

- [x] : when gameState is in 'start' the ball and pad should not be rendered!
- [x] : make pause screen render that hide the play (ball and pads)

Here is the screen shot of the pause screen

<img src="https://github.com/m00racle/newPong/blob/master/docs/images/newPong_paused.jpg" alt="screen paused" width="500">

Still need improvement I know but this is a progress. Next I need to re-arrange the game state to more then just start and play to accomodate pause, goals, and also game over!

- [x] : make reset ball function to move the ball back to the middle if the ball is out of the field
- [x] : detect ball is leaving the screen and reset the ball afterwards
- [x] : add detection which player is winning a score when ball is leaving the screen

### Pong Day 6

- [x] : Modify score line according to the player goals
- [x] : Add more GameState to accomodate start of the game, pause, and players goals

NOTE: the variable to lead the printed player which has goals is not in the best practice since it just directly change local variable.

- [x] : Add rules to end the game in certain score line and make game over gameState

NOTE: the reset call for ball and all players is moved to the function key pressed thus in game over state the score line is still displayed and not yet reseted. For now for testing purposes the MAX_SCORE is set to 3 and will be updated later on.

- [x] : Find out how to concatenate string in Lua! 

NOTE: link to documentation on [String concatenation on Lua](https://www.dannyguo.com/blog/how-to-concatenate-strings-in-lua/)

## TWEAKS
Basic functionalities on this game is already proven to be done. Now I just need to make some tweaks to make the game more 'playable'.
Here some steps taken in order to tweak some functionalities. Starting with the problem and then report each solution. 

### Tweaks day 1
Here si some problem need to be fix/improve:

- [x] : The ball should start from the last player loss on the goals. Done I put the ball in front of each player. 

NOTE: in order to make the ball launch from its losing player I use the ball collide with pad which is not really ideal. next tweak should address this.

- [x] : player 1 has difficulties reaching the enter/return key just to pause. -> change the function key from 'enter'/'return' to 'space' bar. this will make easier for both players to reach the button to pause or resume the game.

### Speed Tweaks
Here is some tweak

- [x]  the game feels boring seems like the speed is monotone

for the moment I use the speed of the pad at 300 f, the ball initial speed at 200. Each time the ball collide with pad it increases its speed by 50 and each frame it will reduced by 0.1. Expect input and subject to changes in the future.

### Tweaks day 2
This time we will tweak the menu part.

- [x] menus should come up when the game state is pause
- [x] menus should includes return to game and exit (main menu) the game
- [x] exit the game to main menu should reset the whole game.

The menus is only basic since the configuratin is not yet set! The goal state will not directly able to reset and to reset must through to pause gameState.

### Audio Tweaks

This is big tweak by adding audio which in this game is limited first to sound effect.

- [x] Produce audio using BFXR:
    * BFXR is open source simple 8 bit sound effect producer software
    * this is not really big application and does not require any installation.
    * just download, extract and ready to use. 
    * here is the link to [BFXR website](https://www.bfxr.net/) 
    * produce the audio file in WAV format in this case is small file size
    
Here is the image of the BFXR user interface:

![BFXR UI](https://github.com/m00racle/newPong/blob/master/docs/images/bfxrUI.jpg)

- [ ] The audio need to be located inside the project folder 
- [ ] the audio file need to be instanciated inside the code
    * I think the instantiation should use in house function love.audio.newSource.
    * here is the [link to the documentation](https://love2d.org/wiki/love.audio.newSource)
- [ ] the audio should be the part of the ball class since this is the behavior of the ball
- [ ] tested the instatiation and use the [Source returned](https://love2d.org/wiki/Source) by adding :play() method.

### Resizeable Window Tweak
This is part of last update and tweak of the game.

- [ ] change the push resizeable=flase into =true
- [ ] then use the function.resize(w,h)
- [ ] inside the function we use push:resize(w,h) to let push to handle the resizing on window while maintaining the pixel density
 

## Add Class Library
**__NOTE: LUA AS PROGRAMMING LANGUAGE BY DEFAULT DOES NOT PROVIDE CLASS AS STRUCTURE, BUT WE CAN MAKE ONE CLOSELY  RESEMBLES CLASS BEHAVIOR EVEN ITS INHERITANCE NATURE__**

[x] learn how to make class like object in Lua
    [x] I need more time in this part, please refer to this [class making method](http://lua-users.org/wiki/SimpleLuaClasses) and compare should I use class() function.
    [x] check whether I can have private variable declaration in a class? Nope Lua does not offer privacy [see this documentation](https://www.lua.org/pil/16.4.html)
This is the new branch for testing the class module file. Here it the [link to the forked repo](https://github.com/m00racle/hump).

~~ LIST:~~

- [x] add class.lua file to include the class module
- [x] test to implement the class module for pad class. 
- [x] As this will have different implementation it is better to make different pad.lua class.
- [x] Read the class module implementation from [this link hump.class docs](https://hump.readthedocs.io/en/latest/class.html)

## REAL WINDOW WIDTH AND VIRTUAL WIDTH
Here I can make the virtual screen size using the [Ulydev push libs](https://github.com/Ulydev/push). (learn this more I guess). This is one thing to know that the Windows sizes (WINDOW_HEIGHT and WINDOW_WIDTH) are the size of the apps window according to the PC display.

The function of the Ulydec push libs is to adjust the resolution inside the apps window. We can set this different from the PC or media specification. In this case we want the game have the old taste of retro game. Thus we set the VIRTUAL_WIDTH and VIRTUAL_HEIGHT significantly smaller to the WINDOW_WIDTH and WINDOW_HEIGHT. This will make the pixel resolution inside the apps window will be much smaller than the native PC display settings.

**__NOTE: due to the push libs meaning all sizes such as max Y and max X position  of the ball and players' pads will use the VIRTUAL_WIDTH and VIRTUAL_HEIGHT repectively__**

## NOTES ON LUA
Note to self: Lua function does not support parameter assignment and thus no default function parameter values. 
So simple a Lua programming language is it has no fancy features even on its syntatic function feature. I just have to live with it. 
One thing I must remember is to always read the documentation because the sequence of the parameter values inputs are important!

NOTE: When add arguments to the Lua fucntion parameters we cannot use direct assignment such as function(param1 = arg1, param3=arg3). 
Instead we can only put it in order of the parameters are specified in function specification. 
Those parameters that left behind will be set having the value of **nil** (null).
