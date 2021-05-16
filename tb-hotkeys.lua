--// Game Link:
--// https://www.roblox.com/games/45146873/Tower-Battles?refPageId=81b1e521-5de8-4344-b59e-4dcf6cdc365d
--//
--// Tower Defense Hotkeys
--// Made By Vapin' Cat#5497
--//
--// not very hard to make at all..

--// Settings

function initialize(bind) --// This is where you get a button and bind a hotkey.
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower1.image, Enum.KeyCode.One)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower2.image, Enum.KeyCode.Two)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower3.image, Enum.KeyCode.Three)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower4.image, Enum.KeyCode.Four)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower5.image, Enum.KeyCode.Five)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.TowerStats.Sell, Enum.KeyCode.Backspace)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.TowerStats.Path1.Purchase, Enum.KeyCode.E)
end

if game.PlaceId ~= 45146873 then return end --// Game check

warn('Tower Defense Hotkeys')
warn('Made By Vapin\' Cat#5497')

local connections = {} --// Create array for storage of connections

function bind(btn, key) --// Bind function
	table.insert(connections,game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
		if not gameProcessedEvent then
			if inputObject.KeyCode == key then
				for _,v in pairs(getconnections(btn.MouseButton1Down)) do
					v.Function()
				end
				for _,v in pairs(getconnections(btn.MouseButton1Click)) do
					v.Function()
				end
				for _,v in pairs(getconnections(btn.MouseButton1Up)) do
					v.Function()
				end
			end
		end
	end))
end

function execute() --// Function that contains code that runs each time you reset.
	if getgenv()['Tower Defense Hotkeys'] then
		getgenv()['Tower Defense Hotkeys'].reset()
	end

	initialize(bind)
end

execute() --// Run code once so you don't have to reset

game.Players.LocalPlayer.CharacterAdded:Connect(function() --// Connect to the reset rbxscriptsignal
	game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild('Stats') --// Wait for the GUIs to load in
	execute() --// Run code after reset
end)

getgenv()['Tower Defense Hotkeys'] = { --// allows prevention of double-execution
	['reset'] = function()
		for _,v in pairs(connections) do
			v:Disconnect()
			connections = {}
		end
	end
}
