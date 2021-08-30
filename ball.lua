-- this is the ball class
Class = require 'class'
START_SPEED = 200
UPPER_SPEED_LIMIT = 350
BOTTOM_SPEED_LIMIT = 200
SPEED_INCREMENT = 50
SPEED_DECREMENT = 0.1

HIT_PAD_AUDIO = "audio/hit_pad.wav"
HIT_WALL_AUDIO = "audio/hit_wall.wav"

-- function Ball:create(radius, posX, posY, maxX, maxY)
-- creates ball with size (if it can be radius of circle good)
-- if not I will just make it as rectangle with small size
-- the maxX and maxY of the position.
Ball = Class{
    init = function(self, radius, posX, posY, maxX, maxY)
        self.radius = radius
        self.posX = posX
        self.posY = posY
        self.maxX = maxX
        self.maxY = maxY
        -- now for the preset properties
        self.speed = START_SPEED
        self.direction = math.random(0, math.pi*2)
        -- direction is clockwise according to the positive x axis line as 0 degree.

        self.sounds = {}
        
        self.sounds["hit_pad"] = love.audio.newSource(HIT_PAD_AUDIO, "static")
        self.sounds["hit_wall"] = love.audio.newSource(HIT_WALL_AUDIO, "static")
    end
}

-- function rendering the ball
function Ball:render()
    love.graphics.circle("fill", self.posX, self.posY, self.radius)
end

-- function collideWithWall
-- : refactor rename this function to make this function to collideWithWall
function Ball:collideWithWall()
    -- change the direction of the ball due to collision
    if(self.posY <= 0 or self.posY >= self.maxY)
    then
        -- play the sound effect
        self.sounds["hit_wall"]:play()

        if(self.direction > 0 and self.direction < math.pi/2)
        then
            return (math.pi/2 - self.direction) + math.pi*3/2
        elseif(self.direction > math.pi/2 and self.direction < math.pi)
        then
            return math.pi*3/2 - (self.direction - math.pi/2)
        elseif(self.direction > math.pi and self.direction < math.pi*3/2)
        then
            return math.pi/2 + (math.pi*3/2 - self.direction)
        else
            return math.pi/2 - (self.direction - math.pi*3/2)
        end
    else
        return self.direction
    end
end

-- fucntion to set the position of the ball 
function Ball:setPosX(posX)
    --  set the x coordinate of the ball object
    self.posX = posX
end

function Ball:setPosY(posY)
    --  set the y coordinate of the ball object.
    self.posY = posY
end

function Ball:setDirection(direction)
    --  set the next direction of the ball
    self.direction = direction
end

function Ball:setSpeed(speed)
    -- set the ball speed
    self.speed = speed
end

-- function get position of the ball
function Ball:getPosX()
    -- function to get the x coordinate of the ball
    return self.posX 
end

function Ball:getPosY()
    -- function to get the y coordinate of the ball
    return self.posY
end

function Ball:collideWithPad()
    -- play the sound effect
    self.sounds["hit_pad"]:play()

    -- change the direction when colliding with pad
    if self.posX > self.maxX/2 then
        -- this collide with player 2
        self.direction = math.random(math.pi/6*4, math.pi/6*8)
    else
        -- this collide with player 1
        -- direction is deflected between 3/2 pi to pi/2 
        -- thus means - pi
        self.direction = math.random(math.pi/6*4, math.pi/6*8) - math.pi
    end

    -- change the speed due to collision to pad
    if self.speed < UPPER_SPEED_LIMIT then
        self.speed = self.speed + SPEED_INCREMENT
    end
end

-- function move
function Ball:move(dt)
    -- test if ball collide
    self.direction = self:collideWithWall()
    -- this is basic movement testing direction bearing.
    self.posX = self.posX + dt*self.speed*math.cos(self.direction)
    self.posY = self.posY + dt*self.speed*math.sin(self.direction)
    -- reduce the ball speed
    if self.speed > BOTTOM_SPEED_LIMIT then
        self.speed = self.speed - SPEED_DECREMENT
    end
end