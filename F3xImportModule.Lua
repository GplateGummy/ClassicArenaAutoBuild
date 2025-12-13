local ImportModule = {}
local BtoolsFunctions = loadstring(game:HttpGet("https://raw.githubusercontent.com/GplateGummy/ClassicArenaAutoBuild/refs/heads/main/Functions.Lua"))()

local TYPES = {
	Part = 0,
	WedgePart = 1,
	CornerWedgePart = 2,
	VehicleSeat = 3,
	Seat = 4,
	TrussPart = 5,
	SpecialMesh = 6,
	Texture = 7,
	Decal = 8,
	PointLight = 9,
	SpotLight = 10,
	SurfaceLight = 11,
	Smoke = 12,
	Fire = 13,
	Sparkles = 14,
	Model = 15,
	Folder = 18
}

local PART_TYPE_MAP = {
	[TYPES.Part] = "Block",
	[TYPES.WedgePart] = "Wedge",
	[TYPES.CornerWedgePart] = "CornerWedge",
	[TYPES.VehicleSeat] = "Vehicle Seat",
	[TYPES.Seat] = "Seat",
	[TYPES.TrussPart] = "Truss"
}

local PART_SHAPE_MAP = {
	[0] = "Ball",
	[1] = "Block",
	[2] = "Cylinder",
	[3] = "Wedge"
}

local NORMAL_ID_MAP = {
	[0] = Enum.NormalId.Right,
	[1] = Enum.NormalId.Top,
	[2] = Enum.NormalId.Back,
	[3] = Enum.NormalId.Left,
	[4] = Enum.NormalId.Bottom,
	[5] = Enum.NormalId.Front
}

local EXPORT_BASE_URL = "http://www.f3xteam.com/bt/export/%s"
local SUPPORTED_VERSION = 3

local Utils = {}

function Utils.GetNumberFromString(str)
	local number = str:match("%d+")
	return number and tonumber(number) or nil
end

function Utils.GetNormalIdFromIndex(index)
	return NORMAL_ID_MAP[index]
end

function Utils.FindTableOccurrence(haystack, needle)
	for index, value in pairs(haystack) do
		if value == needle then
			return index
		end
	end
	return nil
end

function Utils.Slice(tbl, startIdx, endIdx)
	local slice = {}
	for i = startIdx, endIdx do
		table.insert(slice, tbl[i])
	end
	return slice
end

function Utils.ToVector3(x, y, z)
	return Vector3.new(x or 0, y or 0, z or 0)
end

function Utils.ToCFrame(cframeData)
	if typeof(cframeData) == "CFrame" then
		return cframeData
	end
	return CFrame.new(unpack(cframeData))
end

function Utils.ToColor3(r, g, b)
	return Color3.new(r or 1, g or 1, b or 1)
end

local HttpService = game:GetService("HttpService")

local function FetchCreationData(creationId)
	local success, result = pcall(function()
		local response = game:HttpGet(EXPORT_BASE_URL:format(creationId))
		return HttpService:JSONDecode(response)
	end)

	if success and result then
		return result
	else
		return nil
	end
end

local function DeterminePartType(datum)
	local baseType = datum[1]
	local partType = PART_TYPE_MAP[baseType] or "Block"

	if baseType == TYPES.Part and datum[33] then
		partType = PART_SHAPE_MAP[datum[33]] or partType
	end

	return partType
end

local function CreatePartFromData(datum, index, instances, effectData)
	local partType = DeterminePartType(datum)
	local cframe = Utils.ToCFrame(Utils.Slice(datum, 7, 18))
	local item = BtoolsFunctions.CreatePart(cframe, partType, false)

	if not item then
		return nil
	end

	local size = Utils.ToVector3(unpack(Utils.Slice(datum, 4, 6)))
	BtoolsFunctions.Resize(item, size, cframe)

	local color = Utils.ToColor3(datum[19], datum[20], datum[21])
	BtoolsFunctions.Color(item, color)

	local material = Enum.Material:FromValue(datum[22]) or Enum.Material.Plastic
	BtoolsFunctions.Material(item, material)

	BtoolsFunctions.SetCollision(item, datum[24] == 1)
	BtoolsFunctions.SetTransparency(item, datum[26])

	instances[index] = item

	if effectData then
		BtoolsFunctions.SetLightBrightness(item, effectData[4])
		BtoolsFunctions.SetLightRange(item, effectData[10])
	end

	return item
end

local function PreprocessEffects(items)
	local effectsMap = {}

	for index, datum in ipairs(items) do
		local itemType = datum[1]

		if itemType == TYPES.PointLight then
			local targetIndex = datum[2]
			local brightness = datum[4]

			if not effectsMap[targetIndex] or brightness > effectsMap[targetIndex][4] then
				effectsMap[targetIndex] = datum
			end
		end
	end

	return effectsMap
end

function ImportModule.Import(importCode, delayPerPart, onProgressCallback)
	importCode = importCode or "----"
	delayPerPart = delayPerPart or 0.03
	delayPerPart = math.max(delayPerPart, 0.01)

	local data = FetchCreationData(importCode)
	if not data then
		return nil
	end

	if data.Version ~= SUPPORTED_VERSION then
		return nil
	end

	local effectsMap = PreprocessEffects(data.Items)
	local instances = {}
	local totalItems = #data.Items
	local processedParts = 0

	task.wait(1 + delayPerPart)

	for index, datum in ipairs(data.Items) do
		local itemType = datum[1]

		if itemType == TYPES.Part or itemType == TYPES.WedgePart or itemType == TYPES.CornerWedgePart then
			CreatePartFromData(datum, index, instances, effectsMap)
			processedParts = processedParts + 1

			if onProgressCallback then
				onProgressCallback(processedParts, totalItems)
			end
		end
	end

	return instances
end

return ImportModule
