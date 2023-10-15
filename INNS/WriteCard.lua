--[V1.0] INNS Card Writer

require("Accounts")

print("INNS Card Writer V1.0 - InnoCorp Software")
local accounts = GetAccountList()
if accounts == nil then print("No accounts found") return end
for i=1, #accounts do
    print("["..i.."] "..accounts[i])
end

print("Enter account: ")
local targetAccount = read()
local account = GetAccount(targetAccount)
if account == nil then print("Account doesnt exist") end

print("Are you sure youd like to write account '"..targetAccount.."'? (Y/N)")
while true do
    local event, key = os.pullEvent("key_up")
    if (key == keys.y) then break
    elseif key == keys.n then return end   
end

local drive = peripheral.find("drive")
if drive == nil then print("Drive not found") return end

if not Drive:isDiskPresent(drive) then 
    print("Awaiting card")
    while true do 
        local event, side = os.pullEvent("disk")
        if Drive:hasData(drive) then break end
    end
end

print("\nWriting account to disk")

local path = Drive:getMountPath(drive).."INNS.guid"
if fs.exists(path) then fs.delete(path) end

local file = fs.open(path, "w")
file.writeLine(account.guid)
file.close()

print("Account written")