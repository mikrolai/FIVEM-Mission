RegisterServerEvent('first_point:Blip')
AddEventHandler('first_point:Blip', function()
    TriggerClientEvent('first_point:Blip')
end)