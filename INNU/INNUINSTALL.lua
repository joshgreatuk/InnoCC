--[V1.0] INNUINSTALL - An installer for INNU

term.clear();
term.setTextColour(colors.white)
term.setCursorPos(0,0)

print("Installing INNU. . .\n")
Install()
print("\nINNU installed <3")

function Install()
    fileURLs = { 
        "" }

    for i=0, fileURLs.len() do
        if !fs.isDir("INNU") then fs.makeDir("INNU") end
        
        for url in fileURLs do
            shell.run("wget", url, "INNU/")
        end
    end
end