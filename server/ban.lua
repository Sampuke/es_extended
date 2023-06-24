local function CreateBan(banner, target, banstuff)
    MySQL.insert('INSERT INTO `userBans` (hwids, playerId) VALUES (?, ?)', {
        hwids, identifier
    }, function(id)
        DropPlayer(targetSrc, banstuff.reason and "You have been banned for" .. banstuff.reason .. "\n Your ban id is " .. id or "You have been banned without a reason provided. \n Your ban id is ".. id )
        -- print(id)
        print(banner.xPlayer.getName() .. " banned " .. target.identifier .. " for " .. banstuff.reason .. " and it is going to expire " .. os.date())
    end)
end
AddEventHandler('es_extended:server:ban', function(target, reason, lenght)
    local src = source
    local targetSrc = target
    local hwids = GetPlayerTokens(targetSrc)
    local xPlayer = ESX.GetPlayerFromId(src)
    local xTarget = ESX.GetPlayerFromId(targetSrc)
    local identifiers = GetPlayerIdentifiers(source)
    if IsPlayerAceAllowed(src, "group.admin") or GetInvokingResource() and xTarget ~= nil then
        CreateBan({xPlayer = xPlayer, source = src}, {hwids = hwids, identifiers = identifiers, targetSrc = targetSrc}, {reason = reason, lenght = lenght})
    else
        TriggerClientEvent('ox_lib:notify', source, {title = "Banning", description = "Couldn\'t ban " .. target .. " eighter the person is not online or you put the wrong id", type = "error", id = 'noonetoban'})
    end
end)


local function banPlayer(target, reason, lenght)
    local src = source
    local targetSrc = target
    local hwids = GetPlayerTokens(targetSrc)
    local xPlayer = ESX.GetPlayerFromId(src)
    local xTarget = ESX.GetPlayerFromId(targetSrc)
    local identifiers = GetPlayerIdentifiers(source)
    if IsPlayerAceAllowed(src, "group.admin") and xTarget ~= nil then
        CreateBan({xPlayer = xPlayer, source = src}, {hwids = hwids, identifiers = identifiers, targetSrc = targetSrc}, {reason = reason})
    else
        TriggerClientEvent('ox_lib:notify', source, {title = "Banning", description = "Couldn\'t ban " .. target .. " eighter the person is not online or you put the wrong id", type = "error", id = 'noonetoban'})
    end
end
lib.addCommand('ban', {
    help = 'Ban a player',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Target player\'s server id', 
        },
        {
            name = 'Lenght',
            type = 'string',
            help = 'How long should the ban last ( 1m / 1h / 1d / 1w)',
            optional = true,
        },
        {
            name = 'Reason',
            type = 'string',
            help = 'Reason for the ban',
            optional = true,
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    banPlayer(args[target], args[Reason], args[Lenght])
end)

