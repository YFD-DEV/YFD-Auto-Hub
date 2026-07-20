-- Stable local loader for the protected YFD Auto Hub payload.
local candidates = {"YFD_AutoHub.obf.lua", "dist/YFD_AutoHub.obf.lua"}
local payload
local lastError

for _, fileName in ipairs(candidates) do
    local ok, result = pcall(readfile, fileName)
    if ok and type(result) == "string" and #result > 0 then
        payload = result
        break
    end
    lastError = result
end

if not payload then
    error("[YFD Auto Hub] protected payload was not found: " .. tostring(lastError))
end

local compiler = loadstring or load
local program, compileError = compiler(payload)
if not program then
    error("[YFD Auto Hub] protected payload could not compile: " .. tostring(compileError))
end

local ok, result = pcall(program)
if not ok then
    error("[YFD Auto Hub] protected payload failed: " .. tostring(result))
end

return result
