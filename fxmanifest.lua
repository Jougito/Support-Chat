fx_version 'adamant'

game 'gta5'

author 'Jougito'

description 'Chat de ayuda mediante rangos'

version '1.0.0'

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua'
}
