function MakeArea(v, EnterredArea, LeftArea, Tick)
	Tick = Tick or 0
	
	local AreaData = {}

	local function TickArea(LatestData)
		-- Left
		local Left, ChangedLeft = {}, false
		for i, v in ipairs(AreaData) do
			if not table.find(LatestData, v) then
				table.remove(AreaData, i)
				table.insert(Left, v)
				ChangedLeft = true
			end
		end
		if ChangedLeft then
			for _, v in ipairs(Left) do
				LeftArea(v, Left)
			end
		end


		-- Enterred
		local Enterred, ChangedEnterred = {}, false
		for i, v in ipairs(LatestData) do
			if not table.find(AreaData, v) then
				table.insert(AreaData, v)
				table.insert(Enterred, v)
				ChangedEnterred = true
			end
		end
		if ChangedEnterred then
			for _, v in ipairs(Enterred) do
				EnterredArea(v, Enterred)
			end
		end
	end
	
	while wait(Tick) do
		local Players = {}

		for _, TouchingPart in ipairs(workspace:GetPartsInPart(v)) do
			local Character = TouchingPart.Parent
			local Humanoid = Character:FindFirstChild("Humanoid")
			if Humanoid then
				local Player = game:GetService("Players"):GetPlayerFromCharacter(Character);
				if Player then
					table.insert(Players, Player.UserId)
				end
			end
		end

		TickArea(Players)
	end
end

return {MakeArea = coroutine.wrap(MakeArea)}
