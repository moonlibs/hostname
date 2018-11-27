local hostname = require 'hostname'

-- Simple get hostname

print("My hostname is", hostname())

-- Module interface

print("My hostname is", hostname.get())
print("My host is", hostname.host())

-- Set hostname into name
local name = "newhost"
--hostname.set(name)
-- If something went wrong, error will be raised
