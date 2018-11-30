--[[
-- Class Enemies, it manages the enemies. Init, Update and draw them.
--]]
require 'TableRemove'
require 'Enemy'

Enemies = Class{}

--constructor
function Enemies:init()

  self.enemies = {}
  self.enemiesTimer = Timer.new()
  self.enemiesTimer:every(10, function() self:cleanEnemies() end )
  self.enemiesTimer:every(1, function() self:addEnemy(love.math.random(0,VIR_WIDTH), -50,100) end )
end

-- Update every star
function Enemies:update()

  self.enemiesTimer:update(love.timer.getDelta())
  if next(self.enemies) ~= nil then
    for k,v in pairs(self.enemies) do
      v:update()
    end
  end
end

-- Draw every star
function Enemies:draw()
  if next(self.enemies) ~= nil then
    for k,v in pairs(self.enemies) do
      v:draw()

    end
  end

end

function Enemies:addEnemy(x,y, vel)
  table.insert(self.enemies, Enemy(x,y, vel))
end

function Enemies:cleanEnemies()
local j
  if next(self.enemies) ~= nil then
      TableRemove(self.enemies, toKeep)
  end
end

--[[
  toKeep is used in pair with TableRemove(). It returns false if the bullet
  it's over the screen and not visible, telling TableRemove() to remove it.
]]
function toKeep(t,i,j)

  if t[i].y > VIR_HEIGHT -200 then
    return false
  end
  return true
end
