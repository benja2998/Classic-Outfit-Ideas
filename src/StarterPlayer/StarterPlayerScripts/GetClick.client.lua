local buyModule = require(game.ReplicatedStorage.Modules.BuyModule)
local essentialFunctions = require(game.ReplicatedStorage.Modules.EssentialFunctions)
local market = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

-- Make a table of every ClickDetector in the workspace

local clickDetectors = {}

for i, v in workspace:GetDescendants() do
	if v:IsA("ClickDetector") then
		table.insert(clickDetectors, v)
	end
end

-- Wait for a ClickDetector to be called

for i, clickDetector in ipairs(clickDetectors) do
	clickDetector.MouseClick:Connect(function(plr)
		if plr == player then
			local modelName = clickDetector.Parent.Name
			local outfit = clickDetector.Parent

			local hatId = nil
			local hatId2 = nil
			local hatId3 = nil
			local backId = nil
			local bundleId = nil
			local shirtId = outfit.ShirtId.Value
			local pantsId = outfit.PantsId.Value
			local bulkPurchaseArray = {}

			if outfit:GetAttribute("hatId") then
				hatId = outfit:GetAttribute("hatId")
				table.insert(bulkPurchaseArray, { Type = Enum.MarketplaceProductType.AvatarAsset, Id = hatId })
			end

			if outfit:GetAttribute("hatId2") then
				hatId2 = outfit:GetAttribute("hatId2")
				table.insert(bulkPurchaseArray, { Type = Enum.MarketplaceProductType.AvatarAsset, Id = hatId2 })
			end

			if outfit:GetAttribute("hatId3") then
				hatId3 = outfit:GetAttribute("hatId3")
				table.insert(bulkPurchaseArray, { Type = Enum.MarketplaceProductType.AvatarAsset, Id = hatId3 })
			end

			if outfit:GetAttribute("backId") then
				backId = outfit:GetAttribute("backId")
				table.insert(bulkPurchaseArray, { Type = Enum.MarketplaceProductType.AvatarAsset, Id = backId })
			end

			if outfit:GetAttribute("bundleId") then
				bundleId = outfit:GetAttribute("bundleId")
				table.insert(bulkPurchaseArray, { Type = Enum.MarketplaceProductType.AvatarBundle, Id = bundleId })
			end

			-- Also add shirts and pants to the table

			table.insert(bulkPurchaseArray, { Type = Enum.MarketplaceProductType.AvatarAsset, Id = shirtId })
			table.insert(bulkPurchaseArray, { Type = Enum.MarketplaceProductType.AvatarAsset, Id = pantsId })

			print(bulkPurchaseArray)
			buyModule.BuyOutfit(bulkPurchaseArray)
		else
			print("Not localplayer")
		end
	end)
end
