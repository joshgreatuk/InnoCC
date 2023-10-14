--[V1.0] INNUBEEP - Beep codes

Beeper = { speaker=nil }

function Beeper:New()
    self.speaker = peripheral.find("speaker")
end

function Beeper:Beep(pitch)
    if self.speaker == nil then return end
    self.speaker.playNote("pling", 1.0, pitch)
end

function Beeper:BeepCode(pattern, pitch)
    require("/INNU/INNUExtension")
    patternChars = string:GetChars(pattern)
    for i=0, #patternChars do
        for j=0, patternChars[i] do
            self:Beep(pitch)
            sleep(0.25)
        end
        sleep(0.5)
    end
end