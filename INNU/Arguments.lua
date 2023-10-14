--[V1.0] INNUArguments - Library for terminal arguments

Argument = { flag="", value="" }

function Argument:ParseArguments(toParse)
    require("/INNU/Extension")
    args = {}
    local currentArg = Argument
    for i=1, #toParseSplit do
        if currentArg.flag == "" then
            if toParseSplit[i]:sub(1, 1) ~= "-" then return nil end
            currentArg.flag = toParseSplit[i]
        elseif currentArg.value == "" then
            currentArg.value = toParseSplit[i]
        else
            table.insert(args, currentArg)
            currentArg = Argument
        end
    end
    return args
end

function Argument:GetArg(args, flag)
    for i=1, #args do
        if args[i].flag == flag then
            return args[i]
        end
    end
    return nil
end