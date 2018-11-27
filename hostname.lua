local ffi = require 'ffi.reloadable'

ffi.fundef('gethostname',[[ int gethostname(char *name, size_t len); ]])
ffi.fundef('sethostname',[[ int sethostname(const char *name, size_t len); ]])
ffi.fundef('strerror',   [[ char *strerror(int errnum); ]])

local size = 256
local buf = ffi.new('char[?]',size)

local M = {}

function M.get()
	local ret = ffi.C.gethostname(buf,size)
	if ret == 0 then
		return (string.gsub(ffi.string(buf), "%z+$", ""))
	else
		error("Failed to get hostname: "..ffi.string(ffi.C.strerror(ffi.errno())),2)
	end
end

function M.host()
	local ret = ffi.C.gethostname(buf,size)
	if ret == 0 then
		local hostname = string.gsub(ffi.string(buf), "%z+$", "")
		return (hostname:match("^([^.]+)"))
	else
		error("Failed to get hostname: "..ffi.string(ffi.C.strerror(ffi.errno())),2)
	end
end

function M.set(name)
	if type(name) ~= "string" then
		error("Bad type for name: "..type(name)..". Must be string",2)
	end
	if #name > 255 then
		error("Bad hostname: name too long",2)
	end
	local ret = ffi.C.sethostname(name,#name)
	if ret == 0 then
		return name
	else
		error("Failed to set hostname: "..ffi.string(ffi.C.strerror(ffi.errno())),2)
	end
end

setmetatable(M,{
	__call = M.get
})

return M