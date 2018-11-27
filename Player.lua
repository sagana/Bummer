Player = Class {}

--costruttore
function Player:init()
  self.x      = VIR_WIDTH/2
  self.y      = VIR_HEIGHT/2
  self.img    = love.graphics.newImage("assets/Images/Guitar.png")
  self.speed  = 150
end

function Player:getSpeed()
  return self.speed
end

function Player:input()

   key = ''

  if love.keyboard.isDown('up') then
      self.y = self.y - self.speed * love.timer.getDelta()
      key = 'up'
  end
  if love.keyboard.isDown('down') then
      self.y = self.y + self.speed * love.timer.getDelta()
      key = 'down'
  end

  if love.keyboard.isDown('left') then
      self.x = self.x - self.speed * love.timer.getDelta()
  end
  if love.keyboard.isDown('right') then
      self.x = self.x + self.speed * love.timer.getDelta()
  end

  return key

end

function Player:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
