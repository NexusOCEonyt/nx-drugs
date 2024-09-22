fx_version 'cerulean'
game 'gta5'

-- Resource Metadata
name 'Nexus Drugs'
description 'A script to manage drug items in QBCore'
author 'NexusOCE on YT'
version '1.0.0'

-- Server Scripts
server_scripts {
    'server/sv_LSD.lua',
    'server/sv_Opium.lua',
    'server/sv_XTC.lua',
}

-- Client Scripts
client_scripts {
    'client/cl_LSD.lua',
    'client/cl_Opium.lua',
    'client/cl_XTC.lua',
}

-- Dependencies
dependencies {
    'qb-core' -- Ensure QBCore is started before this resource
}

-- Ensures that the resource is loaded after QBCore
lua54 'yes'
