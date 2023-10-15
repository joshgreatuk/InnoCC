--[V1.0] INOLPackages - INOL.Core

Package = {  
    name = "",
    version = "",
    author = "",
    sources = {},
    dependencies = {}
}

PackageManagerConfig = {
    rootDir = "/"
}

function PackageManagerConfig:Init(rootDir)
    self.rootDir = rootDir
end

PackageManager = {
    config = PackageManagerConfig,
    packages = {}
}

function PackageManager:Init(config)
    if config == nil then config = PackageManagerConfig end
    self.config = config

    --Load existing packages
    require("/INOL/IO")
    require("/INOL/JSON")

end

function PackageManager:GetPackage(name)
    for i=1, #self.packages do
        if self.packages[i].name == name then return self.packages[i] end
    end
end