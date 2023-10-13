--[V1.0] INNUBEEP - Beep codes

Beeper = { speaker=nil }

function Beeper:New()
    self.speaker = peripheral.find("speaker")
    if self.speaker == nil then return nil end
end

function Beeper:Beep(pitch)
    self.speaker.playNote("pling", 1.0, pitch)
end