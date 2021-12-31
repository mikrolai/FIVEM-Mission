CreateThread(function()
	while true do		
		Wait(0)																																						--jeden Frame anzeigen
																																									--Wir probieren eine Mission mit Startpunkt und Zielpunkt zu erstellen--
																																									--##config vom Startpunkt##
																																									--Koordinaten vom Spieler
		local position = GetEntityCoords(PlayerPedId())																					
		DrawMarker(31, CFG.startpoint.x, CFG.startpoint.y, CFG.startpoint.z + 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 0, 255, 50, true, true, 2, nil, nil, false)	--Marker erstellen		
		local dist = GetDistanceBetweenCoords(CFG.startpoint.x, CFG.startpoint.y, CFG.startpoint.z, position.x, position.y, position.z, true)									--Überprüfen wie weit der Spieler vom Marker entfernt ist		
		if dist < 3 then																																			--Überprüfe ob die Entfernung unter 3 Meter ist			
			helpMessage("~INPUT_CONTEXT~ drücken um die Mission zu starten!")																						--falls ja zeige Text an			
			if (IsControlJustReleased(1, CFG.Tasten.E)) then																													--Überprüfe ob "E" gedrückt wurde			
																																									--#################--
																																									--STARTPUNKT FERTIG--
																																									--#################--
																																									-- Zeige Benachrichtigung(image, title, subtitle, message)
				SetNotificationBackgroundColor(CFG.Farben.Rot)
				ShowAdvNotification("CHAR_LESTER_DEATHWISH", "Mikrolai-Mission", "~u~Mission gestartet!")
				TriggerEvent("mt:missiontext", "Begebe dich zum ~y~Zielpunkt ~w~achte auf ~r~Wildtiere", 30000)														--Zeige Missionstext an Abhängigkeit: MissionText Resource				
				first_point = AddBlipForCoord (2359.0, 5338.0, 117.0)																								--Erstelle ersten Wegpunkt				
				DrawMarker(31, 2359.0, 5338.0, 117.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 0, 255, 50, true, true, 2, nil, nil, false)					--Marker für ersten Wegpunkt erstellen
			end
		end		
		RequestModel(-984709238)																																	--lade so früh wie möglich das Gegner Model		
		local coord = GetBlipCoords(first_point)																													--wandle Koordinaten vom ersten Punkt in Vector3 um
		local erste = vector3(coord.x, coord.y, coord.z)		
		local first_point_dist = GetDistanceBetweenCoords(erste.x, erste.y, erste.z, position.x, position.y, position.z, true)										--Überprüfen wie weit der Spieler vom Marker entfernt ist
		first_wave = GetDistanceBetweenCoords(2359.0, 5338.0, 117.0, position.x, position.y, position.z, true)		
		if first_point_dist < 3 then																																--Überprüfe ob die Entfernung unter 3 Meter ist falls ja werden Gegner gespawned und der Wegpunkt gelöscht			
			RemoveBlip(first_point)																																	--falls ja lösche Wegpunkt
			TriggerEvent("mt:missiontext", "~w~besiege die ~r~Feinde", 30000)
			
			local enemy1 = CreatePed(1, -984709238, 2260.924, 5318.339, 109.7214, 10.0, true, false)
			SetPedAiBlip (enemy1, true)
			SetPedRelationshipGroupHash(enemy1, GetHashKey('AMBIENT_GANG_LOST'))
			GiveWeaponToPed(enemy1, 'WEAPON_PISTOL', 999, false, true)
			TaskCombatPed(enemy1, PlayerPedId(), 0, 16)
			Wait(10)
			
			local enemy2 = CreatePed(1, -984709238, 2300.132, 5338.468, 112.4300, 10.0, true, false)
			SetPedAiBlip (enemy2, true)
			SetPedRelationshipGroupHash(enemy2, GetHashKey('AMBIENT_GANG_LOST'))
			GiveWeaponToPed(enemy2, 'WEAPON_PISTOL', 999, false, true)
			TaskCombatPed(enemy2, PlayerPedId(), 0, 16)
			Wait(10)
			
			local enemy3 = CreatePed(1, -984709238, 2325.113, 5366.131, 111.0863, 10.0, true, false) 
			SetPedRelationshipGroupHash(enemy3, GetHashKey('AMBIENT_GANG_LOST'))
			GiveWeaponToPed(enemy3, 'WEAPON_PISTOL', 999, false, true)
			TaskCombatPed(enemy3, PlayerPedId(), 0, 16)
			Wait(10)
			
			local enemy4 = CreatePed(1, -984709238, 2199.874, 5409.707, 147.6169, 10.0, true, false)
			SetPedAiBlip (enemy4, true)
			SetPedRelationshipGroupHash(enemy4, GetHashKey('AMBIENT_GANG_LOST'))
			GiveWeaponToPed(enemy4, 'WEAPON_PISTOL', 999, false, true)
			TaskCombatPed(enemy4, PlayerPedId(), 0, 16)
			Wait(10)
			
			local enemy5 = CreatePed(1, -984709238, 2201.416, 5311.135, 125.8224, 10.0, true, false)
			SetPedAiBlip (enemy5, true)
			SetPedRelationshipGroupHash(enemy5, GetHashKey('AMBIENT_GANG_LOST'))
			GiveWeaponToPed(enemy5, 'WEAPON_PISTOL', 999, false, true)
			TaskCombatPed(enemy5, PlayerPedId(), 0, 16)
				
				
					if enemy1_status == false or
					enemy2_status == false or
					enemy3_status == false or
					enemy4_status == false or
					enemy5_status == false then
					fight1 = true
					--wenn Gegner leben wird Thread fight1 gestartet--
			end
		end
	end	
end)

--versuche die Abfrage ob Gegner am leben sind auszuschalten wenn alle tot sind--
CreateThread(function()
				while fight1 == true do
				Wait(0)


				--prüfe Gegner Status--

				enemy1_status = IsPedDeadOrDying(enemy1, 1)
				enemy2_status = IsPedDeadOrDying(enemy2, 1)
				enemy3_status = IsPedDeadOrDying(enemy3, 1)
				enemy4_status = IsPedDeadOrDying(enemy4, 1)
				enemy5_status = IsPedDeadOrDying(enemy5, 1)


				--wenn alle Gegner getötet wurden wird Welle 1 beendet--
				if enemy1_status == 1 and
				enemy2_status == 1 and
				enemy3_status == 1 and
				enemy4_status == 1 and
				enemy5_status == 1 then
				

				print("enemies_dead")
				

				fight1 = false

					


end
end
end)



function helpMessage(text, duration)																																--Anzeige der Schrift
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

--[[
	Einstellungen für die Blips/Wegpunkte
NICHT AKTIV
local playerPed = GetPlayerPed(-1)
local name = nurburg
local position = GetEntityCoords(player)
local range = 2.0
local test = { x = 3720.0, y = -6543.0, z = 2200.0, heading = 320.0 }
TriggerServerEvent('StreetRaces:listRaces_sv')
SetPedCoordsKeepVehicle(playerPed, test.x, test.y, test.z)
]]--
