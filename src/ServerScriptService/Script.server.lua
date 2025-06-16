local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local promptBulkPurchaseEvent = ReplicatedStorage.Remotes:WaitForChild("PromptBulkPurchaseEvent")

-- Listen for the RemoteEvent to fire from a Client and then trigger the bulk purchase prompt
promptBulkPurchaseEvent.OnServerEvent:Connect(function(player, items)
	MarketplaceService:PromptBulkPurchase(player, items, {})
end)