--[V1.0] ENNODisplayer - To setup displays

function SendHelp()
    print("ENNUDisplayer V1.0 - InnoCorp Software - Help")
    print("Usage: Displayer -t/-tf <text/filepath> [-c <textcolour>] [-b <backgroundcolour>] [-f <fontsize>]")
end

-- flags:
-- -t <text>
-- -tf <textfile>
-- -c <textcolour>
-- -b <backgroundcolour>
-- -f <fontsize>
-- To run we either need flags -t/-tf, others are optional

if not assert(require("/INNU/Arguments")) or not assert(require("/INNU/Extension")) then print("INNU must be installed to use this") return end

local input = {...}
local args = Argument:ParseArguments(input)
if args == nil then SendHelp() return end

local textFlag = Argument:GetArg(args, "-t")
if (textFlag == nil) then
    textFlag = Argument:GetArg(args, "-tf")
end

if (textFlag == nil) then SendHelp() return end

if (textFlag.flag == "-tf") then
    if not fs.exists(textFlag.value) then print("File doesn't exist") return end

    flagfile = fs.open(textFlag.value, "r")
    textFlag.value = flagfile.readAll()
    flagfile:close()
end

local textColour = Argument:GetArg(args, "-c")
if textColour == nil then textColour = "0" end

local backColour = Argument:GetArg(args, "-b")
if backColour == nil then backColour = "f" end

local fontSize = Argument:GetArg(args, "-f")
if fontSize == nil then fontSize = "1" end

--Get monitor
local monitor = peripheral.find("monitor")
if monitor == nil then print("Monitor connection is required") return end

local centrex, centrey = monitor.getSize()
local textLines = textFlag.value:Split("\n")

local lineY = centreY - (#textLines/2)

monitor.setTextColour(colors.FromBlit(textColour))
monitor.setBackgroundColour(colors.FromBlit(backColour))
monitor.setTextScale(fontSize)

for i=1, #textLines do
    local text = textLines[i]
    local x = centrex - (#text/2)
    monitor.setCursorPos(x, lineY)
    monitor.write(text)
    lineY = lineY + 1
end

print("Display written")