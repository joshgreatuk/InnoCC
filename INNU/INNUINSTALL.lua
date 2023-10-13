--[V1.0] INNUINSTALL - An installer for INNU

function Install()
    fileURLs = {
        "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/INNUBEEP.lua" }
    for i, url in ipairs(fileURLs) do
        fileName = fileURLs:split("/")[-1]
        shell.run("wget", url, "INNU/" + fileName)
    end
end

term.clear();
term.setCursorPos(1,1)

if fs.exists("INNU") then fs.delete("INNU/") end
fs.makeDir("INNU")

print("Installing INNUExtension. . .\n")

shell.run("wget", "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/INNUExtension.lua", "INNU/INNUExtension.lua")
require("INNU/INNUExtension.lua")

print("Installing INNU. . .\n")
Install()
print("\nINNU installed <3")