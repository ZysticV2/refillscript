-- server.lua

local QBCore = exports['qb-core']:GetCoreObject()

-- Debug: Check if QBCore is loaded
if QBCore == nil then
    print("[DEBUG] QBCore is not initialized")
else
    print("[DEBUG] QBCore is initialized")
end

-- Register the refill command
QBCore.Commands.Add('refill', 'Refill your food and water levels to maximum', {}, false, function(source, args)
    print("[DEBUG] /refill command invoked")
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Debug: Check if Player object is retrieved
    if Player then
        print("[DEBUG] Player found: " .. Player.PlayerData.citizenid)

        -- Update the player's food and water levels
        Player.Functions.SetMetaData('hunger', 100)
        Player.Functions.SetMetaData('thirst', 100)

        -- Debug: Verify the metadata update
        print("[DEBUG] Updated hunger and thirst for player: " .. Player.PlayerData.citizenid)

        -- Notify the player
        TriggerClientEvent('QBCore:Notify', src, 'Your food and water levels have been refilled.', 'success')
    else
        -- Debug: Player object not found
        print("[DEBUG] Player not found for source: " .. src)
        TriggerClientEvent('QBCore:Notify', src, 'Failed to refill your food and water levels.', 'error')
    end
end)
