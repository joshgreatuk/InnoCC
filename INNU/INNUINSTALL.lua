--[V1.0] INNUINSTALL - An installer for INNU

function Install()
    fileURLs = { 
        "https://github.com/joshgreatuk/InnoCC/raw/main/INNU/INNUBEEP.lua" }

    for i=0, fileURLs.len do
        if not fs.isDir("INNU") then fs.makeDir("INNU") end
        
        for existing in fs.list("INNU/") do
            fs.delete(existing)
        end

        for url in fileURLs do
            shell.run("wget", url, "INNU/")
        end
    end
end

term.clear();
term.setCursorPos(0,0)

print("Installing INNU. . .\n")
Install()
print("\nINNU installed <3")