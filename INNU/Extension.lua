--[V1.1] INNUExtension - Generic extensions

function string:Split(splitPattern)
    local outResults = {}
    local theStart = 1
    local theSplitStart, theSplitEnd = self:find(splitPattern, theStart)
    
    while (theSplitStart) do
        table.insert(outResults, string.sub(self, theStart, theSplitStart-1))
        theStart = theSplitEnd + 1
        theSplitStart, theSplitEnd = self:find(splitPattern, theStart)
    end

    table.insert(outResults, string.sub(self, theStart))
    return outResults;
end

function string:GetChars()
    local result = {}
    for i=0, #self do 
        table.insert(result, self:sub(i, i))
    end
    return result
end