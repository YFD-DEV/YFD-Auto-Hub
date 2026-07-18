-- Stable public loader. The protected payload performs Panda authentication.
local url = "https://raw.githubusercontent.com/YFD-DEV/YFD-Auto-Hub/main/YFD_AutoHub.obf.lua?v=" .. tostring(os.time())

local ok, result = pcall(function()
    local source = game:HttpGet(url)
    local compiler = loadstring or load
    local program, compile_error = compiler(source)
    if not program then
        error(compile_error)
    end
    return program()
end)

if not ok then
    warn("[YFD Auto Hub] remote load failed:", result)
end

return result
