QBCore = exports['qb-core']:GetCoreObject()
local open = false

RegisterNetEvent('ms:client:openmap', function()
    if not open then
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0, -1) 
        SetNuiFocus(true, true)
        open = true
        TriggerEvent('animations:client:EmoteCommandStart', {"map2"})
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if open and IsControlPressed(1, 202) then
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            open = false
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 500

        local radarEnabled = IsRadarEnabled()

        if not IsPedInAnyVehicle(PlayerPedId()) and radarEnabled then
            DisplayRadar(false)
        elseif IsPedInAnyVehicle(PlayerPedId()) and not radarEnabled then
            DisplayRadar(false)
        end

        Citizen.Wait(sleepThread)
    end
end)
