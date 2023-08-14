local GameState={}

GameState.__index = GameState
function GameState.newGameState()
    local this = {
        
    stateManager = nil,
  
    Player = nil,
    Keys = {},
    
    }    
    setmetatable(this,GameState)
    return this
end

------------------------------------------------------
--init()
------------------------------------------------------

function GameState:init_Player()

    local playerClass = require("Enginedxdt.entitys.Player")
    self.Player = playerClass.new(100,100,32,32)

    self.Keys.up = false
    self.Keys.down = false
    self.Keys.right = false
    self.Keys.left = false

end  

function GameState:init (statemanager_)

    self.stateManager = statemanager_        
    
    self:init_Player()
end

------------------------------------------------------
--gameLogic()
------------------------------------------------------
function GameState:movePlayer(dt)
    if self.Keys.up then
        self.Player:update(dt,1)

    elseif self.Keys.right then
        self.Player:update(dt,2)

    elseif self.Keys.down then
        self.Player:update(dt,3)
        
    elseif self.Keys.left then
        self.Player:update(dt,4)
    end
end

------------------------------------------------------
--update()
------------------------------------------------------
function GameState:update (dt)
    
    self:movePlayer(dt)
end

------------------------------------------------------
--draw()
------------------------------------------------------
function GameState:draw ()
   
    love.graphics.print("gameState")

    
    self.Player:draw()
end        


return GameState