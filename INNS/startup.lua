--[V1.0] INNS startup script - InnoCorp Software 2023

requiredDoorLevel = 1
requiredAccessLevel = 3

loginFieldOffset = 10

--Helpers
local function GetScreenCentre()
    x, y = term.getSize() / 2
    return x, y
end

local function GetScreenCentre(text)
    x, y = GetScreenCentre()
    x = x - (#text/2)
    return x, y
end

local function WaitForInputOrSecs(secs)
    os.setAlarm(secs)
    while true do
        local event = os.pullEvent()
        if event == "key" or event == "mouse_click" or event == "alarm" then
            break
        end
    end
end

--Loops
local function CardLoop()
    while true do
        local event, side = os.pullEvent("disk")
    end
end

local function OSLoop()
    term.clear()
    term.setCursorPos(1,1)
    if GetAccountList() == nil then
        shell.run("CreateAccount.lua")
    end
    while true do
        term.clear()
        
        title = "INNS Security Console Login"
        titleX, titleY = GetScreenCentre(title)
        term.setCursorPos(titleX, titleY-1)
        term.write(title)

        userField = "Username: "
        userFieldX, userFieldY = GetScreenCentre(userField)
        term.setCursorPos(userFieldX-loginFieldOffset, userFieldY+1)
        term.write(userField)

        userEntry = read()

        passField = "Password: "
        passFieldX, passFieldY = GetScreenCentre(passField)
        term.setCursorPos(passFieldX-loginFieldOffset, passFieldY+2)
        term.write(passField)

        passEntry = read("*")
        
        account = Account:GetAccount(userEntry)
        
        if account == nil or account.password ~= passEntry then
            error = "Username or password was incorrect"
            errorX, errorY = GetScreenCentre(error)
            term.setCursorPos(errorX, errorY+4)
            term.write(error)
            WaitForInputOrSecs(3)
        else
            if account.securityLevel < requiredAccessLevel then
                error = "Account security level isn't high enough"
                errorX, errorY = GetScreenCentre(error)
                term.setCursorPos(errorX, errorY+4)
                term.write(error)
                WaitForInputOrSecs(3)
            else
                term.clear()
                success = "Welcome "..account.username
                successX, successY = GetScreenCentre(success)
                term.setCursorPos(successX, successY+4)
                term.write(success)
                WaitForInputOrSecs(3)

                shell.run("shell")
            end
        end
    end
end

os.pullEvent = os.pullEventRaw
require("/Accounts")

parallel.waitForAll(CardLoop, OSLoop)