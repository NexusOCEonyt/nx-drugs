--██╗  ██╗████████╗ ██████╗
--╚██╗██╔╝╚══██╔══╝██╔════╝
-- ╚███╔╝    ██║   ██║     
-- ██╔██╗    ██║   ██║     
--██╔╝ ██╗   ██║   ╚██████╗
--╚═╝  ╚═╝   ╚═╝    ╚═════╝ 

exports.ox_target:addBoxZone({
    coords = vector3(2711.7, 1531.74, 21.62),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'xtc',
            event = 'nexusdrugs:xtcpick',
            icon = 'fa-solid fa-leaf',
            label = 'Pick Raw XTC',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:xtcpick', function()
    TriggerEvent('nexusdrugs:xtcProgress')
end)

exports.ox_target:addBoxZone({
    coords = vector3(517.29, 229.82, 108.31),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'xtcProcess',
            event = 'nexusdrugs:xtcProcess',
            icon = 'fa-solid fa-scissors',
            label = 'Process Raw XTC',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:xtcProcess', function()
    TriggerEvent('nexusdrugs:processxtc')
end)

exports.ox_target:addBoxZone({
    coords = vector3(344.73, 194.73, 132.69),
    size = vec3(2, 2, 2),
    rotation = 0,
    minZ = 26.69,
    maxZ = 30.69,
    debug = drawZones,
    options = {
        {
            name = 'xtcbag',
            event = 'nexusdrugs:xtcbag',
            icon = 'fa-solid fa-bag-shopping',
            label = 'Bag XTC',
            canInteract = function(entity, coords, distance)
                return true
            end
        }
    }
})

RegisterNetEvent('nexusdrugs:xtcbag', function()
    TriggerEvent('nexusdrugs:Bagxtc')
end)

RegisterNetEvent('nexusdrugs:xtcProcess')
AddEventHandler('nexusdrugs:xtcProgress', function()
    exports['progressbar']:Progress({
        name = 'picking_xtc',
        duration = 5000, 
        label = 'Picking Raw XTC...',
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
            TriggerServerEvent('nexusdrugs:addRawxtc', 1)
        end
    end)
end)

RegisterNetEvent('nexusdrugs:processxtc')
AddEventHandler('nexusdrugs:processxtc', function()
    exports['progressbar']:Progress({
        name = 'process_xtc',
        duration = 5000, 
        label = 'Processing Raw XTC...',
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
            TriggerServerEvent('nexusdrugs:addProcessedxtc')
        end
    end)
end)

RegisterNetEvent('nexusdrugs:Bagxtc')
AddEventHandler('nexusdrugs:Bagxtc', function()
    exports['progressbar']:Progress({
        name = 'bag_xtc',
        duration = 5000, 
        label = 'Bagging XTC...',
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
            TriggerServerEvent('nexusdrugs:xtcBAGGING')
        end
    end)
end)

--process ped
local pedModel = 'mp_m_weed_01'
local spawnCoords = vector4(517.29, 229.82, 107.31, 214.77)

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
local spawnCoords = vector4(344.73, 194.73, 131.69, 339.58)

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

