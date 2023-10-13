--[V1.0] INNUINSTALL - An installer for INNU

function Install()
    fileURLs = { 
        "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/INNUBEEP.lua" }
    if fs.exists("INNU") then fs.delete("INNU/") end
    fs.makeDir("INNU")
    for i, url in ipairs(fileURLs) do
        shell.run("wget", url, "INNU/")
    end
end

term.clear();
term.setCursorPos(1,1)

print("Installing INNU. . .\n")
Install()
print("\nINNU installed <3")