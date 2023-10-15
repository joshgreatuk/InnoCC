--[V1.0] INOLIO - INOL.Core

PathMeta = {
    type="Path", --Path/File
    owner="", --The owner account
    ownerPerms="RW", --RWX
    groupPerms="R",
    userPerms="R"
}

IO = { metaData = {} }
IO.New = function()
    local self = {}

    if not require("INNU/Extension") then return nil end

    --Local
    local function LoadMetaData()

    end

    local function SaveMetaData()

    end

    local function ParsePermModification(perms) --string
        --Split into +/- and letters, then split letters into their own list
        local operation = perms:sub(1,1)

        local permsString = perms:sub(2,-1)
        local permsTable = perms:GetChars()
        
        return operation, permsTable
    end

    local function ModifyPerms(path, operation, newPerms)
        local permsOperation, permsTable = ParsePermModification(newPerms)
        local newPerms = nil
        if (permsOperation == nil) then newperms = permsTable:concat() end



        if operation == "O" then
           if newPerms ~= nil then 
           end
        elseif operation == "G" then

        elseif operation == "U" then

        end
    end

    local function ChangeOwner(path, newOwner)

    end

    local function MovePath(path, newPath)

    end

    local function DeletePath(path)

    end

    local function CreatePath(type, path, owner)

    end

    local function GetPathOwner()

    end

    --Global
    function IO:GetMetaData(path)
        for i=1, #self.metaData do
            metaData = self.metaData[i]
            if (metaData.path == path) then return metaData end
        end
        
    end

    function IO:GetPathOwner(path)

    end

    return self
end