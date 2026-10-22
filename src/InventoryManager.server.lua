-- InventoryManager.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local InventoryManager = {}

function InventoryManager:new()
    local self = setmetatable({}, {__index = InventoryManager})
    self.Inventories = {}
    return self
end

function InventoryManager:AddItem(player, item)
    if not self.Inventories[player] then
        self.Inventories[player] = {}
    end
    table.insert(self.Inventories[player], item)
end

function InventoryManager:RemoveItem(player, item)
    if not self.Inventories[player] then
        return
    end
    for i, v in ipairs(self.Inventories[player]) do
        if v == item then
            table.remove(self.Inventories[player], i)
            break
        end
    end
end

function InventoryManager:GetInventory(player)
    return self.Inventories[player] or {}
end

local inventoryManager = InventoryManager:new()

Players.PlayerAdded:Connect(function(player)
    local backpack = Instance.new("Folder")
    backpack.Name = "Backpack"
    backpack.Parent = player

    local function onCharacterAdded(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            for _, item in ipairs(inventoryManager:GetInventory(player)) do
                item.Parent = backpack
            end
        end)
    end

    player.CharacterAdded:Connect(onCharacterAdded)
end)

return inventoryManager