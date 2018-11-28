--[[
-- Class Bullets, it manages the bullets. Init, Update and draw them.
--]]
require 'Bullet'

Bullets = Class{}

--constructor
function Bullets:init()

  self.bullets = {}
end

-- Update every star
function Bullets:update()

  if next(self.bullets) ~= nil then
    for k,v in pairs(self.bullets) do
      v:update()
    end
  end
end

-- Draw every star
function Bullets:draw()

  if next(self.bullets) ~= nil then
    for k,v in pairs(self.bullets) do
      v:draw()

    end
  end

end

function Bullets:addBullet(x,y)
  table.insert(self.bullets, Bullet(x,y))
end
