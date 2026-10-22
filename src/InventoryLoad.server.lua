-- InventoryLoad.server.lua

local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local InventoryDataStore = DataStoreService:GetDataStore("InventoryData")

local function LoadInventory(player)
    local success, inventory = pcall(function()
        return InventoryDataStore:GetAsync(player.UserId)
    end)
    if success and inventory then
        player:SetAttribute("Inventory", inventory)
    else
        player:SetAttribute("Inventory", {})
    end
end

Players.PlayerAdded:Connect(function(player)
    LoadInventory(player)
end)

return LoadInventory