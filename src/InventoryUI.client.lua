-- InventoryUI.client.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local InventoryUI = Instance.new("ScreenGui")
InventoryUI.Name = "InventoryUI"
InventoryUI.Parent = playerGui

local InventoryFrame = Instance.new("Frame")
InventoryFrame.Name = "InventoryFrame"
InventoryFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
InventoryFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
InventoryFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
InventoryFrame.Parent = InventoryUI

local InventoryList = Instance.new("ScrollingFrame")
InventoryList.Name = "InventoryList"
InventoryList.Size = UDim2.new(1, 0, 0.8, 0)
InventoryList.Position = UDim2.new(0, 0, 0.2, 0)
InventoryList.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
InventoryList.Parent = InventoryFrame

local function UpdateInventory(inventory)
    for _, child in ipairs(InventoryList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    for i, item in ipairs(inventory) do
        local itemButton = Instance.new("TextButton")
        itemButton.Name = item
        itemButton.Text = item
        itemButton.Size = UDim2.new(1, 0, 0, 30)
        itemButton.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
        itemButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        itemButton.Parent = InventoryList

        itemButton.MouseButton1Click:Connect(function()
            local backpack = player:FindFirstChild("Backpack")
            if backpack then
                item.Parent = backpack
                UpdateInventory(inventory)
            end
        end)
    end
end

local function OnInventoryUpdated(inventory)
    UpdateInventory(inventory)
end

player:GetAttributeChangedSignal("Inventory"):Connect(function()
    local inventory = player:GetAttribute("Inventory")
    OnInventoryUpdated(inventory)
end)

local inventory = player:GetAttribute("Inventory")
if inventory then
    OnInventoryUpdated(inventory)
end