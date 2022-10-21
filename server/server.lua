ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end )

RegisterServerEvent("giverewardhalloween")
AddEventHandler("giverewardhalloween", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(Erko.MoneyReward)
end)