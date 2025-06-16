local buyModule = require(game.ReplicatedStorage.Modules.BuyModule)
local essentialFunctions = require(game.ReplicatedStorage.Modules.EssentialFunctions)
local player = game.Players.LocalPlayer

-- Make a table of every ClickDetector in the workspace

local clickDetectors = {}

for i, v in workspace:GetDescendants() do
	if v:IsA("ClickDetector") then
		table.insert(clickDetectors, v)
	end
end

-- Wait for a ClickDetector to be called

for i, clickDetector in clickDetectors do
	clickDetector.MouseClick:Connect(function(plr)
		if plr == player then
			local modelName = clickDetector.Parent.Name
			
			if modelName == "Guest Male" then
				print("Guest")
				buyModule.BuyGuest(player)
			elseif modelName == "Guest Female" then
				print("Guest")
				buyModule.BuyGuestFemale(player)
			else
				print("Not implemented.")
			end
		else
			print("Not localplayer")
		end
	end)
end