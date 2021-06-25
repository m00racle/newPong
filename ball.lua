-- this is the ball class
Class = require 'class'


-- function Ball:create(radius, posX, posY, maxX, maxY)
-- creates ball with size (if it can be radius of circle good)
-- if not I will just make it as rectangle with small size
-- the maxX and maxY of the position.
-- I dont think the maxX is not needed since it will just go out the screen if does not meet any pad.
Ball = Class{
    init = function(self, radius, posX, posY, maxX, maxY)
        self.radius = radius
        self.posX = posX
        self.posY = posY
        self.maxY = maxY
        -- now for the preset properties
        self.speed = 100
        self.direction = math.random(0, math.pi*2)
    end
}

-- function rendering the ball
function Ball:render()
    love.graphics.circle("fill", self.posX, self.posY, self.radius)
end
-- function isCollided
-- detect if the ball object is colliding
-- if yes return true (for now)

-- function collideWithWall
-- I think this is the 

-- function collideWithPad


-- function reset


-- function move
function Ball:move(dt)
    -- this is basic movement testing direction bearing.
    self.posX = self.posX + dt*self.speed*math.cos(self.direction)
    self.posY = self.posY + dt*self.speed*math.sin(self.direction)
end


-- function destroy