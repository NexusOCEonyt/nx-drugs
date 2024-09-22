QBCore = exports['qb-core']:GetCoreObject()
Player = QBCore.Functions.GetPlayer(src)

--██╗     ███████╗██████╗ 
--██║     ██╔════╝██╔══██╗
--██║     ███████╗██║  ██║
--██║     ╚════██║██║  ██║
--███████╗███████║██████╔╝
--╚══════╝╚══════╝╚═════╝ 

RegisterNetEvent('nexusdrugs:addRawxtc')
AddEventHandler('nexusdrugs:addRawxtc', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem('raw_xtc', amount)
    end
end)

RegisterNetEvent('nexusdrugs:addProcessedxtc')
AddEventHandler('nexusdrugs:addProcessedxtc', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)  -- Correctly getting the Player object
    if Player.Functions.GetItemByName('raw_xtc') then
        Player.Functions.RemoveItem('raw_xtc', 1)
        Player.Functions.RemoveItem('scissors', 1)
        Player.Functions.AddItem('processed_xtc', 1)
    else
        TriggerClientEvent('QBCore:Notify', src, "You need Raw XTC!", "error")
    end
end)

RegisterNetEvent('nexusdrugs:xtcBAGGING')
AddEventHandler('nexusdrugs:xtcBAGGING', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player.Functions.GetItemByName('plastic_bag') then
        player.Functions.RemoveItem('plastic_bag', 1)
        player.Functions.RemoveItem('processed_xtc', 1)
        player.Functions.AddItem('bagged_xtc', 1)
    else
        TriggerClientEvent('QBCore:Notify', src, "You need Bags!", "error")
    end
end)
