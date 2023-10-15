--[V1.0] INNS updater

print("Updating INNU\n")

innuInstallerSource = "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNU/Install.lua"
shell.run("wget", "run, innuInstallerSource")

print("\nINNU Updated")

fileNames = {
    "Accounts.lua",
    "startup.lua",
    "CreateAccount.lua",
    "DeleteAccount.lua",
    "WriteCard.lua",
    "ClearCard.lua",
    "ExportAccounts.lua",
    "ImportAccounts.lua"
}
sources = {
    "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNS/Accounts.lua",
    "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNS/startup.lua",
    "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNS/CreateAccount.lua",
    "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNS/DeleteAccount.lua",
    "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNS/WriteCard.lua",
    "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNS/ClearCard.lua",
    "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNS/ExportAccounts.lua",
    "https://raw.githubusercontent.com/joshgreatuk/InnoCC/main/INNS/ImportAccounts.lua"
}

print("Updating INNS Package\n")

for i=1, #fileNames do
    if fs.exists(fileNames[i]) then fs.delete(fileNames[i]) end

    shell.run("wget", sources[i])
end

print("\nINNS Updated <3")