--[V1.0] INNUINSTALL - An installer for INNU

function Install()
    fileURLs = {
        "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/INNUBEEP.lua" }
    for i, url in ipairs(fileURLs) do
        fileName = fileURLs:
        shell.run("wget", url, "INNU/")
    end
end

term.clear();
term.setCursorPos(1,1)

if fs.exists("INNU") then fs.delete("INNU/") end
fs.makeDir("INNU")

print("Installing INNUExtension. . .\n")

shell.run("wget", "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/INNUExtension.lua", "INNU/INNUExtension.lua")
package.loadlib("INNUExtension","INNU/INNUExtension" )
require("INNUExtension")

print("Installing INNU. . .\n")
Install()
print("\nINNU installed <3")