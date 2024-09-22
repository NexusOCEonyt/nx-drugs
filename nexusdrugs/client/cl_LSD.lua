--██╗     ███████╗██████╗ 
--██║     ██╔════╝██╔══██╗
--██║     ███████╗██║  ██║
--██║     ╚════██║██║  ██║
--███████╗███████║██████╔╝
--╚══════╝╚══════╝╚═════╝ 

exports.ox_target:addBoxZone({
    coords = vector3(-2303.59, 206.43, 167.86),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'LSD',
            event = 'nexusdrugs:lsdpick',
            icon = 'fa-solid fa-leaf',
            label = 'Pick Raw LSD',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:lsdpick', function()
    TriggerEvent('nexusdrugs:lsdProgress')
end)

exports.ox_target:addBoxZone({
    coords = vector3(758.58, -526.97, 27.39),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'LSDProcess',
            event = 'nexusdrugs:LSDProcess',
            icon = 'fa-solid fa-scissors',
            label = 'Process Raw LSD',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:LSDProcess', function()
    TriggerEvent('nexusdrugs:processLSD')
end)

exports.ox_target:addBoxZone({
    coords = vector3(1305.63, 313.19, 85.99),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'LSDbag',
            event = 'nexusdrugs:lsdbag',
            icon = 'fa-solid fa-bag-shopping',
            label = 'Bag LSD',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:lsdbag', function()
    TriggerEvent('nexusdrugs:BagLSD')
end)

RegisterNetEvent('nexusdrugs:lsdProcess')
AddEventHandler('nexusdrugs:lsdProgress', function()
    exports['progressbar']:Progress({
        name = 'picking_lsd',
        duration = 5000, 
        label = 'Picking Raw LSD...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = 'mini@repair',
            anim = 'fixing_a_player',
        },
    }, function(cancelled)
        if not cancelled then
            TriggerServerEvent('nexusdrugs:addRawLSD', 1)
        end
    end)
end)

RegisterNetEvent('nexusdrugs:processLSD')
AddEventHandler('nexusdrugs:processLSD', function()
    exports['progressbar']:Progress({
        name = 'process_lsd',
        duration = 5000, 
        label = 'Processing Raw LSD...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = 'mini@repair',
            anim = 'fixing_a_player',
        },
    }, function(cancelled)
        if not cancelled then
            TriggerServerEvent('nexusdrugs:addProcessedLSD')
        end
    end)
end)

RegisterNetEvent('nexusdrugs:BagLSD')
AddEventHandler('nexusdrugs:BagLSD', function()
    exports['progressbar']:Progress({
        name = 'bag_lsd',
        duration = 5000, 
        label = 'Bagging LSD Tabs...',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = 'mini@repair',
            anim = 'fixing_a_player',
        },
    }, function(cancelled)
        if not cancelled then
            TriggerServerEvent('nexusdrugs:LSDBAGGING')
        end
    end)
end)

--process ped
local pedModel = 'mp_m_weed_01'
local spawnCoords = vector3(758.58, -526.97, 26.39)

local function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(500)
    end
end

loadModel(pedModel)

local ped = CreatePed(4, pedModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, false, true)

if DoesEntityExist(ped) then

    SetEntityInvincible(ped, true)

    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, false)
    SetPedCombatAttributes(ped, 17, true) 
    SetPedCanRagdoll(ped, false)        

    FreezeEntityPosition(ped, true)

    exports.ox_target:addEntity({
        type = 'ped',
        entity = ped,
        coords = spawnCoords,
    })

    print("Ped spawned, made invincible, and added to ox_target successfully.")
else
    print("Failed to create ped.")
end

--bagging ped
local pedModel = 'mp_m_weed_01'
local spawnCoords = vector4(1305.63, 313.19, 84.99, 241.04)

local function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(500)
    end
end

loadModel(pedModel)

local ped = CreatePed(4, pedModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, false, true)

if DoesEntityExist(ped) then

    SetEntityInvincible(ped, true)

    TaskSetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, false)
    SetPedCombatAttributes(ped, 17, true) 
    SetPedCanRagdoll(ped, false)        

    FreezeEntityPosition(ped, true)

    exports.ox_target:addEntity({
        type = 'ped',
        entity = ped,
        coords = spawnCoords,
    })

    print("Ped spawned, made invincible, and added to ox_target successfully.")
else
    print("Failed to create ped.")
end


--██╗  ██╗████████╗ ██████╗
--╚██╗██╔╝╚══██╔══╝██╔════╝
-- ╚███╔╝    ██║   ██║     
-- ██╔██╗    ██║   ██║     
--██╔╝ ██╗   ██║   ╚██████╗
--╚═╝  ╚═╝   ╚═╝    ╚═════╝

