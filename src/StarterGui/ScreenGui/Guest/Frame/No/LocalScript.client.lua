local essentialFunctions = require(game.ReplicatedStorage.Modules.EssentialFunctions)

script.Parent.Activated:Connect(function()
	essentialFunctions.ToggleGUIElement(script.Parent.Parent.Parent)
end)