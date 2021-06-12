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


-- Pad:reachedEdge(topEdge, bottomEdge):
function Pad:reachedEdge()
    -- check if the pad reach the edge of the screen
end


-- Pad.move(deltaX, deltaY):

-- Pad:reset()
function Pad:reset()
    -- return the pad back to initial position in the middle:
    self.posY = self.maxY / 2 - self.length / 2
    Pad:render()
end