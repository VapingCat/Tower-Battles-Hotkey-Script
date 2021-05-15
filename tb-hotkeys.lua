-- Game Link:
-- https://www.roblox.com/games/45146873/Tower-Battles?refPageId=81b1e521-5de8-4344-b59e-4dcf6cdc365d

-- Tower Defense Hotkeys
-- Made By Vapin' Cat#5497

-- not very hard to make at all..

warn('Tower Defense Hotkeys')
warn('Made By Vapin\' Cat#5497')

local connections = {}

function execute()
	if getgenv()['Tower Defense Hotkeys'] then
		getgenv()['Tower Defense Hotkeys'].reset()
	end

	function bind(btn, key)
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

	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower1.image, Enum.KeyCode.One)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower2.image, Enum.KeyCode.Two)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower3.image, Enum.KeyCode.Three)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower4.image, Enum.KeyCode.Four)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.Towers.Tower5.image, Enum.KeyCode.Five)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.TowerStats.Sell, Enum.KeyCode.Backspace)
	bind(game:GetService("Players").LocalPlayer.PlayerGui.Stats.TowerStats.Path1.Purchase, Enum.KeyCode.E)
end

execute()

game.Players.LocalPlayer.CharacterAdded:Connect(function()
	game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild('Stats')
	execute()
end)

getgenv()['Tower Defense Hotkeys'] = {
	['reset'] = function()
		for _,v in pairs(connections) do
			v:Disconnect()
			connections = {}
		end
	end
}
