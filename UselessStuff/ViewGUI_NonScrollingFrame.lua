local ViewGUI = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Playername = Instance.new("TextLabel")
local PrevPlayer = Instance.new("TextButton")
local NextPlayer = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

ViewGUI.Name = "ViewGUI"
ViewGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ViewGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ViewGUI
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(131, 131, 131)
Frame.Position = UDim2.new(0.285340309, 0, 0.847389579, 0)
Frame.Size = UDim2.new(0, 327, 0, 40)

Playername.Name = "Playername"
Playername.Parent = Frame
Playername.BackgroundColor3 = Color3.fromRGB(17, 255, 0)
Playername.Position = UDim2.new(0.193946108, 0, 0.0250000004, 0)
Playername.Size = UDim2.new(0, 202, 0, 39)
Playername.Font = Enum.Font.SourceSans
Playername.Text = "Playername"
Playername.TextColor3 = Color3.fromRGB(0, 0, 0)
Playername.TextScaled = true
Playername.TextSize = 14.000
Playername.TextWrapped = true

PrevPlayer.Name = "PrevPlayer"
PrevPlayer.Parent = Frame
PrevPlayer.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
PrevPlayer.Position = UDim2.new(0, 0, 0.0250000004, 0)
PrevPlayer.Size = UDim2.new(0, 62, 0, 39)
PrevPlayer.Font = Enum.Font.SourceSans
PrevPlayer.Text = "<"
PrevPlayer.TextColor3 = Color3.fromRGB(0, 0, 0)
PrevPlayer.TextScaled = true
PrevPlayer.TextSize = 14.000
PrevPlayer.TextWrapped = true

NextPlayer.Name = "NextPlayer"
NextPlayer.Parent = Frame
NextPlayer.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
NextPlayer.Position = UDim2.new(0.810397565, 0, 0.0250000004, 0)
NextPlayer.Size = UDim2.new(0, 62, 0, 39)
NextPlayer.Font = Enum.Font.SourceSans
NextPlayer.Text = ">"
NextPlayer.TextColor3 = Color3.fromRGB(0, 0, 0)
NextPlayer.TextScaled = true
NextPlayer.TextSize = 14.000
NextPlayer.TextWrapped = true

CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.195718661, 0, 1, 0)
CloseButton.Size = UDim2.new(0, 200, 0, 19)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "Close GUI"
CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.TextScaled = true
CloseButton.TextSize = 14.000
CloseButton.TextWrapped = true

local players = game.Players:GetPlayers()
local currentPlayerIndex = 1

local function updatePlayer()
	if currentPlayerIndex > 0 and currentPlayerIndex <= #players then
		Playername.Text = players[currentPlayerIndex].Name
		workspace.CurrentCamera.CameraSubject = players[currentPlayerIndex].Character.Humanoid
	else
		Playername.Text = "No Player"
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	end
end

local function previousPlayer()
	currentPlayerIndex = currentPlayerIndex - 1
	if currentPlayerIndex < 1 then
		currentPlayerIndex = #players
	end
	updatePlayer()
end

local function nextPlayer()
	currentPlayerIndex = currentPlayerIndex + 1
	if currentPlayerIndex > #players then
		currentPlayerIndex = 1
	end
	updatePlayer()
end

PrevPlayer.MouseButton1Click:Connect(previousPlayer)
NextPlayer.MouseButton1Click:Connect(nextPlayer)

local script = Instance.new('LocalScript', Frame)
script.Parent.Draggable = true

local script = Instance.new('LocalScript', CloseButton)
local frame = script.Parent.Parent

local function deleteGUI()
	frame.Parent:Destroy()
end

script.Parent.MouseButton1Click:Connect(deleteGUI)

updatePlayer()

local function onPlayerRemoving(player)
	for i, p in ipairs(players) do
		if p == player then
			table.remove(players, i)
			if i <= currentPlayerIndex then
				currentPlayerIndex = currentPlayerIndex - 1
			end
			break
		end
	end
	updatePlayer()
end

game.Players.PlayerRemoving:Connect(onPlayerRemoving)
