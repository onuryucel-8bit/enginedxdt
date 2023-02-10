local Player = {}

Player.__index = Player

function Player.new(x,y,width,height)
    local this = {
        x=x,
        y=y,
        width=width,
        height=height,
        speed = 200
    }
    setmetatable(this,Player)
    return this
end

function Player:update(dt,direction)
    --up--
   if direction == 1 then
    self.y = self.y - self.speed*dt

    --down--
   elseif direction == 3 then
    self.y = self.y + self.speed*dt

    --right--
   elseif direction == 2 then
    self.x = self.x + self.speed*dt

    --left--
   elseif direction == 4 then
    self.x = self.x - self.speed*dt
   end
   
end

function Player:draw()
    love.graphics.rectangle("line",self.x,self.y,self.width,self.height)
end


return Player