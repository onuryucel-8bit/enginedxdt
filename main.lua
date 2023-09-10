_G.love = love

--VERSION 1.1.18

local player
local Keyboard
local keys = {up = false,down = false,left = false, right = false}

function love.keypressed(key)
   Keyboard:keypressed(key)
end

function love.keyreleased(key)
    Keyboard:keyreleased(key)
end

function love.load()
    local ckeyboard = require("Inputs.keyboardInput")
    Keyboard = ckeyboard.newKeyboard(keys)

    local Player = require("entitys.Player")
    player = Player.new(100,100,32,32)
end

function love.update(dt)
    if keys.up then
       player:update(dt,1) 
    elseif keys.down then
       player:update(dt,3) 
    end
end

function love.draw()
    
    player:draw()
end
