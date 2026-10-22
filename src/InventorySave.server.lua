-- InventorySave.server.lua

local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local InventoryDataStore = DataStoreService:GetDataStore("InventoryData")

local function SaveInventory(player, inventory)
    local success, err = pcall(function()
        InventoryDataStore:SetAsync(player.UserId, inventory)
    end)
    if not success then
        warn("Failed to save inventory for " .. player.Name .. ": " .. err)
    end
end

Players.PlayerRemoving:Connect(function(player)
    local inventory = player:GetAttribute("Inventory")
    if inventory then
        SaveInventory(player, inventory)
    end
end)

return SaveInventory