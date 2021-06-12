-- this is the file specific to model players' Pads.

-- Pads 
-- size, thickness and length
-- prepare the table of Pads
Pad = {}
Pad.__index = Pad 


-- methods:
-- Pad:create(length, thickness, posX, posY, mode):
function Pad:create(length, thickness, posX, posY, maxY, mode)
    -- create the local table (act as class )
    local thisPad = {}
    -- set the local table as part of Pad table as parent
    setmetatable(thisPad, Pad)
    -- initialize the object class
    thisPad.length = length
    thisPad.thickness = thickness
    thisPad.posX = posX
    thisPad.posY = posY
    thisPad.maxY = maxY
    thisPad.mode = mode

    return thisPad
end

-- set render the pad
function Pad:render()
    love.graphics.rectangle(self.mode, self.posX, self.posY , self.thickness, self.length)
end


-- Pad.move(deltaY):
function Pad:moveUp(deltaY)
    if(self.posY <= 0 )
    then
        self.posY = self.posY
    else
        -- update the self y position up in the game screen
        -- deltaY must be set by the user recommended using dt from the update love fucntion in the main framework
        self.posY = self.posY - deltaY
    end
    
end

function Pad:moveDown(deltaY)
    if((self.posY + self.length) >= self.maxY)
    then
        self.posY = self.posY
    else
        -- update the self y position up in the game screen
        -- deltaY must be set by the user recommended using dt from the update love fucntion in the main framework
        self.posY = self.posY + deltaY
    end
    
end


-- Pad:reset()
function Pad:reset()
    -- return the pad back to initial position in the middle:
    self.posY = self.maxY / 2 - self.length / 2
    Pad:render()
end