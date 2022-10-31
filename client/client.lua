ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

end)

attack = false

function isnight()
    local hour = GetClockHours()
    if Erko.DEBUG == true then print(hour) end
    if hour > Erko.HoursMinForNightOn or hour < Erko.HoursMaxForNightOff then
     return true
    end
    return false
end

Citizen.CreateThread(function()
    Wait(1000)
    while true do
        Wait(1000)
            if Erko.DEBUG == true then print(isnight()) end
            if attack == false and isnight() == true then
                    findmyped(Erko.WaitForNewAttackFromPed)
            else
                Wait(1000)
            end

    end

end)

function findmyped(CEKENZI)
    local kolikocekam = tonumber(CEKENZI)
    local playerped = PlayerPedId()
    local hash = GetHashKey(Erko.HashPed)
    Wait(kolikocekam*60000)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do 
        Wait(10)
    end

    attack = true
    pedforattack = CreatePed(5, hash, GetEntityCoords(playerped) + vector3(20,20,0), 30.8, false, false)
    SetPedDropsWeaponsWhenDead(pedforattack, true)
    TaskCombatPed(pedforattack, playerped, 0, 16)
    SetBlockingOfNonTemporaryEvents(pedforattack, true)
    if Erko.PedWeapon then 
    GiveWeaponToPed(pedforattack,Erko.WeaponPed,150,false,true)
    end
    while attack == true do
     --   if Erko.DEBUG == true then print("attack START") end
        Wait(500) 
        if GetEntityHealth(playerped) >= 1 and not IsPedInCombat(playerped,pedforattack) then 
            TaskCombatPed(pedforattack, playerped, 0, 16)
        end
    if IsPedDeadOrDying(pedforattack) then 
        if Erko.PickUpWeaponRemove then 
       --     if Erko.DEBUG == true then print("REMOVED PICKUP") end
            
        end
        attack = false

        deadpedtype = GetPedSourceOfDeath(pedforattack)

        if deadpedtype == PlayerPedId() then 
            if GetPedCauseOfDeath(pedforattack) == 'WEAPON_RUN_OVER_BY_CAR' or GetPedCauseOfDeath(pedforattack) == 'WEAPON_RAMMED_BY_CAR' then 
                ESX.ShowNotification(Erko.Lang[1])
                else
            daliMoze = true
            TriggerServerEvent("giverewardhalloween")
            findmyped(Erko.WaitForNewAttackFromPed)
                end
            else
        ESX.ShowNotification(Erko.Lang[1])
        end
    end
    end
end

