fx_version 'cerulean'

game 'gta5'

author 'Erko - https://github.com/Erkoq'
description 'Erko - https://github.com/Erkoq'

version '1.0.0'
lua54 'yes'

client_scripts {
    'client/*.lua',
	'config.lua'
}

server_scripts {
    'server/*.lua',
	'config.lua'
}
escrow_ignore {
  "config.lua",
}

shared_script'@ox_lib/init.lua'