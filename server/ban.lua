local function CreateBan(target, banstuff)
    MySQL.insert('INSERT INTO `userBans` (hwids, playerId) VALUES (?, ?)', {
        hwids, identifier
    }, function(id)
        DropPlayer(targetSrc, banstuff.reason and "You have been banned for" .. banstuff.reason .. "\n Your ban id is " .. id or "You have been banned without a reason provided. \n Your ban id is ".. id )
        -- print(id)
        print([[
            Someone banned someone jdjfdsjfdsjsa
        ]])
    end)
end
RegisterNetEvent('es_extended:server:ban', function(target, reason)
    local src = source
    local targetSrc = target
    local hwids = GetPlayerTokens(targetSrc)
    local xPlayer = ESX.GetPlayerFromId(src)
    local xTarget = ESX.GetPlayerFromId(targetSrc)
    local targetId = xTarget.identifier
    if IsPlayerAceAllowed(src, "group.admin") or IsPlayerAceAllowed(src, "group.god") then
        CreateBan({hwids = hwids, targetSrc = targetSrc, targetId = targetId}, {reason = reason})
    end
end)
