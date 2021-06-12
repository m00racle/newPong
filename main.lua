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

-- the speed of movement of the pads:
-- for now we make it constant
FRAME_SPEED = 100


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

    -- the specification for the Player's pad:
    PAD_LENGTH = 40
    PAD_THICK = 5

    -- position of the pad for player 1
    player1X = 3
    player1Y = VIRTUAL_HEIGHT/2 - PAD_LENGTH / 2

    -- position of the pad for player 2
    player2X = VIRTUAL_WIDTH - 3 - PAD_THICK
    player2Y = VIRTUAL_HEIGHT / 2 - PAD_LENGTH /2
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

    -- make the player 1 pad
    -- the pad ia a rectangle 
    love.graphics.rectangle("line", player1X, player1Y , PAD_THICK, PAD_LENGTH)

    -- makt the pad for player 2
    love.graphics.rectangle("fill", player2X, player2Y, PAD_THICK, PAD_LENGTH)

    -- end the rendering process by push lib
    push:apply('end')
end

function love.update(dt)
    -- the key interaction for user inputs
    
    -- this is player 1 part
    if love.keyboard.isDown("w") then
        -- move the player 1 pad upwards
        player1Y = player1Y - dt * FRAME_SPEED
    end
    
    if love.keyboard.isDown('s') then
        -- move the player 1 pad downward
        player1Y = player1Y + dt * FRAME_SPEED
    end

    -- this is part for the player 2
    if love.keyboard.isDown('up') then 
        -- move the player 2 pad upward
        player2Y = player2Y - dt * FRAME_SPEED
    end

    if love.keyboard.isDown('down') then 
        -- move the player 2 pad downward
        player2Y = player2Y + dt * FRAME_SPEED
    end
    
end