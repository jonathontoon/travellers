--[[
    utilities
]]--

-- converts anything to string, even nested tables
function to_string(any)
    if (type(any)~="table") return tostr(any)
    local str = "{"
    for k,v in pairs(any) do
        if (str~="{") str=str..","
            str=str..tostring(k).."="..tostring(v)
        end
    return str.."}"
end