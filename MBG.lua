-- File della classe MBG (Mobile Background) il cui scopo è provvedere
-- ad uno sfondo dinamico che imiti la visione dello spazio da
-- una navicella
MBG = Class{}

--Costruttore
function MBG:init()

    self.x          = math.random(0, VIR_WIDTH)
    self.y          = math.random(0, VIR_HEIGHT)
    self.originY    = self.y
    self.vel        = love.math.noise(math.random()*self.x)*300
    self.rad        = love.math.noise( math.random()*self.x ) * 2
    self.originVel  = self.vel

    --COLORE CODA
    local blu = love.math.noise(math.random()*self.x)
    local red = love.math.noise(math.random()*self.y)
    local green = 0

    if red > blu then --evitiamo stelle rosse
      tmp = blu
      blu = red
      red = tmp
    end

    self.color      = {
                          red,
                          green,
                          blu,
                          1
                      }
end

-- aumenta o diminuisce la velocità
-- @num sottraendo (dove self.vel è il minuendo)
-- @operation tipo di operazione (addizione o sottrazione)
function MBG:setVel(num, operation)
  if operation == 'sub' and self.vel >= 0 then
    self.vel = self.vel - num
  elseif operation == 'add' and self.vel <= 300 then
    self.vel = self.vel + num
  end

end

-- ferma o riprende il movimento della stella
function MBG:pause()
  if self.vel ~= 0 then
    self.vel = 0
  else
    self.vel = self.originVel
  end
end

--resetta i parametri a nuovi valori randomici
function MBG:reset()

  self.x    = math.random(0, VIR_WIDTH)
  self.y    = math.random(-10)
  self.vel  = love.math.noise(math.random()*self.x)*300
  self.originY = self.y
  --COLORE
  local blu = love.math.noise(math.random()*self.x)
  local red = love.math.noise(math.random()*self.y)
  local green = 0

  if blu < 0.03 then
    green = 255
    red = 0
    blu = 0
    print("green")
  elseif red > blu then --evitiamo stelle rosse
    tmp = blu
    blu = red
    red = tmp
  end

  self.color      = {
                        red,
                        green,
                        blu,
                        1
                    }
end

-- movimento e reset della stella sono gestiti qui
function MBG:update()
  self.originY = self.y
  self.y = self.y + (self.vel * love.timer.getDelta())

  if self.y > VIR_HEIGHT then
    self:reset()
  end
end

-- disegnamo la stella
function MBG:draw()
  love.graphics.setColor(255, 255, 255, 255) --la stella è bianca
  love.graphics.ellipse('fill', self.x, self.y, self.rad, self.rad)
  love.graphics.setColor(self.color) --la sua coda ha un colore generato randomicamente
  love.graphics.line(self.x, self.y, self.x, self.originY )
  love.graphics.setColor(255, 255, 255, 255) --reset del colore
end

--return MBG
