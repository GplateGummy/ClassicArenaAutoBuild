local ScreenGui = Instance.new("ScreenGui")
ScreenGui.IgnoreGuiInset = true
ScreenGui.Enabled = true

local ModelImportModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/GplateGummy/ClassicArenaAutoBuild/refs/heads/main/ModelImportModule.Lua"))()
local F3xImportModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/GplateGummy/ClassicArenaAutoBuild/refs/heads/main/F3xImportModule.Lua"))()

local Frame = Instance.new("Frame")
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.8, 0, 0.5, 0)
Frame.Size = UDim2.new(0.2, 0, 0.4, 0)
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 1)

local TextLabel = Instance.new("TextLabel")
TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
TextLabel.Text = "Classic arena auto build"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextWrapped = true
TextLabel.TextYAlignment = Enum.TextYAlignment.Top
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 0.07, 0)

local UIStroke = Instance.new("UIStroke")
UIStroke.Transparency = 0.8

local buildButton = Instance.new("TextButton")
buildButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
buildButton.Text = "BUILD"
buildButton.TextColor3 = Color3.fromRGB(255, 255, 255)
buildButton.TextScaled = true
buildButton.TextWrapped = true
buildButton.Active = true
buildButton.AnchorPoint = Vector2.new(0.5, 0.5)
buildButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
buildButton.BorderSizePixel = 0
buildButton.Position = UDim2.new(0.5, 0, 0.47, 0)
buildButton.Size = UDim2.new(1, -5, 0.12, -2)

local UICorner_2 = Instance.new("UICorner")
UICorner_2.CornerRadius = UDim.new(0, 1)

local UIStroke_2 = Instance.new("UIStroke")
UIStroke_2.Color = Color3.fromRGB(60, 60, 60)
UIStroke_2.Transparency = 0.8

local statusLabel = Instance.new("TextLabel")
statusLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
statusLabel.Text = "Status : Idle     Blocks : %"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextScaled = true
statusLabel.TextWrapped = true
statusLabel.AnchorPoint = Vector2.new(0.5, 0.5)
statusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
statusLabel.BorderSizePixel = 0
statusLabel.Position = UDim2.new(0.5, 0, 0.38, 0)
statusLabel.Size = UDim2.new(1, -5, 0.08, -2)

local UICorner_3 = Instance.new("UICorner")
UICorner_3.CornerRadius = UDim.new(0, 1)

local UIStroke_3 = Instance.new("UIStroke")
UIStroke_3.Color = Color3.fromRGB(20, 20, 20)
UIStroke_3.Transparency = 0.8

local inputBox = Instance.new("TextBox")
inputBox.CursorPosition = -1
inputBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
inputBox.PlaceholderText = "Input F3x Code or Model ID"
inputBox.Text = ""
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.TextScaled = true
inputBox.TextWrapped = true
inputBox.Active = true
inputBox.AnchorPoint = Vector2.new(0.5, 0.5)
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputBox.BorderSizePixel = 0
inputBox.Position = UDim2.new(0.5, 0, 0.17, 0)
inputBox.Size = UDim2.new(1, -5, 0.1, -2)

local UICorner_4 = Instance.new("UICorner")
UICorner_4.CornerRadius = UDim.new(0, 1)

local UIStroke_4 = Instance.new("UIStroke")
UIStroke_4.Color = Color3.fromRGB(20, 20, 20)
UIStroke_4.Transparency = 0.8

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 1)

local loadF3xButton = Instance.new("TextButton")
loadF3xButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
loadF3xButton.Text = "Load F3x"
loadF3xButton.TextColor3 = Color3.fromRGB(255, 255, 255)
loadF3xButton.TextScaled = true
loadF3xButton.TextWrapped = true
loadF3xButton.Active = true
loadF3xButton.AnchorPoint = Vector2.new(0.5, 0.5)
loadF3xButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
loadF3xButton.BorderSizePixel = 0
loadF3xButton.Position = UDim2.new(0.75, 0, 0.28, 0)
loadF3xButton.Size = UDim2.new(0.5, -4, 0.1, -2)
loadF3xButton.Name = "Frame"

local UICorner_5 = Instance.new("UICorner")
UICorner_5.CornerRadius = UDim.new(0, 1)

local loadF3xButtonStroke = Instance.new("UIStroke")
loadF3xButtonStroke.Color = Color3.fromRGB(0, 100, 180)
loadF3xButtonStroke.Transparency = 0.8

local loadIdButton = Instance.new("TextButton")
loadIdButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
loadIdButton.Text = "Load ID"
loadIdButton.TextColor3 = Color3.fromRGB(255, 255, 255)
loadIdButton.TextScaled = true
loadIdButton.TextWrapped = true
loadIdButton.Active = true
loadIdButton.AnchorPoint = Vector2.new(0.5, 0.5)
loadIdButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
loadIdButton.BorderSizePixel = 0
loadIdButton.Position = UDim2.new(0.25, 0, 0.28, 0)
loadIdButton.Size = UDim2.new(0.5, -4, 0.1, -2)

local UICorner_6 = Instance.new("UICorner")
UICorner_6.CornerRadius = UDim.new(0, 1)

local loadIdButtonStroke = Instance.new("UIStroke")
loadIdButtonStroke.Color = Color3.fromRGB(0, 100, 180)
loadIdButtonStroke.Transparency = 0.8

local TextLabel_2 = Instance.new("TextLabel")
TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
TextLabel_2.Text = "Made by GplateGam and justhappyguy."
TextLabel_2.TextColor3 = Color3.fromRGB(120, 120, 120)
TextLabel_2.TextScaled = true
TextLabel_2.TextWrapped = true
TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top
TextLabel_2.AnchorPoint = Vector2.new(0, 1)
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.94, 0)
TextLabel_2.Size = UDim2.new(1, 0, 0.05, 0)

local function CreateLinkCopyTextBox()
	local Frame2 = Instance.new("Frame")
	Frame2.Active = true
	Frame2.ZIndex = 1000
	Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Frame2.BorderSizePixel = 0
	Frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame2.Size = UDim2.new(0.15, 0, 0.05, 0)
	Frame2.Parent = ScreenGui

	local TextBox = Instance.new("TextBox")
	TextBox.ZIndex = 1001
	TextBox.ClearTextOnFocus = false
	TextBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	TextBox.Text = "https://github.com/GplateGummy/ClassicArenaAutoBuild/blob/main/README.md"
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextEditable = false
	TextBox.TextScaled = false
	TextBox.TextWrapped = true
	TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BackgroundTransparency = 0.95
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextBox.Size = UDim2.new(1, -6, 1, -6)
	TextBox.Parent = Frame2

	task.wait(5.5)
	Frame2:Destroy()
end

local LinkButton = Instance.new("TextButton")
LinkButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
LinkButton.Text = "Open Source! Click this!"
LinkButton.TextColor3 = Color3.fromRGB(0, 85, 255)
LinkButton.TextScaled = true
LinkButton.TextWrapped = true
LinkButton.TextYAlignment = Enum.TextYAlignment.Top
LinkButton.AnchorPoint = Vector2.new(0, 1)
LinkButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LinkButton.BackgroundTransparency = 1
LinkButton.BorderSizePixel = 0
LinkButton.Position = UDim2.new(0, 0, 1, 0)
LinkButton.Size = UDim2.new(1, 0, 0.05, 0)

local Debounce = false

LinkButton.MouseButton1Click:Connect(function()
	if Debounce then return end
	Debounce = true
	CreateLinkCopyTextBox()
	Debounce = false
end)

ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
Frame.Parent = ScreenGui
UICorner.Parent = Frame
TextLabel.Parent = Frame
UIStroke.Parent = Frame
buildButton.Parent = Frame
UICorner_2.Parent = buildButton
UIStroke_2.Parent = buildButton
statusLabel.Parent = Frame
UICorner_3.Parent = statusLabel
UIStroke_3.Parent = statusLabel
inputBox.Parent = Frame
UICorner_4.Parent = inputBox
UIStroke_4.Parent = inputBox
UIPadding.Parent = inputBox
loadF3xButton.Parent = Frame
UICorner_5.Parent = loadF3xButton
loadF3xButtonStroke.Parent = loadF3xButton
loadIdButton.Parent = Frame
UICorner_6.Parent = loadIdButton
loadIdButtonStroke.Parent = loadIdButton
TextLabel_2.Parent = Frame
LinkButton.Parent = Frame

local currentImportType = nil
local isBuilding = false
local validatedInput = nil

local function updateStatus(status, remaining, total)
	if remaining and total then
		local percentage = math.floor((remaining / total) * 100)
		statusLabel.Text = string.format("Status : %s     Blocks : %d%%", status, percentage)
	else
		statusLabel.Text = string.format("Status : %s     Blocks : %%", status)
	end
end

local function onProgressCallback(processed, total)
	local remaining = total - processed
	updateStatus("Building", remaining, total)
end

local function normalizeInput(text)
	return text:gsub("[\t ]", "")
end

local function validateF3xCode(input)
	local normalized = normalizeInput(input):lower()

	if #normalized ~= 4 then
		return nil
	end

	if not normalized:match("^[a-z0-9]+$") then
		return nil
	end

	return normalized
end

local function validateModelId(input)
	local normalized = normalizeInput(input)
	normalized = normalized:gsub("[^0-9]", "")

	if #normalized < 1 or #normalized > 30 then
		return nil
	end

	return normalized
end

loadIdButton.MouseButton1Click:Connect(function()
	if isBuilding then return end

	local input = inputBox.Text
	if input == "" then
		updateStatus("No ID entered", nil, nil)
		return
	end

	inputBox.Text = normalizeInput(input)

	local validated = validateModelId(inputBox.Text)
	if not validated then
		updateStatus("Invalid Model ID", nil, nil)
		return
	end

	validatedInput = validated
	currentImportType = "ModelID"
	loadIdButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
	loadIdButtonStroke.Color = Color3.fromRGB(0, 180, 90)
	loadF3xButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
	loadF3xButtonStroke.Color = Color3.fromRGB(0, 100, 180)
	updateStatus("Model ID Loaded", nil, nil)
end)

loadF3xButton.MouseButton1Click:Connect(function()
	if isBuilding then return end

	local input = inputBox.Text
	if input == "" then
		updateStatus("No code entered", nil, nil)
		return
	end

	inputBox.Text = normalizeInput(input)

	local validated = validateF3xCode(inputBox.Text)
	if not validated then
		updateStatus("Invalid F3x Code", nil, nil)
		return
	end

	validatedInput = validated
	currentImportType = "F3x"
	loadF3xButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
	loadF3xButtonStroke.Color = Color3.fromRGB(0, 180, 90)
	loadIdButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
	loadIdButtonStroke.Color = Color3.fromRGB(0, 100, 180)
	updateStatus("F3x Code Loaded", nil, nil)
end)

buildButton.MouseButton1Click:Connect(function()
	if isBuilding then return end
	if not currentImportType or not validatedInput then
		updateStatus("Load ID or F3x first", nil, nil)
		return
	end

	isBuilding = true
	buildButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	buildButton.Text = "BUILDING..."
	updateStatus("Starting", nil, nil)

	task.spawn(function()
		if currentImportType == "ModelID" then
			ModelImportModule.Import(validatedInput, 0.03, onProgressCallback)
		elseif currentImportType == "F3x" then
			F3xImportModule.Import(validatedInput, 0.03, onProgressCallback)
		end

		isBuilding = false
		buildButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		buildButton.Text = "BUILD"
		updateStatus("Complete", nil, nil)

		task.wait(2)
		
		if not isBuilding then
			updateStatus("Idle", nil, nil)
		end
	end)
end)

updateStatus("Idle", nil, nil)
