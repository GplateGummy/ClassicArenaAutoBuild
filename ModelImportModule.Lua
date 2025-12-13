local ImportModule = {}
local BtoolsFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/GplateGummy/ClassicArenaAutoBuild/refs/heads/main/Functions.Lua"))()

function ImportModule.Import(importCode, delayPerPart, onProgressCallback)
	importCode = tonumber(importCode)
	delayPerPart = delayPerPart or 0.03
	delayPerPart = math.max(delayPerPart, 0.01)

	local success, models = pcall(function()
		return game:GetObjects("rbxassetid://" .. tostring(importCode))
	end)
	
	if success and models then
		local parts = {}
		
		for _, model in pairs(models) do
			for _, obj in ipairs(model:GetDescendants()) do
				if obj:IsA("Part") then
					table.insert(parts, obj)
				end
			end
		end

		local totalParts = #parts
		local processedParts = 0

		for _, partData in ipairs(parts) do
			local part = BtoolsFunctions.CreatePart(partData.CFrame, partData.Shape, partData:IsA("SpawnLocation"))

			if part then
				BtoolsFunctions.Resize(part, partData.Size, partData.CFrame)
				BtoolsFunctions.Color(part, partData.Color)
				BtoolsFunctions.Material(part, partData.Material)
				BtoolsFunctions.SetTransparency(part, partData.Transparency)
				BtoolsFunctions.SetCollision(part, partData.CanCollide)
				BtoolsFunctions.SetShadow(part, partData.CastShadow)

				local pointLightData = partData:FindFirstChildOfClass("PointLight")
				if pointLightData then
					BtoolsFunctions.SetLightBrightness(part, pointLightData.Brightness)
					BtoolsFunctions.SetLightRange(part, pointLightData.Range)
				end
			end

			processedParts = processedParts + 1

			if onProgressCallback then
				onProgressCallback(processedParts, totalParts)
			end

			task.wait(delayPerPart)
		end

		pcall(function()
			for _, model in pairs(models) do
				model:Destroy()
			end
		end)
	end
end

return ImportModule
