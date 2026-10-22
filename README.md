# Inventory System for Roblox

This project provides a complete inventory system for Roblox games. It includes scripts for managing the inventory, displaying the inventory, saving the inventory, and loading the inventory. The system allows players to add and remove items from their inventory, and move items between their inventory and their backpack. The inventory is saved to the DataStoreService when the player leaves the game and loaded when the player joins the game.

## Installation

1. **Download the scripts**: Download the following scripts from the `src` folder:
   - `InventoryManager.server.lua`
   - `InventoryUI.client.lua`
   - `InventorySave.server.lua`
   - `InventoryLoad.server.lua`

2. **Place the scripts**:
   - Place `InventoryManager.server.lua` in the `ServerScriptService` folder.
   - Place `InventoryUI.client.lua` in the `StarterPlayerScripts` folder.
   - Place `InventorySave.server.lua` in the `ServerScriptService` folder.
   - Place `InventoryLoad.server.lua` in the `ServerScriptService` folder.

## Usage

1. **Adding items to the inventory**: Use the `AddItem` function from the `InventoryManager.server.lua` script to add items to the player's inventory.

2. **Removing items from the inventory**: Use the `RemoveItem` function from the `InventoryManager.server.lua` script to remove items from the player's inventory.

3. **Displaying the inventory**: The `InventoryUI.client.lua` script will automatically display the player's inventory when they join the game.

4. **Saving the inventory**: The `InventorySave.server.lua` script will automatically save the player's inventory when they leave the game.

5. **Loading the inventory**: The `InventoryLoad.server.lua` script will automatically load the player's inventory when they join the game.

---

More Roblox script projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/792ea497-4586-4569-af61-601e64cb2fdd?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=792ea497-4586-4569-af61-601e64cb2fdd
