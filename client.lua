---@diagnostic disable: trailing-space, undefined-global
local loadedParts = {}
local Maps = {
    ["hal_annesburg"] = {
        ymap = vector3(2953.074219, 1370.290283, 47.970051)
    },
    ["hal_stdenis"] = {
        ymap = vector3(2706.101318, -1407.201538, 45.988113)
    },
    ["hal_stdenis2"] = {
        ymap = vector3(2574.532227, -1194.389771, 53.970734)
    },
    ["hall_armadillo"] = {
        ymap = vector3(-3679.198975, -2620.911621, -10.784495)
    },
    ["hall_blackwater"] = {
        ymap = vector3(-794.225891, -1293.375977, 43.165897)
    },
    ["hall_manoir"] = {
        ymap = vector3(1006.956360, -1679.923218, 46.372604)
    },
    ["hall_rhodes"] = {
        ymap = vector3(1378.413696, -1377.653931, 81.147041)
    },
    ["hall_straw"] = {
        ymap = vector3(-1802.282715, -382.132660, 161.595490)
    },
    ["hall_tumbleweed"] = {
        ymap = vector3(-5475.946289, -2954.455078, -1.756008)
    },
    ["hall_valentine"] = {
        ymap = vector3(-351.351532, 777.648682, 115.826218)
    },
}

local function Distance(coords1, coords2)
    return #(coords1 - coords2)
end

local function UnloadMap(mapName)
    if loadedParts[mapName] then
        Wait(1000)
        RemoveImap(GetHashKey(mapName))
        loadedParts[mapName] = nil
        print('Déchargement de la map : ' .. mapName)
    end
end

local function LoadMap(mapName)
    if not loadedParts[mapName] then
        Wait(1000)
        RequestImap(GetHashKey(mapName))
        loadedParts[mapName] = true
        print('Chargement de la map : ' .. mapName)
    end
end

local function UnLoadAllMaps()
    for mapName, _ in pairs(Maps) do
        if not loadedParts[mapName] then 
            RemoveImap(GetHashKey(mapName))
            loadedParts[mapName] = nil
        end
    end
end

local function LoadUnloadMapParts(playerCoords)
    local loadDistance = 300 
    local unloadDistance = 310
    for mapName, mapData in pairs(Maps) do
        local dist = Distance(playerCoords, mapData.ymap)
        if dist <= loadDistance then
            LoadMap(mapName)
        elseif dist > unloadDistance and loadedParts[mapName] then 
            UnloadMap(mapName)
        end
    end
end


AddEventHandler('onClientMapStart', function()
    CreateThread(function()
        UnLoadAllMaps() 
        while true do 
            local playerCoords = GetEntityCoords(PlayerPedId())
            LoadUnloadMapParts(playerCoords)
            Wait(2000) 
        end
    end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        CreateThread(function()
            UnLoadAllMaps()
            while true do 
                local playerCoords = GetEntityCoords(PlayerPedId())
                LoadUnloadMapParts(playerCoords)
                Wait(2000)
            end
        end)
    end
end)