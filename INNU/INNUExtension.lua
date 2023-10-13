--[V1.0] INNUExtension - Generic extensions

function string:Split(splitPattern)
    local outResults = {}
    local theStart = 1
    local theSplitStart, theSplitEnd = string.find(self, splitPattern, theStart)
    
    while (theSplitStart) do
        table.insert(outResults, string.sub(self, theStart, theSplitStart-1))
        theStart = theSplitEnd + 1
        theSplitStart, theSplitEnd = string.find(self, splitPattern, theStart)
    end

    table.insert(outResults, string.sub(self, theStart))
    return outResults;
end