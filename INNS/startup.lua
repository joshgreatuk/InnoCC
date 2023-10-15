--[V1.0] INNS startup script - InnoCorp Software 2023

local requiredDoorLevel = 1
local requiredAccessLevel = 3

local loginFieldOffset = 10

local loggedIn = false

local redstoneSide = "back"
local doorOpenTime = 5

--Helpers
local function GetPureScreenCentre()
    local x, y = term.getSize()
    return x/2, y/2
end

local function GetScreenCentre(text)
    local x, y = GetPureScreenCentre()
    local x = x - (#text/2)
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
    local cardReader = peripheral.find("drive")
    local speaker = peripheral.find("speaker")
    if cardReader == nil then return end
    while true do
        local event, side = os.pullEvent("disk")
        if (not loggedIn and cardReader.isDiskPresent()) then
            local path = "/"..cardReader.getMountPath().."/INNS.guid"
            if path.exists(path) then
                local file = fs.open(path, "r")
                local guid = file.readLine()
                file.close()

                local account = GetAccountFromGUID(guid)
                if account ~= nil and account.securityLevel >= requiredDoorLevel then
                    --BEEP
                    redstone.setOutput(redstoneSide, true)
                    sleep(doorOpenTime)
                    redstone.setOutput(redstoneSide, false)
                else
                    --BEEP AGGRESSIVELY
                end
            end
            cardReader.ejectDisk()
        end
    end
end

local function OSLoop()
    term.clear()
    term.setCursorPos(1,1)
    if GetAccountList() == nil then
        shell.run("CreateAccount.lua")
    end
    while true do
        loggedIn = false
        term.clear()
        
        local title = "InnoCorp INNS Security Console Login"
        local titleX, titleY = GetScreenCentre(title)
        term.setCursorPos(titleX, titleY-1)
        term.write(title)

        local userField = "\nUsername: "
        local userFieldX, userFieldY = GetScreenCentre(userField)
        term.setCursorPos(userFieldX-loginFieldOffset, userFieldY+1)
        term.write(userField)

        local userEntry = read()

        local passField = "\nPassword: "
        local passFieldX, passFieldY = GetScreenCentre(passField)
        term.setCursorPos(passFieldX-loginFieldOffset, passFieldY+2)
        term.write(passField)

        local passEntry = read("*")
        
        local account = GetAccount(userEntry)
        
        if account == nil or account.password ~= passEntry then
            local error = "\nUsername or password was incorrect"
            local errorX, errorY = GetScreenCentre(error)
            term.setCursorPos(errorX, errorY+4)
            term.write(error)
            WaitForInputOrSecs(3)
        else
            if account.securityLevel < requiredAccessLevel then
                local error = "\nAccount security level isn't high enough"
                local errorX, errorY = GetScreenCentre(error)
                term.setCursorPos(errorX, errorY+4)
                term.write(error)
                WaitForInputOrSecs(3)
            else
                term.clear()
                local success = "\nWelcome "..account.username
                local successX, successY = GetScreenCentre(success)
                term.setCursorPos(successX, successY+4)
                term.write(success)
                WaitForInputOrSecs(3)
                loggedIn = true
                shell.run("shell")
            end
        end
    end
end

local function StopTermination()
    while true do
        local event = os.pullEventRaw("terminate")
        os.shutdown()
    end
end

require("/Accounts")

parallel.waitForAll(CardLoop, OSLoop, StopTermination) 