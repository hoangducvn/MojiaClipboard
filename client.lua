local QBCore = exports['MojiaCity']:GetCoreObject()
local function round(input, decimalPlaces)
    return tonumber(string.format("%." .. (decimalPlaces or 0) .. "f", input))
end

local function CopyToClipboard(dataType)
    local ped = PlayerPedId()
    if dataType == 'coords2' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        SendNUIMessage({
            string = string.format('vector2(%s, %s),', x, y)
        })
        QBCore.Functions.Notify("Coordinates copied to clipboard!", "success")
    elseif dataType == 'coords3' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        SendNUIMessage({
            string = string.format('vector3(%s, %s, %s),', x, y, z)
        })
        QBCore.Functions.Notify("Coordinates copied to clipboard!", "success")
    elseif dataType == 'coords4' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s),', x, y, z, h)
        })
        QBCore.Functions.Notify("Coordinates copied to clipboard!", "success")
    elseif dataType == 'heading' then
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = h
        })
        QBCore.Functions.Notify("Heading copied to clipboard!", "success")
    end
end

RegisterNetEvent('MojiaClipboard:client:copycoords2', function()
    CopyToClipboard('coords2')
end)

RegisterNetEvent('MojiaClipboard:client:copycoords3', function()
    CopyToClipboard('coords3')
end)

RegisterNetEvent('MojiaClipboard:client:copycoords4', function()
    CopyToClipboard('coords4')
end)

RegisterNetEvent('MojiaClipboard:client:copyheading', function()
    CopyToClipboard('heading')
end)

RegisterNetEvent('MojiaClipboard:client:copyvehcoord', function()
    local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then
		local veh = GetVehiclePedIsIn(ped)
		local vehpos = GetEntityCoords(veh)
        local x = round(vehpos.x, 2)
        local y = round(vehpos.y, 2)
        local z = round(vehpos.z, 2)
        local heading = GetEntityHeading(veh)
        local h = round(heading, 2)
		SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s),', x, y, z, h)
        })
        QBCore.Functions.Notify("Vehicle coordinates copied to clipboard!", "success")
	end
end)