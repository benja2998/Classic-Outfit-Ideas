local essentialFunctions = game.ReplicatedStorage.Modules.EssentialFunctions
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local promptBulkPurchaseEvent = ReplicatedStorage.Remotes:WaitForChild("PromptBulkPurchaseEvent")
local market = game:GetService("MarketplaceService")
local yesButton = script.Parent

yesButton.Activated:Connect(function()
	promptBulkPurchaseEvent:FireServer({
		{ Type = Enum.MarketplaceProductType.AvatarAsset, Id = "417457461" },
		{ Type = Enum.MarketplaceProductType.AvatarAsset, Id = "6281471022" },
		{ Type = Enum.MarketplaceProductType.AvatarAsset, Id = "8404481207" },
	})
	-- Close the GUI when the market prompt is closed
	market.PromptBulkPurchaseFinished:Connect(function(player, promptPurchaseFinished)
		script.Parent.Parent.Parent.Visible = not script.Parent.Parent.Parent.Visible
	end)
end)