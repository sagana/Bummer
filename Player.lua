Player = Class {}

--costruttore
function Player:init()
  self.x      = VIR_WIDTH/2
  self.y      = VIR_HEIGHT/2
  self.img    = love.graphics.newImage("assets/Images/Guitar.png")
  self.speed  = 50
  self.shootLag = 0.3
  self.timer = 0
  self.maxHealth = 5
  self.maxShield = 5
  self.health = self.maxHealth
  self.shield = self.maxShield
end

function Player:getSpeed()
  return self.speed
end

function Player:input()


   key = ''

  if love.keyboard.isDown('up') and self.y > 0 then
      self.y = self.y - self.speed * love.timer.getDelta()
      key = 'up'
  end
  if love.keyboard.isDown('down') and self.y + self.img:getHeight() < VIR_HEIGHT then
      self.y = self.y + self.speed * love.timer.getDelta()
      key = 'down'
  end

  if love.keyboard.isDown('left') and self.x > 0 then
      self.x = self.x - self.speed * love.timer.getDelta()
  end
  if love.keyboard.isDown('right') and self.x + self.img:getWidth() < VIR_WIDTH then
      self.x = self.x + self.speed * love.timer.getDelta()
  end

  if love.keyboard.isDown('space') then
    key = 'space'
  end

  return key

end

function Player:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
