--[V1.0] TINNOQ - Turtle quarry program

Miner = { targetLength=0, targetWidth=0, targetDepth=0, currentLength=1, currentWidth=1, currentDepth=1, reverse=false }

function SendHelp()
    print("TINNOQ V1.0 - InnoCorp Software - Help")
    print("Usage: TINNOQ <length(forward)> <width(right, negative to go left)> <depth>")
end

function Miner:MinerLoop()
    turtle.digDown()
    turtle.down()
    print("Depth: "..self.currentDepth.."/"..self.targetDepth)

    if (self.targetWidth < 0) then self.reverse = true end

    while true do
        if (turtle.getFuelLevel() < 1) then
            self:Refuel()
        end

        if (self.currentDepth == self.targetDepth and self.currentLength == self.targetLength and self.currentWidth == self.targetWidth) then
            beeper:BeepCode("11")
            break
        end

        if (self.currentLength == self.targetLength) then
            if (self.currentWidth == self.targetWidth) then
                --Go down
                turtle.digDown()
                turtle.down()

                self:Turn()
                self:Turn()

                self.currentWidth = 1
                self.currentDepth = self.currentDepth + 1
                print("Depth: "..self.currentDepth.."/"..self.targetDepth)
            else
                --Go side
                self:Turn()
                turtle.dig()
                turtle.forward()
                self:Turn()
               
                self.currentWidth = self.currentWidth + 1
            end

            self.currentLength = 1
            self.reverse = not self.reverse
        else
            --Go forward
            turtle.dig()
            turtle.forward()

            self.currentLength = self.currentLength + 1
        end
    end
end

function Miner:Turn()
    if (self.reverse) then
        turtle.turnLeft()        
    else
        turtle.turnRight()
    end
end

function Miner:Refuel()
    while (turtle.getFuelLevel() < 1) do
        self:TryRefuel()
        if (turtle.getFuelLevel() > 1) then break end
        beeper:BeepCode("31", 1.0)
        sleep(5)
    end
end

function Miner:TryRefuel()
    for i=1, 16 do 
        turtle.select(i)
        if turtle.getItemDetail(i).name == "minecraft:coal" then
            turtle.Refuel(turtle.getItemCount(i))
        end
    end
end

local args = {...}

if not assert(require("/INNU/Extension")) 
or not assert(require("/INNU/Beep"))
then print("Sorry, INNU must be installed to use this program") return end
if #args < 3 or #args > 3 then SendHelp() return end

if tonumber(args[1]) < 1 then print("Length must be more than 1") return end
if tonumber(args[2]) == 0 then print("Width cant be 0") return end
if tonumber(args[3]) < 1 then print("Depth must be more than 1") return end

print("Starting TINNOQ")

beeper = Beeper:New()

miner = Miner
miner.targetLength = tonumber(args[1])
miner.targetWidth = tonumber(args[2])
miner.targetDepth = tonumber(args[3])

miner:MinerLoop()
print("Done!")

