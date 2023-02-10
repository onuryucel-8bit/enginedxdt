local TileLoader = {}

TileLoader.__index = TileLoader
function TileLoader.new()
    local this = {
        tilemap = {}
    }
    setmetatable(this,TileLoader)
    return this
end

--txt dosyasindaki haritayi 2 boyutlu diziye atar
function TileLoader:load(path)
    local rowTiles = {}

    local file = io.open(path,"r")
    if file == nil then
        error("ERROR : TileLoader.lua ln 18 => file not found ")
    end

    local mapWidth  = file:read("l")
    local mapHeight = file:read("l")

    for i = 1, mapHeight, 1 do
        
        print(file:read("l"))
        
    end

end


return TileLoader