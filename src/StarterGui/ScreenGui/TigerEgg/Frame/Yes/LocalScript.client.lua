local essentialFunctions = require(game.ReplicatedStorage.Modules.EssentialFunctions)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local promptBulkPurchaseEvent = ReplicatedStorage.Remotes:WaitForChild("PromptBulkPurchaseEvent")
local market = game:GetService("MarketplaceService")
local yesButton = script.Parent

yesButton.Activated:Connect(function()
	promptBulkPurchaseEvent:FireServer({
		{ Type = Enum.MarketplaceProductType.AvatarAsset, Id = "108150260" },
		{ Type = Enum.MarketplaceProductType.AvatarAsset, Id = "178211531" },
		{ Type = Enum.MarketplaceProductType.AvatarAsset, Id = "767401165" },
	})
	-- Close the GUI when the market prompt is closed
	market.PromptBulkPurchaseFinished:Connect(function(player, promptPurchaseFinished)
		essentialFunctions.ToggleGUIElement(script.Parent.Parent.Parent)
	end)
end)
