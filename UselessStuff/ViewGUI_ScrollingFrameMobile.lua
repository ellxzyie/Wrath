--ViewGUI_Mobile
local UselessGUI = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local CloseButton = Instance.new("TextButton")

UselessGUI.Name = "UselessGUI"
UselessGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
UselessGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = UselessGUI
Frame.Active = true
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.411699772, 0, 0.402610451, 0)
Frame.Size = UDim2.new(0, 303, 0, 181)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.338002205, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 95, 0, 23)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "ViewGUI"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 30.000

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(122, 122, 122)
ScrollingFrame.Position = UDim2.new(-0.00215999992, 0, 0.125461221, 0)
ScrollingFrame.Size = UDim2.new(0, 303, 0, 158)
ScrollingFrame.ScrollBarThickness = 6

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 60, 0, 60)

CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.886961877, 0, 0.0110497242, 0)
CloseButton.Size = UDim2.new(0, 31, 0, 20)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.TextSize = 20.000

--Frame
local script = Instance.new('LocalScript', Frame)


script.Parent.Draggable = true
--Scrolling frame
local script = Instance.new('LocalScript', ScrollingFrame)

local function populatePlayerList()
	for _, button in ipairs(ScrollingFrame:GetChildren()) do
		if button:IsA("TextButton") then
			button:Destroy()
		end
	end


	local players = game.Players:GetPlayers()


	for _, player in ipairs(players) do
		local button = Instance.new("TextButton")
		button.Name = player.Name
		button.Parent = ScrollingFrame
		button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		button.Size = UDim2.new(1, 0, 0, 60)
		button.Font = Enum.Font.SourceSans
		button.Text = player.DisplayName
		button.TextColor3 = Color3.fromRGB(0, 0, 0)
		button.TextSize = 16
		button.TextScaled = true

		local usernameLabel = Instance.new("TextLabel")
		usernameLabel.Name = "UsernameLabel"
		usernameLabel.Parent = button
		usernameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		usernameLabel.Position = UDim2.new(0, 0, 0.01, 0)
		usernameLabel.Size = UDim2.new(1, 0, 0, 20)
		usernameLabel.Font = Enum.Font.SourceSans
		usernameLabel.Text = player.Name
		usernameLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		usernameLabel.TextSize = 16
		usernameLabel.TextYAlignment = Enum.TextYAlignment.Top
		usernameLabel.TextScaled = true

		button.MouseButton1Click:Connect(function()
			local camera = game.Workspace.CurrentCamera
			camera.CameraSubject = player.Character
			camera.CameraType = Enum.CameraType.Follow
		end)
	end
end

populatePlayerList()

game.Players.PlayerRemoving:Connect(populatePlayerList)
--Closebutton
local script = Instance.new('LocalScript', CloseButton)

local frame = script.Parent.Parent 

local function deleteGUI()
	frame.Parent:Destroy() 
end

script.Parent.MouseButton1Click:Connect(deleteGUI)
