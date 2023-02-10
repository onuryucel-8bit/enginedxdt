local MOD_gpCore ={}

local drawList={}


local buttonClass 
local labelClass
local cursorYClass

local mouseX,mouseY
local mouseWidth,mouseHeight = 10,10

function MOD_gpCore.init()

    buttonClass = require("Enginedxdt.Core.guip.guiElements.button")
    labelClass = require("Enginedxdt.Core.guip.guiElements.label")
    cursorYClass = require("Enginedxdt.Core.guip.guiElements.cursorY")

    mouseX,mouseY = 0,0
end

---takes mouse coordinats
---@param mouseX_ integer
---@param mouseY_ integer
function MOD_gpCore.update(mouseX_,mouseY_)
    mouseX = mouseX_
    mouseY = mouseY_

    
end

--=========== CREATE GUI FUNCTIONS ===----

function MOD_gpCore.createCursorY(x,y,id)
    table.insert(drawList,cursorYClass.newCursorY(x,y,id))
end

function MOD_gpCore.createLabel(x,y,text)

    table.insert(drawList,labelClass.newLabel(x,y,text))
end

function MOD_gpCore.createButton(x,y,width,height,labelText,drawmode,id,color_)

    local labelOBJ = labelClass.newLabel(x,y,labelText)
    table.insert(drawList,buttonClass.newButton(x,y,width,height,labelOBJ,drawmode,id,color_))
end



--=========== CREATE GUI FUNCTIONS ===----


local function collisionDetection(index)
    
    if 
       drawList[index].x < mouseX + mouseWidth   and
       drawList[index].x + drawList[index].width > mouseX   and
       drawList[index].y < mouseY + mouseHeight  and
       drawList[index].y + drawList[index].height > mouseY
    then
        
        return true
    end
    return false
end

local function findIndex(id)
    for index, guiObject in ipairs(drawList) do
        if guiObject.id == id then    
            return index      
        end
    end        
end

function MOD_gpCore.setButtonPos(id,x,y)
    drawList[findIndex(id)]:setPosition(x,y)
end

function MOD_gpCore.setButtonLabel(id,text)
    drawList[findIndex(id)]:setLabel(text)
end

function MOD_gpCore.setLabelText(id,text)
    drawList[findIndex(id)]:setText(text)
end

function MOD_gpCore.getButtonColor(id)
    return drawList[findIndex(id)]:getColor()
end

function MOD_gpCore.setButtonColor(id,color_)
    drawList[findIndex(id)]:setColor(color_)
end

--============= EVENTS ===================--


function MOD_gpCore.moveCursorY(id,direction)
    local tempCursorY = drawList[findIndex(id)]
    local tempPos = tempCursorY:getPosition()

    if direction > 0 then
        tempPos.y = tempPos.y + tempCursorY.speed
    else
        tempPos.y = tempPos.y - tempCursorY.speed
    end
    tempCursorY:setPosition(tempPos.x,tempPos.y)
end


---id ye sahip elemanin ustunde fare olup olmadigini kontrol eder
---@param id string
---@return boolean
function MOD_gpCore.isHovered(id)

    return collisionDetection(findIndex(id))
end

--============= EVENTS ===================--

function MOD_gpCore.draw()
    for _, guiObject in ipairs(drawList) do
        guiObject:draw()
        
    end
end

return MOD_gpCore