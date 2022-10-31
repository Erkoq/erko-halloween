ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end )

RegisterServerEvent("giverewardhalloween")
AddEventHandler("giverewardhalloween", function()
	if daliMoze then
	  local xPlayer = ESX.GetPlayerFromId(source)
	  xPlayer.addMoney(Erko.MoneyReward)
	  dalimoze = false
	else
	  print('ovde stavite neku vasu funkciju moze biti ban moze biti sta god hocete')
	end
end)
