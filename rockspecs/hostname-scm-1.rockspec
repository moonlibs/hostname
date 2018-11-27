package = 'hostname'
version = 'scm-1'
source  = {
    url    = 'git://github.com/moonlibs/hostname.git',
    branch = 'master',
}
description = {
    summary  = "get/set hostname from lua",
    homepage = 'https://github.com/moonlibs/hostname.git',
    license  = 'BSD',
}
dependencies = {
    'lua >= 5.1';
    'ffi.reloadable >= 1';
}
build = {
    type = 'builtin',
    modules = {
        ['hostname'] = 'hostname.lua'
    }
}

-- vim: syntax=lua
