local module = {}

-- Run a function indefinitely
function module.InfiniteLoop(codeToRun)
	while true do
		codeToRun()
		task.wait()
	end
end

-- Run a function if a condition is met
function module.If(condition, codeToRun)
	if condition then
		codeToRun()
	end
end

-- Toggle the visibility of a GUI element
function module.ToggleGUIElement(guiElement)
	guiElement.Visible = not guiElement.Visible
end

return module
