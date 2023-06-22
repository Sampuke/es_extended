local function CreateBan(banner, target, banstuff)
    MySQL.insert('INSERT INTO `userBans` (hwids, playerId) VALUES (?, ?)', {
        hwids, identifier
    }, function(id)
        DropPlayer(targetSrc, banstuff.reason and "You have been banned for" .. banstuff.reason .. "\n Your ban id is " .. id or "You have been banned without a reason provided. \n Your ban id is ".. id )
        -- print(id)
        print(banner.xPlayer.name .. " banned: " .. target.xTarget .. ". Ban lenght is " .. banstuff.length .. ". Ban will end " .. )
    end)
end
RegisterNetEvent('es_extended:server:ban', function(target, reason, length)
    local src = source
    local targetSrc = target
    local hwids = GetPlayerTokens(targetSrc)
    local xPlayer = ESX.GetPlayerFromId(src)
    local xTarget = ESX.GetPlayerFromId(targetSrc)
    local targetId = xTarget.identifier
    if IsPlayerAceAllowed(src, "group.admin") or IsPlayerAceAllowed(src, "group.god") then
        CreateBan({xPlayer = xPlayer}{hwids = hwids, targetSrc = targetSrc, targetId = targetId, xTarget = xTarget}, {reason = reason, length = length})
    end
end)
