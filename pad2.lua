-- This is developing syntetic LUA class using the hump.class library. 

Class = require 'class'

-- class initialisation 
-- The init will include: length, thickness, posX, posY, maxY, mode
--      length: length of the pad (pixels)
--      thickness: the thickness of the pad (pixels)
--      posX = the initial position of the pad in x pixels
--      posY = the initial position along the window Y axis.
--      maxY = the maximum Y postion that a pad can be located.

Pad = Class{
    init = function(self, length, thickness, posX, posY, maxX, maxY, mode)
        self.length = length
        self.thickness = thickness
        self.posX = posX
        self.posY = posY
        self.maxX = maxX
        self.maxY = maxY 
        self.mode = mode
        -- I set the initial speed for each player's pads to 100
        self.speed = 100
        -- initial score
        self.score = 0
    end
}

--     -- function to get position data of each player's pad
--     -- the position will be a table of x0, x1, y0, and y1
--     -- the position is the all edges position in the coordinate
--     -- x0 is the most left , and y0 is the highest most of the


function Pad:getPosX0()
    -- funtion to get x0 coordinate of the pad
    return self.posX
end

function Pad:getPosX1()
    -- fucntion to get the x1 coordinate of the pad
    return self.posX + self.thickness
end

function Pad:getPosY0()
    -- function to get the y0 coordinate position
    return self.posY
end

function Pad:getPosY1()
    -- function to get the y1 coordinate position
    return self.posY + self.length
end

-- thePad will have function on render
--      render will draw the updated properties of the pad.
--      render will draw pad as rectangle.
function Pad:render()
    love.graphics.rectangle(self.mode, self.posX, self.posY, self.thickness, self.length)
end

-- Pad able to move up and down 
--      but the delta time must be taken from the system and outside the property of the pad.
--      when the pad is still inside the area it allowed to roam the move there.
--      If the limit of its movement is achieved then stays!
function Pad:moveUp(dY)
    if(self.posY <= 0)
    then
        self.posY = self.posY
    else
        -- update the posY of the pad in the game screen
        -- dY is the dt from the update love function.
        self.posY = self.posY - self.speed*dY
    end

end

function Pad:moveDown(dY)
    if((self.posY + self.length) >= self.maxY)
    then
        self.posY = self.posY
    else
        -- update the posY of the pad in the game screen move down
        -- dY is the dt in the update love function.
        self.posY = self.posY + self.speed*dY
    end

end

-- Pad must be able to reset its position 
--      If one rounds is already won by one of the player then before the next round begin most likely the pad must be reset to its initial position.
function Pad:setScore(score)
    -- set the score if there is changes in the play
    self.score = score
end

function Pad:getScore()
    -- get the score if called by other function
    return self.score
end