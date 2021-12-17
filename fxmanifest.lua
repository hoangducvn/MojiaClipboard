fx_version 'cerulean'
game 'gta5'

description 'Copy'
version '1.0.0'

ui_page 'html/index.html'


client_scripts {
    'client.lua',
}

files { -- Credits to https://github.com/LVRP-BEN/bl_coords for clipboard copy method
    'html/index.html',
    'html/index.js'
}

lua54 'yes'