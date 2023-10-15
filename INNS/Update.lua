--[V1.0] INNS updater

fileNames = {

}
sources = {
    
}

print("Updating INNS Package\n")

for i=1, #fileNames do
    if fs.exists(fileNames[i]) then fs.delete(fileNames[i]) end

    shell.run("wget", sources[i])
end

print("\nINNS Updated <3")