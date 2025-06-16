local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Lets create a remote event cause we need to connect to players
local PlayerGameStatusMessage = Instance.new("RemoteEvent")
PlayerGameStatusMessage.Name = "PlayerGameStatusMessage"
PlayerGameStatusMessage.Parent = ReplicatedStorage

Players.PlayerAdded:Connect(function(Player)
	task.wait(0.25) -- let the player that just join load their chat script
	PlayerGameStatusMessage:FireAllClients(Player, "joined")
end)
Players.PlayerRemoving:Connect(function(Player)
	PlayerGameStatusMessage:FireAllClients(Player, "left")
end)
