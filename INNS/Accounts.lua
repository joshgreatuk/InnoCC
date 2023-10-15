--[V1.0] INNS Accounts

Account = {username="", password="", guid="", securityLevel=0}
function Account:New(username, password, securityLevel)
    self = {}

    self.username = username
    self.password = password
    self.securityLevel = securityLevel

    self.guid = math.random(10000000, 99999999)

    if ~fs.exists("INNSAccounts/") then fs.makeDir("INNSAccounts/") end
    path = "INNSAccounts/"..username..".user"

    file = fs.open(path, "w")
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
    file = path.open(path, "r")
    account = Account
    account.username = file.readLine()
    account.password = file.readLine()
    account.securityLevel = file.readLine()
    account.guid = file.readLine()
    file.close()

    return account
end

function GetAccount(username, password)
    path = "INNSAccounts/"..username..".user"
    if ~fs.exists(path) then return nil end
    account = ParseFile(path)
    if account.password == password then return account end
end