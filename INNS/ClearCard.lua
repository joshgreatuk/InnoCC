--[V1.0] INNS Card Clearer

print("INNS Card Clearer V1.0 - InnoCorp Software")
local drive = peripheral.find("drive")
if drive == nil then print("Drive not found") return end
if not drive.isDiskPresent() then 
    print("Awaiting card")
    while true do 
        event, side = os.pullEvent("disk")
        if drive.hasData() then break end
    end
end

print("Clearing card. . .")

local path = "/"..drive.getMountPath().."/INNS.guid"
if fs.exists(path) then
    fs.delete(path)
end

path = "/"..drive.getMountPath().."/INNSAccounts/"
if fs.exists(path) then fs.delete(path) end

drive.setDisklabel()

print("Card cleared")