QBCore = exports['qb-core']:GetCoreObject()
Player = QBCore.Functions.GetPlayer(src)

-- ██████╗ ██████╗ ██╗██╗   ██╗███╗   ███╗
--██╔═══██╗██╔══██╗██║██║   ██║████╗ ████║
--██║   ██║██████╔╝██║██║   ██║██╔████╔██║
--██║   ██║██╔═══╝ ██║██║   ██║██║╚██╔╝██║
--╚██████╔╝██║     ██║╚██████╔╝██║ ╚═╝ ██║
-- ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝

RegisterNetEvent('nexusdrugs:addRawopium')
AddEventHandler('nexusdrugs:addRawopium', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem('raw_opium', amount)
    end
end)

RegisterNetEvent('nexusdrugs:addProcessedopium')
AddEventHandler('nexusdrugs:addProcessedopium', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)  -- Correctly getting the Player object
    if Player.Functions.GetItemByName('raw_opium') then
        Player.Functions.RemoveItem('raw_opium', 1)
        Player.Functions.RemoveItem('scissors', 1)
        Player.Functions.AddItem('processed_opium', 1)
    else
        TriggerClientEvent('QBCore:Notify', src, "You need Raw Opium!", "error")
    end
end)

RegisterNetEvent('nexusdrugs:opiumBAGGING')
AddEventHandler('nexusdrugs:opiumBAGGING', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player.Functions.GetItemByName('plastic_bag') then
        player.Functions.RemoveItem('plastic_bag', 1)
        player.Functions.RemoveItem('processed_opium', 1)
        player.Functions.AddItem('bagged_opium', 1)
    else
        TriggerClientEvent('QBCore:Notify', src, "You need Bags!", "error")
    end
end)
