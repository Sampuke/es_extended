local function CreateBan(hwids, xTarget, identifier)
    
end
RegisterNetEvent('es_extended:server:ban', function(target)
    local src = source
    local targetSrc = target
    local hwids = GetPlayerTokens(targetSrc)
    local xPlayer = ESX.GetPlayerFromId(src)
    local xTarget = ESX.GetPlayerFromId(targetSrc)
    local targetId = xTarget.identifier
    if IsPlayerAceAllowed(src, "group.admin") or IsPlayerAceAllowed(src, "group.god") then
        CreateBan(hwids, xTarget, targetId)
    end
end)
