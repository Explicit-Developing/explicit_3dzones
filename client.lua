local zones = {
  [1] = vector3(312.95, -218.71, 55.09),
  --[2] = vector3(312.95, -218.71, 55.09), if you want the text in more places just make more lines
}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for k, v in pairs(zones) do
      local coords = GetEntityCoords(PlayerPedId())
      local dist = GetDistanceBetweenCoords(coords, v, true)

      if dist <= 2 then
        Draw3dtext(v.x, v.y, v.z, '~g~[E]~w~ Change Me')
      end
    end
  end
end)

function Draw3dtext(x, y, z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = 0.5
   if onScreen then
	SetTextScale(scale, scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150) 
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
	end
end