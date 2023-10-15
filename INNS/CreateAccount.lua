--[V1.0] INNS Account Creator

require("/Accounts")

print("INNS Account Creator V1.0 - InnoCorp Software")
term.write(" Username: ")
local username = read()
term.write("\nPassword: ")
local password = read("*")
term.write("\nConfirm Password: ")
local confirmation = read("*")
if confirmation ~= password then print("\nPasswords dont match") return end
term.write("\nSecurity Level: ")
local securityLevel = read()
print("\nIs this information correct? (Y/N)")
while true do
    local event, key = os.pullEvent("key_up")
    if (key == keys.y) then
        break
    elseif (key == keys.n) then
        return
    end
end

local account = Account:New(username, password, securityLevel)
print("\nAccount created")