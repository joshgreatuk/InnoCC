--[V1.0] INNUDiskUtil - For handling multiple disk instances

DiskUtil = { drives = {} }
function DiskUtil:New()
    self = {}
    self.drives = { peripheral.find("drive") }

    function GetDrives()
        return self.drives
    end

    ---@return table string
    function GetActiveDisks()
        local disks = {}
        for i=1, #self.drives do
            ---@class Drive
            local drive = self.drives[i]
            if drive.isDiskPresent() and drive.hasData() then 
                table.insert(disks, "/"..drive.getMountPath().."/")
            end
        end
        return disks
    end

    ---@return string | integer
    function AwaitAnyDisk()
        while true do
            local event, side = os.pullEvent("disk")
            local disks = GetActiveDisks()
            if #disks > 0 then
                local index = 1
                for i=1, #disks do
                    
                end
                return disks[1]
            end
        end
    end

    return self
end