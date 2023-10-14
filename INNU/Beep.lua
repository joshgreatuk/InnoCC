--[V1.1] INNUBEEP - Beep codes

Beeper = { speaker=nil }

function Beeper:New()
    self.speaker = peripheral.find("speaker")
    return self
end

function Beeper:Beep(pitch, volume)
    if self.speaker == nil then return end
    if volume == nil then volume = 1.0 end
    self.speaker.playNote("pling", volume, pitch)
end

function Beeper:BeepCode(pattern, pitch)
    require("/INNU/Extension")
    patternChars = pattern:GetChars()
    for i=1, #patternChars do
        for j=1, tonumber(patternChars[i]) do
            self:Beep(pitch)
            sleep(0.2)
        end
        sleep(0.4)
    end
end