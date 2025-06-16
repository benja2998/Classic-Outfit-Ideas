--[[
This script is used to detect and prevent exploits.
It is important for the security of the game.
]]

local essentialFunctions = require(game.ReplicatedStorage.Modules.EssentialFunctions)
local SPIN_THRESHOLD = 2900
local RunService = game:GetService("RunService")
local playerRotationData = {}

local function checkWalkspeed()
	for i, player in game.Players:GetPlayers() do
		if player.Character then
			if player.Character:FindFirstChild("Humanoid") then
				-- Measure how much the player moves
				local distance = player.Character.Humanoid.RootPart.Velocity.Magnitude
				local walkspeed = player.Character.Humanoid.WalkSpeed
				local speedRatio = distance / walkspeed
				--print(distance)
				-- If the player is moving too fast, kick them
				if speedRatio > 1.6 then
					player:Kick(
						"Exploits detected due to unusually high speed. Speed to walkspeed ratio: " .. speedRatio
					)
				end
			end
		end
	end
end

-- Check player rotation speed

RunService.Stepped:Connect(function(_, deltaTime)
	for _, player in pairs(game.Players:GetPlayers()) do
		local character = player.Character
		if character then
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local data = playerRotationData[player] or {}
				local currentYaw = hrp.Orientation.Y

				if data.lastYaw then
					local deltaYaw = math.abs((currentYaw - data.lastYaw + 180) % 360 - 180)
					local spinRate = deltaYaw / deltaTime

					if spinRate >= SPIN_THRESHOLD then
						player:Kick("Exploits detected due to unexpected rotation speed. Rotation speed: " .. spinRate)
					end
				end

				data.lastYaw = currentYaw
				playerRotationData[player] = data
			end
		end
	end
end)

print("Anticheat is running.")

while true do
	checkWalkspeed()
	task.wait()
end
