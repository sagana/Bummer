--[[
-- Starfield is the manager class for Star, it creates the field and update and
-- draw every single star.
]]--
require 'Star'

Starfield = Class{}

--constructor
function Starfield:init()

  self.STAR_NUM = 150
  self.stars = {}
  --Fill starfield with stars
  for i = 1, self.STAR_NUM do
    self.stars[i] = Star()
  end
end

-- Update every star
function Starfield:update()

  for i = 1, self.STAR_NUM do
    self.stars[i]:update()
  end

end

-- Draw every star
function Starfield:draw()

    for i = 1, self.STAR_NUM do
      self.stars[i]:draw()
    end
end

--[[
-- Add or Subtract velocity
-- @num subtrahend (where self.vel is the minuend)
-- @operation ('add' or 'sub')
--]]
function Starfield:setVel(num, operation)
  for i = 1, self.STAR_NUM do
    self.stars[i]:setVel(num*love.timer.getDelta(),operation)
  end
end
