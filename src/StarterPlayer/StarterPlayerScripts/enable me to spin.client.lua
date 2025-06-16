local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Spin speed in degrees per frame
local spinSpeed = 50

RunService.RenderStepped:Connect(function()
	if hrp and hrp.Parent then
		hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
	end
end)
