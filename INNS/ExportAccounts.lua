--[V1.0] INNS Account Exporter

require("/Accounts")
print("INNS Account Exporter V1.0 - InnoCorp Software")
if not fs.exists("INNSAccounts/") then print("No accounts to export") return end
local accounts = GetAccountList()
if accounts == nil then print("No accounts to export") return end


local drive = peripheral.find("drive")
if drive == nil then print("Cant find drive") return end

if not drive.isDiskPresent() then
    print("Awaiting card")
    while true do 
        local event, side = os.pullEvent("disk")
        if drive.hasData() then break end
    end
end 

print("\nExporting accounts")

local path = "/"..drive.getMountPath().."/INNSAccounts/"
if fs.exists(path) then fs.delete(path) end
fs.makeDir(path)

for i=1, #accounts do
    fs.move("/INNSAccounts/"..accounts[i], path..accounts[i])
end

print("Exported "..#accounts.." accounts")