local Module = {}

function Module.Execute(RemoteName, RemoteArgs)
	local Remote = game:GetService("ReplicatedStorage"):WaitForChild("Game"):WaitForChild("Events"):WaitForChild("BUILDMODE"):FindFirstChild(RemoteName)

	if Remote then
		if Remote:IsA("RemoteEvent") then
			Remote:FireServer(unpack(RemoteArgs))
		elseif Remote:IsA("RemoteFunction") then
			return Remote:InvokeServer(unpack(RemoteArgs))
		end
	end
end

function Module.Shape(Part, Shape)
	local Shapes = {
		Enum.PartType.Block,
		Enum.PartType.Ball,
		Enum.PartType.Wedge,
		Enum.PartType.Cylinder,
		Enum.PartType.CornerWedge
	}

	if table.find(Shapes, Shape) then
		local CurrentIndex = table.find(Shapes, Part.Shape)
		local TargetIndex = table.find(Shapes, Shape)

		local Offset = (TargetIndex - CurrentIndex) % #Shapes

		for I = 1, Offset do
			local Args = {
				[1] = Part,
				[2] = false
			}

			Module.Execute("UpdatePartShape", Args)
		end	
	end
end

function Module.CreatePart(PartCFrame, PartShape, IsSpawnLocation)
	local Args = {
		[1] = PartCFrame
	}

	local Part = nil

	if IsSpawnLocation then
		Part = Module.Execute("CreateSpawnLocation", Args)
	else
		Part = Module.Execute("CreatePart", Args)
	end

	if Part then
		Module.Shape(Part, PartShape)
	end

	return Part
end

function Module.Material(Part, Material)
	local Materials = {
		Enum.Material.Plastic,
		Enum.Material.SmoothPlastic,
		Enum.Material.Grass,
		Enum.Material.Cobblestone,
		Enum.Material.Sand,
		Enum.Material.Slate,
		Enum.Material.Pebble,
		Enum.Material.Ice,
		Enum.Material.Brick,
		Enum.Material.Wood,
		Enum.Material.WoodPlanks,
		Enum.Material.Glass,
		Enum.Material.DiamondPlate,
		Enum.Material.Metal,
		Enum.Material.Concrete,
		Enum.Material.Foil,
		Enum.Material.Neon,
		Enum.Material.Marble
	}

	if table.find(Materials, Material) then
		local CurrentIndex = table.find(Materials, Part.Material)
		local TargetIndex = table.find(Materials, Material)

		local Offset = (TargetIndex - CurrentIndex) % #Materials

		for I = 1, Offset do
			local Args = {
				[1] = Part,
				[2] = false
			}

			Module.Execute("UpdatePartMaterial", Args)
		end	
	end
end

function Module.Move(Part, PartCFrame)
	local Args = {
		[1] = Part,
		[2] = Part.Size,
		[3] = PartCFrame
	}

	Module.Execute("UpdatePart", Args)
end

function Module.Resize(Part, PartSize, PartCFrame)
	local Args = {
		[1] = Part,
		[2] = PartSize,
		[3] = PartCFrame
	}

	Module.Execute("UpdatePart", Args)
end

function Module.Color(Part, Color)
	local Args = {
		[1] = Part,
		[2] = Color
	}

	Module.Execute("UpdatePartColor", Args)
end

function Module.SetTransparency(Part, Transparency)
	local Args = {
		[1] = Part,
		[2] = Transparency
	}

	Module.Execute("UpdatePartTransparency", Args)
end

function Module.SetShadow(Part, Shadow)
	if Part.CastShadow ~= Shadow then
		local Args = {
			[1] = Part
		}

		Module.Execute("UpdatePartShadow", Args)
	end
end

function Module.SetCollision(Part, Collision)
	if Part.CanCollide ~= Collision then
		local Args = {
			[1] = Part
		}

		Module.Execute("UpdatePartCollision", Args)
	end
end

function Module.SetVelocity(Part, Velocity)
	local Args = {
		[1] = Part,
		[2] = Velocity
	}

	Module.Execute("UpdatePartVelocity", Args)
end

function Module.SetLightBrightness(Part, Brightness)
	local Args = {
		[1] = Part,
		[2] = Brightness
	}

	Module.Execute("UpdatePartBrightness", Args)
end

function Module.SetLightRange(Part, LightRange)
	local Args = {
		[1] = Part,
		[2] = LightRange
	}

	Module.Execute("UpdatePartLightRange", Args)
end

function Module.Duplicate(Part)
	local Args = {
		[1] = Part
	}

	return Module.Execute("DuplicatePart", Args)
end

function Module.Delete(Part)
	local Args = {
		[1] = Part
	}

	Module.Execute("DeletePart", Args)
end

return Module
