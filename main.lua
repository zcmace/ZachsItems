local MyMod = RegisterMod("ZachsItems", 1)

local book = Isaac.GetItemIdByName("Prophet's Lore")


function MyMod:CacheUpdate(player, CacheFlag)
    local player = Isaac.GetPlayer(0)
    if player.HasCollectible(book) then
        if CacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage +_1
        end
        if CacheFlag == CacheFlag.CACHE_FIREDELAY then
            player.FireDelay = player.FireDelay +_1
        end
    end
end

MyMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)