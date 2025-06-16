local TextChatService = game:GetService("TextChatService")
local SystemChat: TextChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")
local ClientJoined = time()

-- Will Display a message in chat to local user in 'RBXSystem' channel
local function DisplayMessage(Message: string)
	local function Show()
		SystemChat:DisplaySystemMessage(Message)
	end
	if 1 < time() - ClientJoined then
		Show() -- Chat is loaded
	else
		-- Oh no! Chat gui has not loaded. We need to wait a second to make sure it is loaded.
		coroutine.wrap(function()
			task.wait(1 - (workspace:GetServerTimeNow() - ClientJoined))
			Show()
		end)()
	end
end
--Makes Text turn the color you want.
function ColorText(Text: string, Color: Color3): string
	return `<font color="#{Color:ToHex()}">{Text}</font>`
end

-- Player Join/leave message in chat

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGameStatusMessage: RemoteEvent = ReplicatedStorage:WaitForChild("PlayerGameStatusMessage")
PlayerGameStatusMessage.OnClientEvent:Connect(function(SentPlayer: Player, Status: "joined" | "left")
	-- Lets make the '[Server]: ' part of the message blue!
	local ServerText = ColorText("[Server]: ", Color3.new(0.329412, 0.47451, 1))
	-- Green for joined game, Red for left game
	local StatusColor = (Status == "joined" and Color3.new(0.364706, 1, 0.254902)) or Color3.new(1, 0.494118, 0.501961)
	DisplayMessage(`{ServerText}{SentPlayer.DisplayName} has {ColorText(Status, StatusColor)} the game.`)
end)
