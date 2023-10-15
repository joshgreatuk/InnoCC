--[V1.0] INNS Card Clearer

print("INNS Card Clearer V1.0 - InnoCorp Software")
local drive = peripheral.find("drive")
if drive == nil then print("Drive not found") return end
if not Drive:isDiskPresent(drive) then 
    print("Awaiting card")
    while true do 
        event, side = os.pullEvent("disk")
        if Drive:hasData(drive) then break end
    end
end

print("Clearing card. . .")

local path = "/"..Drive:getMountPath(drive).."/INNS.guid"
if fs.exists(path) then
    fs.delete(path)
end

print("Card cleared")