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
        if(Rank == 'helper')then -- Soporte
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.Support .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Support })
        elseif(Rank == 'mod')then -- Moderador
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.SupportPlus .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.SupportPlus })
        elseif(Rank == 'admin')then -- Administrador
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.Moderator .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Moderator })
        elseif(Rank == 'superadmin')then -- Fundador
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.Administrator .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.Administrator })
        else -- Usuario
            TriggerClientEvent('chat:addMessage', -1, { args = { "[".. Label.User .."] ".. uName .." (".. uID ..")", "^7".. args .."" }, color = Color.User })
        end
    end
    
end, false)

-- Funciones

function GetRank(source)
    local result = MySQL.Sync.fetchAll('SELECT `group` FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifiers(source)[1]
    })

    if result[1] and result[1].group then    
        return result[1].group
    else
        return 'user'
    end
end

-- Version Checking - DON'T TOUCH THIS

local CurrentVersion = '1.0.0'
local GithubResourceName = 'Support-Chat'

PerformHttpRequest('https://raw.githubusercontent.com/Jougito/FiveM_Resources/master/' .. GithubResourceName .. '/VERSION', function(Error, NewestVersion, Header)
    PerformHttpRequest('https://raw.githubusercontent.com/Jougito/FiveM_Resources/master/' .. GithubResourceName .. '/CHANGELOG', function(Error, Changes, Header)
        print('\n')
        print('[Support Chat] Checking for updates...')
        print('')
        print('[Support Chat] Current version: ' .. CurrentVersion)
        print('[Support Chat] Updater version: ' .. NewestVersion)
        print('')
        if CurrentVersion ~= NewestVersion then
            print('[Support Chat] Your script is outdated!')
            print('')
            print('[Support Chat] CHANGELOG ' .. NewestVersion .. ':')
            print('')
            print(Changes)
            print('')
            print('[Support Chat] You are not running the newest stable version of Staff Chat. Please update: https://github.com/Jougito/Support-Chat')
        else
            print('[Support Chat] Your script is up-to-update')
        end
        print('\n')
    end)
end)
