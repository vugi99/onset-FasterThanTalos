cl_FTT = [[
    function FTT_createtable_ex(tbl, parents)
        parents = parents or {}
        local newtbl = {}
        for k, v in pairs(tbl) do
            if (type(v) ~= "table" or v == tbl or parents[k] == v) then
                newtbl[k] = v
            else
                parents[k] = v
                newtbl[k] = FTT_createtable_ex(v, parents)
                parents = {}
            end
        end
        return newtbl
    end

    function FTT_IsValidDoor(id)
        for i, v in ipairs(GetStreamedDoors()) do
            if v == id then
                return true
            end
        end
        return false
    end

    function FTT_IsValidText3D(id)
        for i, v in ipairs(GetStreamedText3D()) do
            if v == id then
                return true
            end
        end
        return false
    end

    function FTT_GetText3DActor(id)
        if id then
            if FTT_IsValidText3D(id) then
                local x, y, z = GetText3DLocation(id)
                for k, actor in pairs(GetWorld():GetActorsByClass(AActor.Class())) do
                    if actor:IsValid() then
                        local loc = actor:GetActorLocation()
                        if (loc.X == x and loc.Y == y and loc.Z == z) then
                            return actor
                        end
                    end
                end
            end
        end
        return false
    end
]]