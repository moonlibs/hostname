# Get/set hostname from lua

Simple ffi wrapper over `gethostname(2)` and `sethostname(2)`

```lua
local hostname = require 'hostname'

-- Simple get hostname

print("My hostname is", hostname())
-- my.example.com

-- Module interface

print("My hostname is", hostname.get())
-- my.example.com

print("My short host is", hostname.host())
-- my

-- Set hostname into name
local name = "newhost"
hostname.set(name)
-- If something went wrong, error will be raised
```