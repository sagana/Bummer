--[[
-- Class Bullets, it manages the bullets. Init, Update and draw them.
--]]
require 'TableRemove'
require 'Bullet'

Bullets = Class{}

--constructor
function Bullets:init()

  self.bullets = {}
  self.bulletsTimer = Timer.new()
  self.shoot = false
  self.bulletDelay = 0.45
  self.bulletsTimer:every(self.bulletDelay, function() self.shoot = true end)
  self.bulletsTimer:every(10, function() self:cleanBullets() end )
end

-- Update every star
function Bullets:update()

  self.bulletsTimer:update(love.timer.getDelta())
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

function Bullets:cleanBullets()
local j
  if next(self.bullets) ~= nil then
      TableRemove(self.bullets, toKeep)
  end
end

--[[
  toKeep is used in pair with TableRemove(). It returns false if the bullet
  it's over the screen and not visible, telling TableRemove() to remove it.
]]
function toKeep(t,i,j)

  if t[i].y < -t[i].img:getHeight() then
    return false
  end
  return true
end
