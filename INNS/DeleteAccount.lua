--[V1.0] INNS Account Deleter

require("/Accounts")

print("INNS Account Deleter V1.0")
local accounts = GetAccountList()
if #accounts == 0 then print("No accounts found") return end
for i=1, #accounts do
    print("["..i.."] "..accounts[i])
end

print("Enter the account to delete : ")
local toDelete = read()
local account = GetAccount(toDelete)
if account == nil then print("Account doesnt exist") return end

print("Are you sure you want to delete account "..account.username.."? (Y/N)\n")
while true do
    local event, key = os.pullEvent("key_up")
    if key == keys.y then break
    elseif key == keys.n then return
    end
end

account:Delete()
print("\nAccount deleted")