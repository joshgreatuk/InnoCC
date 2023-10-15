--[V1.0] INNS Account Importer

require("/Accounts")
print("INNS Account Importer V1.0 - InnoCorp Software")

local drive = peripheral.find("drive")
if drive == nil then print("Cant find drive") return end

if not Drive:isDiskPresent(drive) then
    print("Awaiting card")
    while true do 
        local event, side = os.pullEvent("disk")
        if Drive:hasData(drive) then break end
    end
end 

local path = "/"..Drive:getMountPath(drive).."/"
if not fs.exists(path) then print("No accounts to import") return end

local accounts = fs.list(path)
if accounts == nil then print("No accounts to import") return end

if fs.exists("/INNSAccounts/") then fs.delete("/INNSAccounts/") end
fs.makeDir("/INNSAccounts/")

print("\nImporting accounts")

for i=1, #accounts do
    fs.copy(path..accounts[i], "/INNSAccounts/"..accounts[i])
end

print("Imported "..#accounts.." accounts")