local Collisions = {}

---comment
---@param A table
---@param B table
---@return boolean
function Collisions.aabb(A,B)
    
    if 
        A.x < B.x + B.width   and
        A.x + A.width > B.x   and
        A.y < B.y + B.height  and
        A.y + A.height > B.y
    then
        return true
    end
    return false
end

---vektor kullanan tablolar icin carpisma algilayici
---@param A table
---@param B table
---@return boolean
function Collisions.VectorAll_xy_aabb(A,B)
    if 
        A.location.x            < B.location.x + B.width   and
        A.location.x + A.width  > B.location.x   and
        A.location.y            < B.location.y + B.height  and
        A.location.y + A.height > B.location.y
    then
      return true
    end
    return false
end

---A table ,B vector table
---@param A table
---@param B table
---@return boolean
function Collisions.Vector_xy_aabb(A,B)
    if 
        A.x < B.location.x + B.width   and
        A.x + A.width > B.location.x   and
        A.y < B.location.y + B.height  and
        A.y + A.height > B.location.y
    then
      return true
    end
    return false
end

return Collisions
