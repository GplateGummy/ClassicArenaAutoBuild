local ImportModule = {}
local BtoolsFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/GplateGummy/ClassicArenaAutoBuild/refs/heads/main/Functions.Lua"))()

function ImportModule.Import(importCode, delayPerPart, onProgressCallback)
	importCode = tonumber(importCode)
	delayPerPart = delayPerPart or 0.03
	delayPerPart = math.max(delayPerPart, 0.01)
	
	local success, models = pcall(function()
		return game:GetObjects("rbxassetid://" .. tostring(importCode))
	end)
	
	if not success or not models then
		return
	end
	
	local partsData = {}
	
	for _, model in pairs(models) do
		for _, obj in ipairs(model:GetDescendants()) do
			if obj:IsA("Part") then
				local volume = obj.Size.X * obj.Size.Y * obj.Size.Z
				table.insert(partsData, {
					part = obj,
					volume = volume
				})
			end
		end
	end
	
	table.sort(partsData, function(a, b)
		return a.volume > b.volume
	end)
	
	local totalParts = #partsData
	local processedParts = 0
	
	local materialParts = {}
	
	for _, data in ipairs(partsData) do
		local partData = data.part
		local materialKey = string.format("%s_%s_%s", 
			tostring(partData.Shape), 
			tostring(partData:IsA("SpawnLocation")),
			tostring(partData.Material)
		)
		
		if not materialParts[materialKey] then
			local part = BtoolsFunctions.CreatePart(partData.CFrame, partData.Shape, partData:IsA("SpawnLocation"))
			if part then
				materialParts[materialKey] = part
			end
		end
	end
	
	for _, data in ipairs(partsData) do
		local partData = data.part
		local materialKey = string.format("%s_%s_%s", 
			tostring(partData.Shape), 
			tostring(partData:IsA("SpawnLocation")),
			tostring(partData.Material)
		)
		
		local materialPart = materialParts[materialKey]
		
		if not materialPart or not materialPart.Parent then
			materialPart = BtoolsFunctions.CreatePart(partData.CFrame, partData.Shape, partData:IsA("SpawnLocation"))
			materialParts[materialKey] = materialPart
		end
		
		if materialPart then
			BtoolsFunctions.Resize(materialPart, partData.Size, partData.CFrame)
			BtoolsFunctions.Color(materialPart, partData.Color)
			BtoolsFunctions.Material(materialPart, partData.Material)
			BtoolsFunctions.SetTransparency(materialPart, partData.Transparency)
			BtoolsFunctions.SetCollision(materialPart, partData.CanCollide)
			BtoolsFunctions.SetShadow(materialPart, partData.CastShadow)
			
			local pointLightData = partData:FindFirstChildOfClass("PointLight")
			if pointLightData then
				BtoolsFunctions.SetLightBrightness(materialPart, pointLightData.Brightness)
				BtoolsFunctions.SetLightRange(materialPart, pointLightData.Range)
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

return ImportModule
