-- ██████╗ ██████╗ ██╗██╗   ██╗███╗   ███╗
--██╔═══██╗██╔══██╗██║██║   ██║████╗ ████║
--██║   ██║██████╔╝██║██║   ██║██╔████╔██║
--██║   ██║██╔═══╝ ██║██║   ██║██║╚██╔╝██║
--╚██████╔╝██║     ██║╚██████╔╝██║ ╚═╝ ██║
-- ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝

exports.ox_target:addBoxZone({
    coords = vector3(2074.88, 974.56, 214.35),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'opium',
            event = 'nexusdrugs:opiumpick',
            icon = 'fa-solid fa-leaf',
            label = 'Pick Raw opium',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:opiumpick', function()
    TriggerEvent('nexusdrugs:opiumProgress')
end)

exports.ox_target:addBoxZone({
    coords = vector3(1659.83, 29.93, 168.61),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'opiumProcess',
            event = 'nexusdrugs:opiumProcess',
            icon = 'fa-solid fa-scissors',
            label = 'Process Raw opium',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:opiumProcess', function()
    TriggerEvent('nexusdrugs:processopium')
end)

exports.ox_target:addBoxZone({
    coords = vector3(1656.44, 4.67, 166.12),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'opiumbag',
            event = 'nexusdrugs:opiumbag',
            icon = 'fa-solid fa-bag-shopping',
            label = 'Bag opium',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:opiumbag', function()
    TriggerEvent('nexusdrugs:Bagopium')
end)

RegisterNetEvent('nexusdrugs:opiumProcess')
AddEventHandler('nexusdrugs:opiumProgress', function()
    exports['progressbar']:Progress({
        name = 'picking_opium',
        duration = 5000, 
        label = 'Picking Raw opium...',
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
            TriggerServerEvent('nexusdrugs:addRawopium', 1)
        end
    end)
end)

RegisterNetEvent('nexusdrugs:processopium')
AddEventHandler('nexusdrugs:processopium', function()
    exports['progressbar']:Progress({
        name = 'process_opium',
        duration = 5000, 
        label = 'Processing Raw opium...',
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
            TriggerServerEvent('nexusdrugs:addProcessedopium')
        end
    end)
end)

RegisterNetEvent('nexusdrugs:Bagopium')
AddEventHandler('nexusdrugs:Bagopium', function()
    exports['progressbar']:Progress({
        name = 'bag_opium',
        duration = 5000, 
        label = 'Bagging Opium...',
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
            TriggerServerEvent('nexusdrugs:opiumBAGGING')
        end
    end)
end)

--process ped
local pedModel = 'mp_m_weed_01'
local spawnCoords = vector4(1659.83, 29.93, 167.61, 180.24)

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
local spawnCoords = vector4(1656.44, 4.67, 165.12, 252.98)

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

