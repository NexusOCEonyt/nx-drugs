QBCore = exports['qb-core']:GetCoreObject()
Player = QBCore.Functions.GetPlayer(src)

--██╗     ███████╗██████╗ 
--██║     ██╔════╝██╔══██╗
--██║     ███████╗██║  ██║
--██║     ╚════██║██║  ██║
--███████╗███████║██████╔╝
--╚══════╝╚══════╝╚═════╝ 

RegisterNetEvent('nexusdrugs:addRawLSD')
AddEventHandler('nexusdrugs:addRawLSD', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem('raw_lsd', amount)
    end
end)

RegisterNetEvent('nexusdrugs:addProcessedLSD')
AddEventHandler('nexusdrugs:addProcessedLSD', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)  -- Correctly getting the Player object
    if Player.Functions.GetItemByName('raw_lsd') then
        Player.Functions.RemoveItem('raw_lsd', 1)
        Player.Functions.RemoveItem('scissors', 1)
        Player.Functions.AddItem('processed_lsd', 1)
    else
        TriggerClientEvent('QBCore:Notify', src, "You need Raw LSD!", "error")
    end
end)

RegisterNetEvent('nexusdrugs:LSDBAGGING')
AddEventHandler('nexusdrugs:LSDBAGGING', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player.Functions.GetItemByName('plastic_bag') then
        player.Functions.RemoveItem('plastic_bag', 1)
        player.Functions.RemoveItem('processed_lsd', 1)
        player.Functions.AddItem('bagged_lsd', 1)
    else
        TriggerClientEvent('QBCore:Notify', src, "You need Bags!", "error")
    end
end)
