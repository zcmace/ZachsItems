local MyMod = RegisterMod("ZachsItems", 1);
local myPlayer = Isaac.GetPlayer();
local lore = Isaac.GetItemIdByName("Prophet's Lore");



------------- Prophets Lore ITEM
function MyMod:LoreUpdate(player, cacheFlag)
    

    local num = player:GetCollectibleNum(lore, true);


    if cacheFlag == CacheFlag.CACHE_DAMAGE then
        if player:HasCollectible(lore) then
        
            player.Damage = player.Damage + (1 * num);

        end

    end

    if cacheFlag == CacheFlag.CACHE_FIREDELAY  then 
        if player:HasCollectible(lore) then
            player.MaxFireDelay = player.MaxFireDelay - (1 * num);
        end
    end

end

MyMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MyMod.LoreUpdate);

-------------

