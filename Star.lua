--[[
-- Class Star, it represent a single star. It's randomly generated in his
-- own constructor, it move  and can be resetted at any time of need.
--]]
Star = Class{}

--constructor
function Star:init()

    self.x          = math.random(0, VIR_WIDTH)
    self.y          = math.random(0, VIR_HEIGHT)
    self.originY    = self.y
    self.vel        = love.math.noise(math.random()*self.x)*300
    self.rad        = love.math.noise( math.random()*self.x ) * 2
    self.originVel  = self.vel


    self.starColor  = {1,1,1,1}
    self.tailColor  = self:randomizeColor()
end

--movement and reset are managed in the update
function Star:update()
  self.originY = self.y
  self.y = self.y + (self.vel * love.timer.getDelta())

  if self.y > VIR_HEIGHT then
    self:reset()
  end
end

--draw everything
function Star:draw()
  love.graphics.setColor(self.starColor)
  love.graphics.ellipse('fill', self.x, self.y, self.rad, self.rad)
  love.graphics.setColor(self.tailColor)
  love.graphics.line(self.x, self.y, self.x, self.originY )
  love.graphics.setColor(255, 255, 255, 255) --color reset
end


--[[
-- Return a random color between blu and purple
--]]
function Star:randomizeColor()

  local blu = love.math.noise(math.random()*self.x)
  local red = love.math.noise(math.random()*self.y)
  local green = 0

  if red > blu then --let's avoid red stars
    tmp = blu
    blu = red
    red = tmp
  end

  return {red,green,blu,1}
end

--[[
-- Add or Subtract velocity
-- @num subtrahend (where self.vel is the minuend)
-- @operation ('add' or 'sub')
--]]
function Star:setVel(num, operation)
  if operation == 'sub' and self.vel >= 0 then
    self.vel = self.vel - num
  elseif operation == 'add' and self.vel <= 300 then
    self.vel = self.vel + num
  end

end

--reset the y position and randomize every other attribute
function Star:reset()

  self.x    = math.random(0, VIR_WIDTH)
  self.y    = -10
  self.vel  = love.math.noise(math.random()*self.x)*300
  self.originY = self.y
  self.tailColor = self:randomizeColor()
end
