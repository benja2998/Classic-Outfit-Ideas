local module = {}

-- Run a function indefinitely
function module.InfiniteLoop(codeToRun)
	while true do
		codeToRun()
		task.wait()
	end
end

return module
