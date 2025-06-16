--[[
This module contains functions to buy each classic outfit.
]]

local module = {}

-- Purchase the outfit
function module.BuyOutfit(ids)
	local event = game.ReplicatedStorage.Remotes.PromptBulkPurchaseEvent

	event:FireServer(ids)
end

return module
