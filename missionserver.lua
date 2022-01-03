AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end

  print('MIKRO Missions started.')  
  
end)

RegisterServerEvent('missionen:start')
AddEventHandler('missionen:start', function(missionsnummer)
	print('Mission ' .. missionsnummer .. ' (' .. CFG.Missionen[i].name .. ') gestartet!')
end)