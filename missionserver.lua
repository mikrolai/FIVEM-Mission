AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  print('Erstelle Marker')  
  for i = 1, #CFG.Missionen, 1 do
	DrawMarker(31, CFG.Missionen[i].startpoint.x, CFG.Missionen[i].startpoint.y, CFG.Missionen[i].startpoint.z + 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 0, 255, 50, true, true, 2, nil, nil, false)
  end
  print('Alle Marker erstellt')  
end)

RegisterServerEvent('first_point:Blip')
AddEventHandler('first_point:Blip', function()
    TriggerClientEvent('first_point:Blip')
end)