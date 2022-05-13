local MyMod = RegisterMod("ZachsItems", 1);
local myPlayer = Isaac.GetPlayer();
local lore = Isaac.GetItemIdByName("Prophet's Lore");

local debugText="";

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
            if (player.MaxFireDelay - 1) >= 5 then
                player.MaxFireDelay = player.MaxFireDelay - (1 * num);
            end
        end
        debugText = tostring(player.MaxFireDelay);
    end

end

MyMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MyMod.LoreUpdate);

-------------

-- debug
local function onRender()
    Isaac.RenderText(debugText, 150,130, 1, 1, 1, 255)
end

MyMod:AddCallback(ModCallbacks.MC_POST_RENDER, onRender)