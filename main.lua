--[[this is the course for code to make game Pong. I restarted the process hoping that I can make all in one window instead of making it pre progress.
I know this will be time consuming to make all from scratch but I an hoping this will make me learn better

]]

--I need to use libreary made by Ulydev in his gitHub repo: https://github.com/Ulydev/push
-- already downloaded and saved the push.lua file thus I need to import it to this main.lua
push = require 'push'
-- set the window size here
WINDOW_HEIGHT = 720
WINDOW_WIDTH = 1280
-- I want virtual sizes (height and width) similar to the old nintendo console.
-- set the virtual sizes here to make the fonts or certain object to change in size even as the resolution is still the same
VIRTUAL_HEIGHT = 243
VIRTUAL_WIDTH = 432

-- setting font 
fontChoice = 'basefont.ttf'


--load the initial settings.
function love.load()
    -- the welcome font seems so blurry try the filter.
    love.graphics.setDefaultFilter('nearest', 'nearest')
    --set the display (both windows and virtual) 
    -- I want vsync but the user should be prevented to make fullscreen, at this initial stage the user must not allowed to resize the screen.
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {fullscreen=false, vsync=true, resizable=false})
    --set the title of the game in the window to identify that we are runnig the correct app
    love.window.setTitle('The New Pong!')

    -- I want to use more retro font style (like minecraft maybe?)
    smallFont = love.graphics.newFont(fontChoice, 8)
    largeFont = love.graphics.newFont(fontChoice, 30)
end

--I want to make the apps quit when the user hit the escape key
function love.keypressed(key)
    if key == 'escape' then
        --escape means quit the window
        love.event.quit()
    end

end

function love.draw()
    -- begin rendering using the push lib
    push:start()
    
    --some modification: change the background to look less black
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    -- set the font to the new font ():
    love.graphics.setFont(smallFont)

    -- print the welcome text
    -- position it in the middle as close as possible 

    love.graphics.printf('HELLO NEW PONG', 0, VIRTUAL_HEIGHT/2 - 8, VIRTUAL_WIDTH, 'center')
    
    --NOTE: ALIGNMENT IS BASED ON THE WHOLE WIDTH OF THE WINDOW, THUS WE SET x = 0 NOT VIRTUAL_WIDTH/2

    --printing the score 
    -- I want to use bigger font for this:
    love.graphics.setFont(largeFont)
    love.graphics.printf("0 - 0", 0, 0, VIRTUAL_WIDTH, 'center')

    -- rendering the ball
    -- the ball will be rendered as circle
    love.graphics.circle('fill', VIRTUAL_WIDTH/2 - 3, VIRTUAL_HEIGHT/2 -3, 3)

    -- the specification for the Player's pad:
    PAD_LENGTH = 40
    PAD_THICK = 5

    -- make the player 1 pad
    -- the pad ia a rectangle 
    love.graphics.rectangle("line", 3, VIRTUAL_HEIGHT/2 - PAD_LENGTH / 2, PAD_THICK, PAD_LENGTH)

    -- makt the pad for player 2
    love.graphics.rectangle("fill", VIRTUAL_WIDTH - 3 - PAD_THICK, VIRTUAL_HEIGHT / 2 - PAD_LENGTH /2 , PAD_THICK, PAD_LENGTH)

    -- end the rendering process by push lib
    push:apply('end')
end
