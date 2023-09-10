local keyboardInput={}

keyboardInput.__index = keyboardInput
function keyboardInput.newKeyboard(keys)

  local this = {
    keys = keys
  }
  setmetatable(this,keyboardInput)
  return this
end

function keyboardInput:keypressed(key)
  
  if key == "escape" then
    love.event.quit()
  end

  if key == "w"then
    self.keys.up = true
  elseif key == "s"then
    self.keys.down = true
  end
  
end

function keyboardInput:keyreleased(key)
  if key == "w"then
    self.keys.up = false
  elseif key == "s"then
    self.keys.down = false
  end
end

return keyboardInput