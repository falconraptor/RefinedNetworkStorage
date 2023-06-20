--Adds object to the update system
function UpdateSys.addEntity(obj)
    game.print("adding")
    if valid(obj) == false then return end
    game.print("added")
    if global.entityTable == nil then global.entityTable = {} end
    
    if obj ~= nil and getmetatable(obj) ~= nil then
        if obj:valid() ~= true then
            obj:remove()
        elseif obj.thisEntity ~= nil and obj.thisEntity.valid == true then
            if obj.thisEntity.unit_number ~= nil then --for normal entities
                global.entityTable[obj.thisEntity.unit_number] = obj
            elseif obj.thisEntity.index ~= nil then  --for players
                global.entityTable[obj.thisEntity.index] = obj
            end
        end
    end
end

function UpdateSys.remove(obj)
    if obj.entID ~= nil then
        global.entityTable[obj.entID] = nil
    end
end

function UpdateSys.update(event)
    for _, obj in pairs(global.entityTable) do
        if valid(obj) == true and obj.update ~= nil then
            if safeCall(obj.update, obj, event) ~= true then
                game.print("gui-description.UpdateSysEntity_Failed", obj.thisEntity.name)
            end
        end
    end
end