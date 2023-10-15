--[V1.0] INNS Account Creator

require("/Accounts")

print("INNS Account Creator V1.0 - InnoCorp Software")
print("Username: ")
username = read()
print("Password: ")
password = read("*")
print("Confirm Password")
confirmation = read("*")
if confirmation ~= password then print("Passwords dont match") return end
print("Security Level: ")
securityLevel = read()
print("Is this information correct? (Y/N) :")
while true do
    event, key = os.pullEvent("key_up")
    if (key == keys.y) then
        break
    elseif (key == keys.n) then
        return
    end
end

account = Account:New(username, password, securityLevel)
print("\nAccount created")