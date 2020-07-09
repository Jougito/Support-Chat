--------------------------
-- Chat de Ayuda InGame --
--     por Jougito      --
--------------------------

RegisterCommand(Config.Command, function(source, args, rawCommand)

    args = table.concat(args, ' ')
    
    local Rank = GetRank(source)
    local uID = source
    local uName = GetPlayerName(uID)
    
    if args ~= "" then
        if(Rank == 1)then -- Soporte
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.Support .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Support })
        elseif(Rank == 2)then -- Soporte +
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.SupportPlus .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.SupportPlus })
        elseif(Rank == 3)then -- Moderador+
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.Moderator .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Moderator })
        elseif(Rank == 4)then -- Administrador
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.Administrator .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Administrator })
        else -- Usuario normal
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.User .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.User })
        end
    end
    
end, false)

-- Funciones

function GetRank(source)
    local result = MySQL.Sync.fetchAll('SELECT rank FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifiers(source)[1]
    })

    if result[1] and result[1].rank then    
        return result[1].rank
    else
        return 0    
    end
end

-- Version Checking - DON'T TOUCH THIS

local CurrentVersion = '1.0.1'
local GithubResourceName = 'Support-Chat'

PerformHttpRequest('https://raw.githubusercontent.com/Jougito/FiveM_Resources/master/' .. GithubResourceName .. '/VERSION', function(Error, NewestVersion, Header)
    PerformHttpRequest('https://raw.githubusercontent.com/Jougito/FiveM_Resources/master/' .. GithubResourceName .. '/CHANGELOG', function(Error, Changes, Header)
        print('^0')
        print('^6[Support Chat]^0 Checking for updates...')
        print('^0')
        print('^6[Support Chat]^0 Current version: ^5' .. CurrentVersion .. '^0')
        print('^6[Support Chat]^0 Updater version: ^5' .. NewestVersion .. '^0')
        print('^0')
        if CurrentVersion ~= NewestVersion then
            print('^6[Support Chat]^0 Your script is ^8outdated^0!')
            print('^0')
            print('^6[Support Chat] ^3CHANGELOG ^5' .. NewestVersion .. ':^0')
            print('^3')
            print(Changes)
            print('^0')
            print('^6[Support Chat]^0 You ^8are not^0 running the newest stable version of ^5Support Chat^0. Please update: https://github.com/Jougito/Support-Chat')
        else
            print('^6[Support Chat]^0 Your script is ^2up-to-update^0')
        end
        print('^0')
    end)
end)
