--[[
This module contains functions to buy each classic outfit.
]]

local module = {}

-- Show a GUI to buy the guest outfit
function module.BuyGuest(plr)
	plr.PlayerGui.ScreenGui.Guest.Visible = true
end

-- Show a GUI to buy the guest outfit
function module.BuyGuestFemale(plr)
	plr.PlayerGui.ScreenGui.GuestFemale.Visible = true
end

return module