-- this is the ball class
Class = require 'class'


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
        self.speed = 100
        self.direction = math.random(0, math.pi*2)
        -- direction is clockwise according to the positive x axis line as 0 degree.
    end
}

-- function rendering the ball
function Ball:render()
    love.graphics.circle("fill", self.posX, self.posY, self.radius)
end

-- function collideWithWall
-- : refactor rename this function to make this function to collideWithWall
function Ball:collideWithWall()
    -- print('posY:')
    -- print(self.posY)
    if(self.posY <= 0 or self.posY >= self.maxY)
    then
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
    -- change the direction when colliding with pad
    if self.posX > self.maxX/2 then
        -- this collide with player 2
        self.direction = math.random(math.pi/2, math.pi/2*3)
    else
        -- this collide with player 1
        -- direction is deflected between 3/2 pi to pi/2 
        -- thus means - pi
        self.direction = math.random(math.pi/2, math.pi/2*3) - math.pi
    end
end

-- function reset
function Ball:reset()
    -- reset the ball position to the middle of the screen
    -- : make the ball return to the middle of the screen 
    self.posX = self.maxX /2 - self.radius
    self.posY = self.maxY /2 - self.radius
end


-- function move
function Ball:move(dt)
    -- test if ball collide
    self.direction = self:collideWithWall()
    -- this is basic movement testing direction bearing.
    self.posX = self.posX + dt*self.speed*math.cos(self.direction)
    self.posY = self.posY + dt*self.speed*math.sin(self.direction)
end