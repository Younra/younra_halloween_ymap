---@diagnostic disable: undefined-global
fx_version "adamant"
game "rdr3"
this_is_a_map "yes"
lua54 "yes"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
name "younra_halloween"
author "Younra"
discord "https://discord.gg/xaB8fqkCTV"
files {
    'stream/[props]/doll.ytyp',
    'stream/[props]/ouija.ytyp',
    'stream/[props]/pumpkin.ytyp',
    'stream/[props]/pumpkin2.ytyp',
    'stream/[props]/pumpkin3.ytyp',
    'stream/[props]/pumpkin4.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'stream/[props]/doll.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/[props]/ouija.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/[props]/pumpkin.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/[props]/pumpkin2.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/[props]/pumpkin3.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/[props]/pumpkin4.ytyp'

client_script "client.lua" -- load and unloaded ymap no touch
escrow_ignore {
    "**/*.ymap",
    "**/*.ydr",
    "**/*.ytd",
    "**/*.ytyp"
}  
