--[V1.0] INNS Account Deleter

require("/Accounts")

print("INNS Account Deleter V1.0 - InnoCorp Software")
local accounts = GetAccountList()
if accounts == nil then print("No accounts found") return end
for i=1, #accounts do
    print("["..i.."] "..accounts[i])
end

term.write("Enter the account to delete : ")
local toDelete = read()
local account = GetAccount(toDelete)
if account == nil then print("\nAccount doesnt exist") return end

print("\nAre you sure you want to delete account "..account.username.."? (Y/N)\n")
while true do
    local event, key = os.pullEvent("key_up")
    if key == keys.y then break
    elseif key == keys.n then return
    end
end

account:Delete()
print("\nAccount deleted")