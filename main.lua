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

-- require pad as class
require 'pad2'
require 'ball'
-- the specification for the Player's pad:
PAD_LENGTH = 40
PAD_THICK = 5

-- Ball specification 
BALL_RADIUS = 3

-- specified maximum score to end the game
MAX_SCORE = 3
-- TODO: THIS IS TEST ONLY THAT USE MAX SCORE = 3 CHANGE LATER ON 

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

    -- initiate player 1
    player1 = Pad(PAD_LENGTH, PAD_THICK, 3, VIRTUAL_HEIGHT/2 - PAD_LENGTH / 2, VIRTUAL_WIDTH, VIRTUAL_HEIGHT, "line")
    -- initiate player 2
    player2 = Pad(PAD_LENGTH, PAD_THICK, VIRTUAL_WIDTH - 3 - PAD_THICK, VIRTUAL_HEIGHT / 2 - PAD_LENGTH /2, VIRTUAL_WIDTH, VIRTUAL_HEIGHT, "fill")

    -- initiate player goal to empty string
    playerGoal = ""

    -- initiate ball
    ball = Ball(BALL_RADIUS, VIRTUAL_WIDTH/2 - BALL_RADIUS, VIRTUAL_HEIGHT/2 - BALL_RADIUS, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    -- : initiate gamestate variable and set it to 'start' this is the beginning of the game
    gameState = 'start'
end

--I want to make the apps quit when the user hit the escape key
function love.keypressed(key)
    -- : put the gamestate to put the game into its play or start (use spacebar or enter/return key)
    
    if key == 'escape' then
        --escape means quit the window
        love.event.quit()
    end
    if key == 'space' then
        if gameState == 'start' then
            gameState = 'play'
        elseif gameState == 'play' then
            gameState = 'pause'
        elseif gameState == 'pause' then
            gameState = 'play'
        elseif gameState == 'goal' then
            gameState = 'play'
        elseif gameState == 'over' then
            -- reset all
            player1:reset()
            player2:reset()
            ball:reset()
            gameState = 'start'
        end
    end
end

function love.draw()
    -- begin rendering using the push lib
    push:start()
    
    --some modification: change the background to look less black
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    -- set the font to the new font ():
    love.graphics.setFont(smallFont)

    --printing the score 
    -- I want to use bigger font for this:
    love.graphics.setFont(largeFont)

    -- print this score board for each player
    player1Score = player1:getScore()
    player2Score = player2:getScore()
    love.graphics.printf(player1Score.." - "..player2Score, 0, 0, VIRTUAL_WIDTH, 'center')

    if gameState == 'play' then
        -- show the ball and pads: 
        -- render the player 1 pad
        -- the pad ia a rectangle 
        player1:render()

        -- render the pad for player 2
        player2:render()

        -- render the ball
        ball:render()
    elseif gameState == 'pause' then
        -- else this will be paused
        pauseScreen()

    elseif gameState == 'start' then 
        -- this will be start screen
        startScreen()
    elseif gameState == 'goal' then
        -- this will call the latest goal player
        goalScreen(playerGoal)
    elseif gameState == 'over' then
        -- this means game over
        overScreen(playerGoal)
    end
    
    -- end the rendering process by push lib
    push:apply('end')
end

function love.update(dt)
    -- : set gamestate to 'play' to make the update function then all the game feature is on
    if gameState == 'play' then
        playStateUpdate(dt)
    end
    
end

function isCollide(pad, ball)
    -- detect if ball is colliding with the pad
    -- pad coordinate data
    padX0 = pad:getPosX0()
    padX1 = pad:getPosX1()
    padY0 = pad:getPosY0()
    padY1 = pad:getPosY1()

    -- the ball coordinate data
    ballX = ball:getPosX()
    ballY = ball:getPosY()

    return (ballX >= padX0 and ballX <= padX1 and ballY >= padY0 and ballY <= padY1)
end

function player1Goal(ball)
    -- detect if ball position X pass the max X (Width)
    return ball:getPosX() > VIRTUAL_WIDTH
end

function player2Goal(ball)
    -- detect if ball position X pass the 0 coordinate width
    return ball:getPosX() < 0
end

-- this is the rendered screen for each game state
function startScreen()
    -- this is the draw for gameState=start
    love.graphics.printf("NEW PONG", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "center")
end

function pauseScreen()
    -- render screen when game state is paused
    love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "center")
end

function overScreen(playerName)
    -- render screen when game over
    love.graphics.printf("GAME OVER "..playerName.." WIN!!", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "center")
end

function goalScreen(playerName)
    -- render screen to decide which player add one goal
    love.graphics.printf(playerName.." GOAL!", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "center")
end

-- this is the functions on updates handled on each gameState
function playStateUpdate()
    -- TODO what happend in update fucntion for gameState=='play'
end

function goalStateUpdate(dt)
    -- TODO what happen in gameState=='goal'
    -- the ball must be located in the losing player
    -- the pad of both player can still moved
    -- the ball must follow the losing player pads movement
    -- only when space bar is pressed the ball then can be played
end

function playStateUpdate(dt)
    -- updates in gameState=='play'
    ball:move(dt)

    -- testing pad collide to pad
    if isCollide(player1, ball) or isCollide(player2, ball) then
        -- ball collide with pad then need to be deflected
        ball:collideWithPad()
    end

    -- testing the ball is pass the screen width
    if player1Goal(ball) then
        -- add player1 score by one
        score = player1:getScore()
        score = score + 1
        player1:setScore(score)

        -- reset the ball position
        ball:reset()

        -- change palyer goal value
        playerGoal = 'Player 1'

        -- change game state
        if score >= MAX_SCORE then
            gameState = 'over'
        else
            gameState = 'goal'
        end
    end

    if player2Goal(ball) then
        -- add player1 score by one
        score = player2:getScore()
        score = score + 1
        player2:setScore(score)

        -- reset the ball position
        ball:reset()

        -- change palyer goal value
        playerGoal = 'Player 2'

        -- change game state
        if score >= MAX_SCORE then
            gameState = 'over'
        else
            gameState = 'goal'
        end
    end
    
    -- the key interaction for user inputs
    -- this is player 1 part
    if love.keyboard.isDown("w") then
        -- move the player 1 pad upwards
        player1:moveUp(dt)
    end
    
    if love.keyboard.isDown('s') then
        -- move the player 1 pad downward
        player1:moveDown(dt)
    end

    -- this is part for the player 2
    if love.keyboard.isDown('up') then 
        -- move the player 2 pad upward
        player2:moveUp(dt)
    end

    if love.keyboard.isDown('down') then 
        -- move the player 2 pad downward
        player2:moveDown(dt)
    end
end
