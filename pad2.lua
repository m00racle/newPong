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
    end
}

-- I choose to use the external function definition since this class will be inside a separate file.

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