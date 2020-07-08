--------------------------
-- Chat de Ayuda InGame --
--     por Jougito      --
--------------------------

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/' .. Config.Command,  'Manda un mensaje en el chat de ayuda', { { name = 'Mensaje', help = 'Mensaje que quieres enviar al chat de ayuda' } })
end)
