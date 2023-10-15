--[V1.0] INNS Accounts

Account = {username="", password="", guid="", securityLevel=0}
function Account:New(username, password, securityLevel)
    self = {}

    self.username = username
    self.password = password
    self.securityLevel = securityLevel

    self.guid = math.random(10000000, 99999999)

    if not fs.exists("INNSAccounts/") then fs.makeDir("INNSAccounts/") end
    local path = "INNSAccounts/"..username..".user"

    local file = fs.open(path, "w")
    file.writeLine(username)
    file.writeLine(password)
    file.writeLine(securityLevel)
    file.writeLine(self.guid)
    file.close()

    return self
end

function Account:Delete()
    path = "INNSAccounts/"..self.username..".user"
    if fs.exists(path) then
        fs.delete(path)
    end
end

function ParseFile(path)
    local file = fs.open(path, "r")
    local account = Account
    account.username = file.readLine()
    account.password = file.readLine()
    account.securityLevel = file.readLine()
    account.guid = file.readLine()
    file.close()
    return account
end

function GetAccount(username)
    local path = "INNSAccounts/"..username..".user"
    if not fs.exists(path) then return nil end
    local account = ParseFile(path)
    return account 
end

function GetAccountFromGUID(guid)
    local accounts = GetAccountList()
    if accounts ~= nil then
        for i=1, #accounts  do
            local account = ParseFile("INNSAccounts/"..accounts[i])
            if account ~= nil and account.guid == guid then
                return account
            end
        end
    end
end

function GetAccountList()
    if not fs.exists("INNSAccounts/") then return nil end
    return fs.list("INNSAccounts/")
end