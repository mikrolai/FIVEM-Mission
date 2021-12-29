CreateThread(function()
while true do
	--jeden Frame anzeigen--
	Wait(0)


--Wir probieren eine Mission mit Startpunkt und Zielpunkt zu erstellen--
	--##config vom Startpunkt##--

	--Koordinaten vom Spieler--
	local position = GetEntityCoords(PlayerPedId())

	--Koordinaten vom Marker / der Startlinie--
	local startpoint = { x = 2492.934, y = 5108.829, z = 45.16, heading = 320.0 }

	--Marker erstellen--
	DrawMarker(31, startpoint.x, startpoint.y, startpoint.z + 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 0, 255, 50, true, true, 2, nil, nil, false)

	--Überprüfen wie weit der Spieler vom Marker entfernt ist--
	local dist = GetDistanceBetweenCoords(startpoint.x, startpoint.y, startpoint.z, position.x, position.y, position.z, true)


	--Überprüfe ob die Entfernung unter 3 Meter ist--
	if dist < 3 then


	--falls ja zeige Text an--
	helpMessage("~INPUT_CONTEXT~ drücken um die Mission zu starten!")

	--Überprüfe ob "E" gedrückt wurde--
	if (IsControlJustReleased(1, 51)) then





--#################--
--STARTPUNKT FERTIG--
--#################--

-- Zeige Benachrichtigung(image, title, subtitle, message)
SetNotificationBackgroundColor (6)
ShowAdvNotification("CHAR_LESTER_DEATHWISH", "Mikrolai-Mission", "~u~Startpunkt erreicht")
			
	--Erstelle ersten Wegpunkt--
	--serverseitig--
    	TriggerServerEvent('first_point:Blip')
	RegisterNetEvent('first_point:Blip')
	first_point = AddBlipForCoord (2359.0, 5338.0, 117.0)

--hier müssen wir "if dist < 3 then" & "if (IsControlJustReleased(1, 51)) then" mit 2x "end" beenden sonst wird die Distanz nicht durchgehend abgerufen--
end
end


			
--wandle Koordinaten vom ersten Punkt in Vector3 um--
        local coord = GetBlipCoords(first_point)
        blipX = coord.x
        blipY = coord.y
        blipZ = coord.z

	local erste = vector3(blipX, blipY, blipZ)

	--Überprüfen wie weit der Spieler vom Marker entfernt ist--
	local first_point_dist = GetDistanceBetweenCoords(erste.x, erste.y, erste.z, position.x, position.y, position.z, true)


print (first_point_dist)

	--Überprüfe ob die Entfernung unter 3 Meter ist--
	if first_point_dist < 3 then

	--falls ja lösche Wegpunkt--
	RemoveBlip(first_point)

RequestModel(-984709238)
				
				local enemy1 = CreatePed(1, -984709238, 2359.0, 5338.0, 117.0, 10.0, true, false)
		


end
end	
end)



--Anzeige der Schrift--
function helpMessage(text, duration)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, duration or 5000)
end

function ShowAdvNotification(image, title, subtitle, text)
	SetNotificationTextEntry("STRING");
	AddTextComponentString(text);
	SetNotificationMessage(image, image, false, 0, title, subtitle);
	DrawNotification(false, true);
end


--Einstellungen für die Blips/Wegpunkte--



				---NICHT AKTIV---
				--local playerPed = GetPlayerPed(-1)
				--local name = nurburg
				--local position = GetEntityCoords(player)
				--local range = 2.0
				--local test = { x = 3720.0, y = -6543.0, z = 2200.0, heading = 320.0 }
				--TriggerServerEvent('StreetRaces:listRaces_sv')
				--SetPedCoordsKeepVehicle(playerPed, test.x, test.y, test.z)
