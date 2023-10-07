QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('map' , function(source, item)
    TriggerClientEvent('ms:client:openmap', source)

end)