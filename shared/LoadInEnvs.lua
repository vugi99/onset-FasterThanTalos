

function GenCodeToLoad()
    if IsServer() then
        return sh_FTT .. sv_FTT
    else
        return sh_FTT .. cl_FTT
    end
end

AddEvent("RequestCodeLoad", function(Import, p_name)
    for i, v in ipairs(Import) do
        if v == "FasterThanTalos" then
            CallEvent("CodeLoaderLoad", "FasterThanTalos", p_name, GenCodeToLoad())
        end
    end
end)

AddEvent("OnPackageStart", function()
    for i, v in ipairs(GetAllPackages()) do
        local im = ImportPackage(v)
        if im then
            if im["CodeLoaderNeedFasterThanTalos"] then
                CallEvent("CodeLoaderLoad", "FasterThanTalos", v, GenCodeToLoad())
            end
        end
    end
end)