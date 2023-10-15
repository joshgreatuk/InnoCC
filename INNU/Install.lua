--[V1.0] INNUINSTALL - An installer for INNU

function Install()
    fileURLs = {
        "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/Beep.lua",
        "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/Arguments.lua" }
    for i, url in ipairs(fileURLs) do
        fileNameTable = url:Split("/")
        fileName = fileNameTable[#fileNameTable]
        filePath = "/INNU/"..fileName
        shell.run("wget", url, filePath)
    end
end

if fs.exists("/INNU") then fs.delete("/INNU/") end
fs.makeDir("/INNU")

print("Installing INNUExtension. . .\n")

shell.run("wget", "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/Extension.lua", "/INNU/Extension.lua")
require("/INNU/Extension")

print("\nInstalling INNU. . .\n")
Install()
print("\nINNU installed <3")