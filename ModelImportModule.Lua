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

	local materialGroups = {}

	for _, data in ipairs(partsData) do
		local partData = data.part
		local materialKey = string.format("%s_%s_%s", 
			tostring(partData.Shape), 
			tostring(partData:IsA("SpawnLocation")),
			tostring(partData.Material)
		)

		if not materialGroups[materialKey] then
			materialGroups[materialKey] = {}
		end
		table.insert(materialGroups[materialKey], data)
	end

	local totalParts = #partsData
	local processedParts = 0

	for materialKey, group in pairs(materialGroups) do
		local templatePart = nil
		local templatePartData = nil

		for i, data in ipairs(group) do
			local partData = data.part

			if i == 1 then
				templatePartData = partData
				templatePart = BtoolsFunctions.CreatePart(partData.CFrame, partData.Shape, partData:IsA("SpawnLocation"))

				if templatePart then
					BtoolsFunctions.Resize(templatePart, partData.Size, partData.CFrame)
					BtoolsFunctions.Color(templatePart, partData.Color)
					BtoolsFunctions.Material(templatePart, partData.Material)
					BtoolsFunctions.SetTransparency(templatePart, partData.Transparency)
					BtoolsFunctions.SetCollision(templatePart, partData.CanCollide)
					BtoolsFunctions.SetShadow(templatePart, partData.CastShadow)

					local pointLightData = partData:FindFirstChildOfClass("PointLight")
					if pointLightData then
						BtoolsFunctions.SetLightBrightness(templatePart, pointLightData.Brightness)
						BtoolsFunctions.SetLightRange(templatePart, pointLightData.Range)
					end
				end
			else
				if (not templatePart or not templatePart.Parent) and templatePartData then
					templatePart = BtoolsFunctions.CreatePart(templatePartData.CFrame, templatePartData.Shape, templatePartData:IsA("SpawnLocation"))

					if templatePart then
						BtoolsFunctions.Resize(templatePart, templatePartData.Size, templatePartData.CFrame)
						BtoolsFunctions.Color(templatePart, templatePartData.Color)
						BtoolsFunctions.Material(templatePart, templatePartData.Material)
						BtoolsFunctions.SetTransparency(templatePart, templatePartData.Transparency)
						BtoolsFunctions.SetCollision(templatePart, templatePartData.CanCollide)
						BtoolsFunctions.SetShadow(templatePart, templatePartData.CastShadow)

						local pointLightData = templatePartData:FindFirstChildOfClass("PointLight")
						if pointLightData then
							BtoolsFunctions.SetLightBrightness(templatePart, pointLightData.Brightness)
							BtoolsFunctions.SetLightRange(templatePart, pointLightData.Range)
						end
					end
				end

				if templatePart then
					coroutine.wrap(function()
						local dupedPart = BtoolsFunctions.Duplicate(templatePart)

						if dupedPart then
							if partData.Size ~= templatePartData.Size or partData.CFrame ~= templatePartData.CFrame then
								BtoolsFunctions.Resize(dupedPart, partData.Size, partData.CFrame)
							end

							if partData.Color ~= templatePartData.Color then
								BtoolsFunctions.Color(dupedPart, partData.Color)
							end

							BtoolsFunctions.SetTransparency(dupedPart, partData.Transparency)
							BtoolsFunctions.SetCollision(dupedPart, partData.CanCollide)
							BtoolsFunctions.SetShadow(dupedPart, partData.CastShadow)

							local pointLightData = partData:FindFirstChildOfClass("PointLight")
							local templatePointLightData = templatePartData:FindFirstChildOfClass("PointLight")

							if pointLightData then
								if not templatePointLightData or pointLightData.Brightness ~= templatePointLightData.Brightness then
									BtoolsFunctions.SetLightBrightness(dupedPart, pointLightData.Brightness)
								end
								if not templatePointLightData or pointLightData.Range ~= templatePointLightData.Range then
									BtoolsFunctions.SetLightRange(dupedPart, pointLightData.Range)
								end
							end
						end
					end)()
				end
			end

			processedParts = processedParts + 1
			if onProgressCallback then
				onProgressCallback(processedParts, totalParts)
			end

			task.wait(delayPerPart)
		end
	end

	pcall(function()
		for _, model in pairs(models) do
			model:Destroy()
		end
	end)
end

return ImportModule
