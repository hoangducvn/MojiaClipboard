local QBCore = exports['MojiaCity']:GetCoreObject()

local function CopyToClipboard(dataType)
    local ped = PlayerPedId()
    if dataType == 'coords2' then
        local coords = GetEntityCoords(ped)
        local x = QBCore.Shared.Round(coords.x, 2)
        local y = QBCore.Shared.Round(coords.y, 2)
        SendNUIMessage({
            string = string.format('vector2(%s, %s),', x, y)
        })
        QBCore.Functions.Notify("Coordinates copied to clipboard!", "success")
    elseif dataType == 'coords3' then
        local coords = GetEntityCoords(ped)
        local x = QBCore.Shared.Round(coords.x, 2)
        local y = QBCore.Shared.Round(coords.y, 2)
        local z = QBCore.Shared.Round(coords.z, 2)
        SendNUIMessage({
            string = string.format('vector3(%s, %s, %s),', x, y, z)
        })
        QBCore.Functions.Notify("Coordinates copied to clipboard!", "success")
    elseif dataType == 'coords4' then
        local coords = GetEntityCoords(ped)
        local x = QBCore.Shared.Round(coords.x, 2)
        local y = QBCore.Shared.Round(coords.y, 2)
        local z = QBCore.Shared.Round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = QBCore.Shared.Round(heading, 2)
        SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s),', x, y, z, h)
        })
        QBCore.Functions.Notify("Coordinates copied to clipboard!", "success")
    elseif dataType == 'heading' then
        local heading = GetEntityHeading(ped)
        local h = QBCore.Shared.Round(heading, 2)
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
        local x = QBCore.Shared.Round(vehpos.x, 2)
        local y = QBCore.Shared.Round(vehpos.y, 2)
        local z = QBCore.Shared.Round(vehpos.z, 2)
        local heading = GetEntityHeading(veh)
        local h = QBCore.Shared.Round(heading, 2)
		SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s),', x, y, z, h)
        })
        QBCore.Functions.Notify("Vehicle coordinates copied to clipboard!", "success")
	end
end)
