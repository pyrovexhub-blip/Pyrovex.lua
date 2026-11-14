
--==================================================
-- PYROVEX HUB - ADVANCED TOP LOADING EFFECT
-- BLUE x RED x BLACK x PURPLE
-- 5 SECONDS | PREMIUM ANIMATED LOADER
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local LogoAsset = "rbxthumb://type=Asset&id=97950138094007&w=420&h=420"

local Old = PlayerGui:FindFirstChild("PyrovexTopLoader")
if Old then Old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PyrovexTopLoader"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local function New(class,props,parent)
    local object = Instance.new(class)

    for property,value in pairs(props or {}) do
        object[property] = value
    end

    object.Parent = parent
    return object
end

local function Tween(obj,properties,duration,style,direction)
    local tween = TweenService:Create(
        obj,
        TweenInfo.new(
            duration or 0.25,
            style or Enum.EasingStyle.Quart,
            direction or Enum.EasingDirection.Out
        ),
        properties
    )

    tween:Play()
    return tween
end

local Main = New("Frame",{
    Name = "LoadingContainer",
    Size = UDim2.fromOffset(340,62),
    Position = UDim2.new(0.5,0,0,-85),
    AnchorPoint = Vector2.new(0.5,0),
    BackgroundColor3 = Color3.fromRGB(10,12,23),
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 10
},ScreenGui)

New("UICorner",{
    CornerRadius = UDim.new(0,13)
},Main)

local MainStroke = New("UIStroke",{
    Color = Color3.fromRGB(90,105,210),
    Thickness = 1.3,
    Transparency = 0.1
},Main)

New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(12,18,35)),
        ColorSequenceKeypoint.new(0.5,Color3.fromRGB(15,12,28)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(28,12,25))
    }),
    Rotation = 15
},Main)

-- OUTER GLOW

local Glow = New("Frame",{
    Name = "Glow",
    Size = UDim2.new(1,-12,0,2),
    Position = UDim2.fromOffset(6,0),
    BackgroundColor3 = Color3.fromRGB(80,120,255),
    BorderSizePixel = 0,
    ZIndex = 12
},Main)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Glow)

New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(0,130,255)),
        ColorSequenceKeypoint.new(0.35,Color3.fromRGB(120,65,255)),
        ColorSequenceKeypoint.new(0.7,Color3.fromRGB(230,45,100)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(255,65,65))
    })
},Glow)

-- SETTINGS EMOJI

local Settings = New("TextLabel",{
    Name = "SettingsIcon",
    Size = UDim2.fromOffset(32,32),
    Position = UDim2.fromOffset(11,10),
    BackgroundTransparency = 1,
    Text = "⚙️",
    TextSize = 24,
    Font = Enum.Font.GothamBold,
    TextColor3 = Color3.fromRGB(255,255,255),
    ZIndex = 15
},Main)

task.spawn(function()
    while ScreenGui.Parent and Settings.Parent do
        local rotate = Tween(
            Settings,
            {Rotation = Settings.Rotation + 360},
            1.35,
            Enum.EasingStyle.Linear
        )

        rotate.Completed:Wait()
    end
end)

-- TITLE

local Title = New("TextLabel",{
    Name = "Title",
    Position = UDim2.fromOffset(51,8),
    Size = UDim2.new(1,-115,0,17),
    BackgroundTransparency = 1,
    Text = "PYROVEX HUB",
    TextColor3 = Color3.fromRGB(245,248,255),
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBlack,
    ZIndex = 15
},Main)

-- STATUS

local Status = New("TextLabel",{
    Name = "Status",
    Position = UDim2.fromOffset(51,25),
    Size = UDim2.new(1,-105,0,15),
    BackgroundTransparency = 1,
    Text = "Initializing loader...",
    TextColor3 = Color3.fromRGB(150,165,195),
    TextSize = 8,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamMedium,
    ZIndex = 15
},Main)

-- PERCENTAGE

local Percentage = New("TextLabel",{
    Name = "Percentage",
    Position = UDim2.new(1,-54,0,24),
    Size = UDim2.fromOffset(43,16),
    BackgroundTransparency = 1,
    Text = "0%",
    TextColor3 = Color3.fromRGB(150,190,255),
    TextSize = 9,
    TextXAlignment = Enum.TextXAlignment.Right,
    Font = Enum.Font.GothamBold,
    ZIndex = 15
},Main)

-- PROGRESS BACKGROUND

local BarBG = New("Frame",{
    Name = "ProgressBackground",
    Size = UDim2.new(1,-22,0,5),
    Position = UDim2.fromOffset(11,48),
    BackgroundColor3 = Color3.fromRGB(32,35,53),
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 15
},Main)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},BarBG)

-- PROGRESS BAR

local Bar = New("Frame",{
    Name = "ProgressBar",
    Size = UDim2.new(0,0,1,0),
    BackgroundColor3 = Color3.fromRGB(50,130,255),
    BorderSizePixel = 0,
    ZIndex = 16
},BarBG)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Bar)

local BarGradient = New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(0,145,255)),
        ColorSequenceKeypoint.new(0.35,Color3.fromRGB(100,80,255)),
        ColorSequenceKeypoint.new(0.7,Color3.fromRGB(190,55,160)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(255,55,70))
    }),
    Rotation = 0
},Bar)

-- MOVING SHINE

local Shine = New("Frame",{
    Name = "ProgressShine",
    Size = UDim2.new(0,45,1,0),
    Position = UDim2.new(0,0,0,0),
    BackgroundColor3 = Color3.fromRGB(255,255,255),
    BackgroundTransparency = 0.55,
    BorderSizePixel = 0,
    ZIndex = 17
},Bar)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Shine)

New("UIGradient",{
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0,1),
        NumberSequenceKeypoint.new(0.5,0),
        NumberSequenceKeypoint.new(1,1)
    })
},Shine)

-- LOADING ENTRANCE

Tween(
    Main,
    {Position = UDim2.new(0.5,0,0,12)},
    0.75,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

-- BORDER ANIMATION

task.spawn(function()
    while ScreenGui.Parent do
        Tween(MainStroke,{
            Transparency = 0.55,
            Color = Color3.fromRGB(180,65,160)
        },0.8)

        task.wait(0.8)

        if not ScreenGui.Parent then break end

        Tween(MainStroke,{
            Transparency = 0.1,
            Color = Color3.fromRGB(70,145,255)
        },0.8)

        task.wait(0.8)
    end
end)

-- SHINE ANIMATION

task.spawn(function()
    while ScreenGui.Parent and Shine.Parent do
        Shine.Position = UDim2.new(0,-45,0,0)

        local shineTween = Tween(
            Shine,
            {Position = UDim2.new(1,0,0,0)},
            0.75,
            Enum.EasingStyle.Linear
        )

        shineTween.Completed:Wait()
        task.wait(0.12)
    end
end)

-- LOADING STATUS

local LoadingMessages = {
    {Time = 0, Text = "Initializing Pyrovex Hub..."},
    {Time = 1, Text = "Preparing loader interface..."},
    {Time = 2, Text = "Loading script collection..."},
    {Time = 3, Text = "Setting up components..."},
    {Time = 4, Text = "Almost ready..."}
}

for _,message in ipairs(LoadingMessages) do
    task.delay(message.Time,function()
        if not ScreenGui.Parent then return end

        Tween(Status,{
            TextTransparency = 1
        },0.15)

        task.wait(0.15)

        if not ScreenGui.Parent then return end

        Status.Text = message.Text

        Tween(Status,{
            TextTransparency = 0
        },0.2)
    end)
end

-- EXACT 5 SECOND PROGRESS

local StartTime = os.clock()
local Duration = 5

local Progress = Tween(
    Bar,
    {Size = UDim2.new(1,0,1,0)},
    Duration,
    Enum.EasingStyle.Linear
)

Progress:Play()

while os.clock() - StartTime < Duration do
    if not ScreenGui.Parent then return end

    local elapsed = os.clock() - StartTime
    local percent = math.clamp(math.floor((elapsed / Duration) * 100),0,100)

    Percentage.Text = percent.."%"

    task.wait(0.04)
end

Percentage.Text = "100%"
Status.Text = "Pyrovex Hub is ready!"

-- FINISH EFFECT

Tween(MainStroke,{
    Color = Color3.fromRGB(80,220,160),
    Transparency = 0
},0.2)

Tween(Bar,{
    BackgroundColor3 = Color3.fromRGB(60,220,150)
},0.2)

task.wait(0.25)

-- LOADING EXIT

Tween(Main,{
    Position = UDim2.new(0.5,0,0,-85),
    BackgroundTransparency = 1
},0.65,Enum.EasingStyle.Quint,Enum.EasingDirection.In)

Tween(Settings,{TextTransparency = 1},0.35)
Tween(Title,{TextTransparency = 1},0.35)
Tween(Status,{TextTransparency = 1},0.35)
Tween(Percentage,{TextTransparency = 1},0.35)
Tween(BarBG,{BackgroundTransparency = 1},0.35)
Tween(Glow,{BackgroundTransparency = 1},0.35)

task.wait(0.7)

if ScreenGui then
    ScreenGui:Destroy()
end

local GrowAGarden_PlaceID = 126884695634066

if game.PlaceId ~= GrowAGarden_PlaceID then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "PYROVEX HUB",
        Text = "Exclusive to Grow a Garden!",
        Duration = 5
    })

    return
end

--==================================================
-- PYROVEX HUB | PREMIUM UI + TOKEN SPOOFER
-- VERSION: 1.0 — FULLY COMBINED & FIXED
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local ContentProvider = game:GetService("ContentProvider")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- SETTINGS
--==================================================

local ValidKeys = {
	["103958274619385"] = true,
	["482957103629485"] = true,
	["827461935082746"] = true,
	["395827461059283"] = true,
	["741958263047182"] = true,
	["582947103628471"] = true,
	["519384726105839"] = true
}

local DiscordLink = "https://discord.gg/fUWAW9vB4"

local PRIMARY_IMAGE = "rbxasset://textures/ui/common/robux@3x.png"
local FALLBACK_IMAGE = "rbxassetid://18469541748"

local Purple = Color3.fromRGB(135, 75, 255)
local Crimson = Color3.fromRGB(235, 55, 105)
local Blue = Color3.fromRGB(70, 115, 255)

local Dark = Color3.fromRGB(10, 8, 18)
local PanelDark = Color3.fromRGB(20, 16, 32)
local CardDark = Color3.fromRGB(29, 23, 44)

local White = Color3.fromRGB(250, 247, 255)
local Muted = Color3.fromRGB(155, 146, 174)
local Green = Color3.fromRGB(90, 230, 145)

local FastTween = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local SmoothTween = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local PopTween = TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

--==================================================
-- PARENT
--==================================================

local ParentGui = (gethui and gethui()) or CoreGui

pcall(function()
	local Old = ParentGui:FindFirstChild("PyrovexTokenSpawner")
	if Old then Old:Destroy() end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PyrovexTokenSpawner"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function() ScreenGui.Parent = ParentGui end)
if not ScreenGui.Parent then ScreenGui.Parent = PlayerGui end

--==================================================
-- HELPERS
--==================================================

local function Tween(Object, Info, Properties)
	local Animation = TweenService:Create(Object, Info, Properties)
	Animation:Play()
	return Animation
end

local function Corner(Object, Radius)
	local C = Instance.new("UICorner")
	C.CornerRadius = UDim.new(0, Radius)
	C.Parent = Object
	return C
end

local function Stroke(Object, Color, Thickness, Transparency)
	local S = Instance.new("UIStroke")
	S.Color = Color or Purple
	S.Thickness = Thickness or 1
	S.Transparency = Transparency or 0
	S.Parent = Object
	return S
end

local function Gradient(Object, Colors, Rotation)
	local G = Instance.new("UIGradient")
	G.Color = ColorSequence.new(Colors)
	G.Rotation = Rotation or 0
	G.Parent = Object
	return G
end

local function AddAnimatedBorder(Object)
	local S = Stroke(Object, Purple, 1.7, 0.1)
	local G = Gradient(S, {
		ColorSequenceKeypoint.new(0, Purple),
		ColorSequenceKeypoint.new(0.5, Crimson),
		ColorSequenceKeypoint.new(1, Blue)
	}, 0)
	task.spawn(function()
		while Object.Parent and G.Parent do
			G.Rotation = (G.Rotation + 1) % 360
			task.wait(0.025)
		end
	end)
	return S
end

local function FormatNumber(Number)
	Number = tonumber(Number) or 0
	local Text = tostring(math.floor(Number))
	while true do
		local Updated, Count = string.gsub(Text, "^(-?%d+)(%d%d%d)", "%1,%2")
		Text = Updated
		if Count == 0 then break end
	end
	return Text
end
local fCom = FormatNumber

local function CreateLabel(Parent, Text, Size, Position, TextSize, Color, Font)
	local Label = Instance.new("TextLabel")
	Label.Size = Size
	Label.Position = Position
	Label.BackgroundTransparency = 1
	Label.Text = Text
	Label.TextColor3 = Color or White
	Label.Font = Font or Enum.Font.Gotham
	Label.TextSize = TextSize or 12
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = Parent
	return Label
end

local function CreateButton(Parent, Text, Size, Position, Color)
	local Button = Instance.new("TextButton")
	Button.Size = Size
	Button.Position = Position
	Button.BackgroundColor3 = Color or CardDark
	Button.Text = Text
	Button.TextColor3 = White
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 11
	Button.AutoButtonColor = false
	Button.Parent = Parent
	Corner(Button, 9)
	local Scale = Instance.new("UIScale")
	Scale.Parent = Button
	Button.MouseEnter:Connect(function() Tween(Scale, FastTween, {Scale = 1.025}) end)
	Button.MouseLeave:Connect(function() Tween(Scale, FastTween, {Scale = 1}) end)
	Button.MouseButton1Down:Connect(function() Tween(Scale, FastTween, {Scale = 0.97}) end)
	Button.MouseButton1Up:Connect(function() Tween(Scale, FastTween, {Scale = 1}) end)
	return Button
end

--==================================================
-- PROFILE
--==================================================

local function CreateProfile(Parent, Position, Size)
	local Card = Instance.new("Frame")
	Card.Size = Size
	Card.Position = Position
	Card.BackgroundColor3 = CardDark
	Card.BorderSizePixel = 0
	Card.Parent = Parent
	Corner(Card, 11)
	Stroke(Card, Purple, 1, 0.55)

	local Avatar = Instance.new("ImageLabel")
	Avatar.Size = UDim2.fromOffset(43, 43)
	Avatar.Position = UDim2.fromOffset(10, 9)
	Avatar.BackgroundColor3 = PanelDark
	Avatar.Parent = Card
	Corner(Avatar, 50)

	task.spawn(function()
		local Success, Image = pcall(function()
			return Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
		end)
		if Success and Avatar.Parent then Avatar.Image = Image end
	end)

	CreateLabel(Card, Player.DisplayName, UDim2.new(1, -70, 0, 22), UDim2.fromOffset(62, 12), 12, White, Enum.Font.GothamBold)
	CreateLabel(Card, "@" .. Player.Name, UDim2.new(1, -70, 0, 17), UDim2.fromOffset(62, 34), 10, Muted)

	local Online = Instance.new("Frame")
	Online.Size = UDim2.fromOffset(7, 7)
	Online.Position = UDim2.new(1, -17, 0, 12)
	Online.BackgroundColor3 = Green
	Online.BorderSizePixel = 0
	Online.Parent = Card
	Corner(Online, 50)

	return Card
end

--==================================================
-- DRAG FUNCTION
--==================================================

local function MakeDraggable(Handle, Target, OnTap)
	local Dragging = false
	local DragInput, DragStart, StartPosition, Moved = nil, nil, nil, false

	Handle.InputBegan:Connect(function(Input)
		if Input.UserInputType ~= Enum.UserInputType.MouseButton1
		and Input.UserInputType ~= Enum.UserInputType.Touch then return end
		Dragging = true
		Moved = false
		DragStart = Input.Position
		StartPosition = Target.Position

		local EndConnection
		EndConnection = Input.Changed:Connect(function()
			if Input.UserInputState == Enum.UserInputState.End then
				Dragging = false
				if EndConnection then EndConnection:Disconnect() end
				if not Moved and OnTap then OnTap() end
			end
		end)
	end)

	Handle.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement
		or Input.UserInputType == Enum.UserInputType.Touch then
			DragInput = Input
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Dragging and (Input == DragInput or Input.UserInputType == Enum.UserInputType.MouseMovement) then
			local Delta = Input.Position - DragStart
			if math.abs(Delta.X) > 5 or math.abs(Delta.Y) > 5 then Moved = true end
			Target.Position = UDim2.new(
				StartPosition.X.Scale, StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y
			)
		end
	end)
end

--==================================================
-- KEY SYSTEM
--==================================================

local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeySystem"
KeyFrame.Size = UDim2.fromOffset(320, 270)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -135)
KeyFrame.BackgroundColor3 = Dark
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = ScreenGui
Corner(KeyFrame, 15)
AddAnimatedBorder(KeyFrame)
Gradient(KeyFrame, {
	ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 15, 52)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 10, 27))
}, 45)

local KeyScale = Instance.new("UIScale")
KeyScale.Scale = 0.8
KeyScale.Parent = KeyFrame

local KeyHeader = Instance.new("Frame")
KeyHeader.Size = UDim2.new(1, 0, 0, 49)
KeyHeader.BackgroundTransparency = 1
KeyHeader.Parent = KeyFrame

local KeyLogo = CreateButton(KeyHeader, "P", UDim2.fromOffset(32, 32), UDim2.fromOffset(13, 8), Purple)
KeyLogo.TextSize = 20
Gradient(KeyLogo, {ColorSequenceKeypoint.new(0, Purple), ColorSequenceKeypoint.new(1, Crimson)}, 45)

CreateLabel(KeyHeader, "PYROVEX HUB", UDim2.new(1, -100, 0, 21), UDim2.fromOffset(54, 8), 14, White, Enum.Font.GothamBold)
CreateLabel(KeyHeader, "SECURE KEY VERIFICATION", UDim2.new(1, -100, 0, 14), UDim2.fromOffset(55, 27), 8, Muted)

local KeyClose = CreateButton(KeyHeader, "×", UDim2.fromOffset(27, 27), UDim2.new(1, -39, 0, 10), Color3.fromRGB(90, 28, 48))
KeyClose.TextSize = 18
KeyClose.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

CreateProfile(KeyFrame, UDim2.fromOffset(15, 58), UDim2.fromOffset(290, 61))
CreateLabel(KeyFrame, "ACCESS KEY", UDim2.fromOffset(290, 16), UDim2.fromOffset(15, 129), 9, Muted, Enum.Font.GothamBold)

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.fromOffset(290, 35)
KeyInput.Position = UDim2.fromOffset(15, 148)
KeyInput.BackgroundColor3 = PanelDark
KeyInput.PlaceholderText = "Enter your key..."
KeyInput.PlaceholderColor3 = Muted
KeyInput.Text = ""
KeyInput.TextColor3 = White
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 12
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = KeyFrame
Corner(KeyInput, 9)

local KeyStroke = Stroke(KeyInput, Purple, 1.5, 0.35)
KeyInput.Focused:Connect(function() Tween(KeyStroke, SmoothTween, {Transparency = 0}) end)
KeyInput.FocusLost:Connect(function() Tween(KeyStroke, SmoothTween, {Transparency = 0.35}) end)

local Status = CreateLabel(KeyFrame, "Enter a valid key to continue.", UDim2.fromOffset(290, 16), UDim2.fromOffset(15, 187), 9, Muted)
Status.TextXAlignment = Enum.TextXAlignment.Center

local VerifyButton = CreateButton(KeyFrame, "VERIFY KEY", UDim2.fromOffset(290, 31), UDim2.fromOffset(15, 207), Purple)
Gradient(VerifyButton, {ColorSequenceKeypoint.new(0, Purple), ColorSequenceKeypoint.new(1, Crimson)}, 0)

local DiscordButton = CreateButton(KeyFrame, "DISCORD  •  GET KEY", UDim2.fromOffset(290, 25), UDim2.fromOffset(15, 242), CardDark)

--==================================================
-- MAIN UI + SPOOFER LOGIC COMBINED
--==================================================

local function LoadMainUI()
	if not KeyFrame.Parent then return end
	KeyFrame:Destroy()

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Size = UDim2.fromOffset(450, 330)
	Main.Position = UDim2.new(0.5, -225, 0.5, -165)
	Main.BackgroundColor3 = Dark
	Main.BorderSizePixel = 0
	Main.Parent = ScreenGui
	Corner(Main, 16)
	AddAnimatedBorder(Main)
	Gradient(Main, {
		ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 15, 52)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(14, 11, 25)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(42, 12, 32))
	}, 45)

	local MainScale = Instance.new("UIScale")
	MainScale.Scale = 0.8
	MainScale.Parent = Main

	local Header = Instance.new("Frame")
	Header.Size = UDim2.new(1, 0, 0, 48)
	Header.BackgroundTransparency = 1
	Header.Parent = Main

	local Logo = CreateButton(Header, "P", UDim2.fromOffset(33, 33), UDim2.fromOffset(13, 8), Purple)
	Logo.TextSize = 21
	Gradient(Logo, {ColorSequenceKeypoint.new(0, Purple), ColorSequenceKeypoint.new(1, Crimson)}, 45)

	CreateLabel(Header, "PYROVEX HUB", UDim2.new(1, -145, 0, 21), UDim2.fromOffset(55, 8), 14, White, Enum.Font.GothamBold)
	CreateLabel(Header, "PREMIUM TOKEN INTERFACE", UDim2.new(1, -145, 0, 14), UDim2.fromOffset(56, 27), 8, Muted)

	local Close = CreateButton(Header, "×", UDim2.fromOffset(27, 27), UDim2.new(1, -38, 0, 10), Color3.fromRGB(95, 27, 49))
	Close.TextSize = 18
	Close.MouseButton1Click:Connect(function()
		_G.TokenLoopRunning = false
		ScreenGui:Destroy()
	end)

	local Minimize = CreateButton(Header, "−", UDim2.fromOffset(27, 27), UDim2.new(1, -70, 0, 10), CardDark)
	Minimize.TextSize = 19

	CreateProfile(Main, UDim2.fromOffset(15, 58), UDim2.fromOffset(195, 62))

	CreateLabel(Main, "TOKEN AMOUNT", UDim2.fromOffset(195, 17), UDim2.fromOffset(15, 130), 10, White, Enum.Font.GothamBold)

	local InputBox = Instance.new("TextBox")
	InputBox.Size = UDim2.fromOffset(195, 37)
	InputBox.Position = UDim2.fromOffset(15, 151)
	InputBox.BackgroundColor3 = PanelDark
	InputBox.PlaceholderText = "Enter amount..."
	InputBox.PlaceholderColor3 = Muted
	InputBox.Text = ""
	InputBox.TextColor3 = White
	InputBox.Font = Enum.Font.Gotham
	InputBox.TextSize = 12
	InputBox.ClearTextOnFocus = false
	InputBox.Parent = Main
	Corner(InputBox, 9)

	local InputStroke = Stroke(InputBox, Purple, 1.5, 0.4)
	InputBox.Focused:Connect(function() Tween(InputStroke, SmoothTween, {Color = Crimson, Transparency = 0}) end)
	InputBox.FocusLost:Connect(function() Tween(InputStroke, SmoothTween, {Color = Purple, Transparency = 0.4}) end)
	InputBox:GetPropertyChangedSignal("Text"):Connect(function()
		local Clean = InputBox.Text:gsub("%D", "")
		if InputBox.Text ~= Clean then InputBox.Text = Clean end
	end)

	local Apply = CreateButton(Main, "APPLY PREVIEW", UDim2.fromOffset(195, 38), UDim2.fromOffset(15, 199), Purple)
	Gradient(Apply, {ColorSequenceKeypoint.new(0, Purple), ColorSequenceKeypoint.new(1, Crimson)}, 0)

	local PreviewEnabled = false
	local PreviewAmount = 0
	local targets = {}
	local _G = _G or {}
	_G.TokenSpooferActive = false
	_G.TokenAmount = 0
	_G.TokenLoopRunning = false

	local PreviewCard = Instance.new("Frame")
	PreviewCard.Name = "VisualTokenPreview"
PreviewCard.Size = UDim2.fromOffset(195, 50)
PreviewCard.Position = UDim2.fromOffset(15, 244)
PreviewCard.BackgroundColor3 = PanelDark
PreviewCard.BorderSizePixel = 0
PreviewCard.Parent = Main
Corner(PreviewCard, 10)
Stroke(PreviewCard, Purple, 1.2, 0.35)

CreateLabel(PreviewCard, "VISUAL TOKEN PREVIEW", UDim2.fromOffset(125, 14), UDim2.fromOffset(10, 4), 8, Muted, Enum.Font.GothamBold)

local PreviewValue = CreateLabel(PreviewCard, "0", UDim2.fromOffset(105, 23), UDim2.fromOffset(10, 21), 17, White, Enum.Font.GothamBold)
local PreviewStatus = CreateLabel(PreviewCard, "PREVIEW OFF", UDim2.fromOffset(78, 15), UDim2.fromOffset(110, 29), 7, Muted, Enum.Font.GothamBold)
PreviewStatus.TextXAlignment = Enum.TextXAlignment.Right

local PreviewToggle = CreateButton(PreviewCard, "OFF", UDim2.fromOffset(42, 20), UDim2.new(1, -52, 0, 3), CardDark)
PreviewToggle.TextSize = 8
Corner(PreviewToggle, 10)
local PreviewToggleStroke = Stroke(PreviewToggle, Purple, 1, 0.35)

--==================================================
-- SCAN TARGETS FUNCTION
--==================================================

local function ScanTargets()
	targets = {}
	local function Scan(parent)
		if not parent then return end
		for _, u in ipairs(parent:GetChildren()) do
			if u:IsA("TextLabel") then
				local lt = u.Text:lower()
				local pn = u.Name:lower()
				if lt:find("tokens:") or lt:find("token:") 
				or lt:find("coins:") or lt:find("coin:")
				or pn == "tokens" or pn == "token"
				or pn == "coins" or pn == "coin" then
					table.insert(targets, u)
				elseif u.Text:find("^[%d,]+$") 
				and not pn:find("btn") 
				and not pn:find("button") then
					local gpn = u.Parent and u.Parent.Name:lower() or ""
					if gpn:find("currency") or gpn:find("balance")
					or gpn:find("main") or gpn:find("top") 
					or gpn:find("bar") or gpn:find("display") then
						table.insert(targets, u)
					end
				end
			end
			Scan(u)
		end
	end
	Scan(PlayerGui)
	print("[Pyrovex Spoofer] Scanned: Found "..#targets.." target(s)")
end

--==================================================
-- TOGGLE BUTTON LOGIC
--==================================================

PreviewToggle.MouseButton1Click:Connect(function()
	PreviewEnabled = not PreviewEnabled
	_G.TokenSpooferActive = PreviewEnabled
	
	if PreviewEnabled then
		ScanTargets()
		PreviewToggle.Text = "ON"
		Tween(PreviewToggle, FastTween, {BackgroundColor3 = Purple})
		Tween(PreviewToggleStroke, FastTween, {Color = Crimson, Transparency = 0})
		PreviewStatus.Text = "SPOOFER: ON"
		PreviewStatus.TextColor3 = Green
		print("[Pyrovex Spoofer] ACTIVE — Tokens: "..fCom(_G.TokenAmount))
	else
		PreviewToggle.Text = "OFF"
		Tween(PreviewToggle, FastTween, {BackgroundColor3 = CardDark})
		Tween(PreviewToggleStroke, FastTween, {Color = Purple, Transparency = 0.35})
		PreviewStatus.Text = "PREVIEW OFF"
		PreviewStatus.TextColor3 = Muted
		print("[Pyrovex Spoofer] DEACTIVATED")
	end
end)

--==================================================
-- APPLY BUTTON LOGIC
--==================================================

Apply.MouseButton1Click:Connect(function()
	local raw = InputBox.Text:gsub("%D", "")
	local amount = tonumber(raw) or 0
	
	if not PreviewEnabled then
		PreviewStatus.Text = "TURN ON FIRST"
		PreviewStatus.TextColor3 = Crimson
		task.delay(1.5, function()
			if PreviewStatus.Parent then
				PreviewStatus.Text = PreviewEnabled and "SPOOFER: ON" or "PREVIEW OFF"
				PreviewStatus.TextColor3 = PreviewEnabled and Green or Muted
			end
		end)
		return
	end
	
	if amount <= 0 then
		PreviewStatus.Text = "INVALID AMOUNT"
		PreviewStatus.TextColor3 = Crimson
		task.delay(1.5, function()
			if PreviewStatus.Parent then
				PreviewStatus.Text = PreviewEnabled and "SPOOFER: ON" or "PREVIEW OFF"
				PreviewStatus.TextColor3 = PreviewEnabled and Green or Muted
			end
		end)
		return
	end
	
	_G.TokenAmount = amount
	PreviewAmount = amount
	PreviewValue.Text = FormatNumber(amount)
	PreviewStatus.Text = "PREVIEW UPDATED"
	PreviewStatus.TextColor3 = Green
	
	Tween(PreviewValue, PopTween, {TextColor3 = Green})
	task.delay(0.5, function()
		if PreviewValue.Parent then
			Tween(PreviewValue, SmoothTween, {TextColor3 = White})
		end
	end)
	
	print("[Pyrovex Spoofer] Amount set: "..fCom(amount))
	task.delay(1.2, function()
		if PreviewStatus.Parent then
			PreviewStatus.Text = PreviewEnabled and "SPOOFER: ON" or "PREVIEW OFF"
			PreviewStatus.TextColor3 = PreviewEnabled and Green or Muted
		end
	end)
end)

--==================================================
-- MAIN UPDATE LOOP
--==================================================

_G.TokenLoopRunning = true
task.spawn(function()
	while _G.TokenLoopRunning and task.wait(0.15) do
		if not _G.TokenSpooferActive or _G.TokenAmount <= 0 then
			continue
		end
		
		local formatted = fCom(_G.TokenAmount)
		
		for _, u in ipairs(targets) do
			if not u:IsDescendantOf(PlayerGui) then continue end
			
			local original = u.Text
			local lower = original:lower()
			
			if lower:match("tokens?:") or lower:match("coins?:") then
				local newText = lower:gsub(
					"([a-zA-Z]+%s*:%s*)[%d%,]+",
					function(prefix)
						return prefix:gsub("^%l", string.upper) .. formatted
					end
				)
				if u.Text ~= newText then
					u.Text = newText
				end
			elseif original:find("^[%d%,]+$") then
				if u.Text ~= formatted then
					u.Text = formatted
				end
			end
		end
	end
end)

--==================================================
-- RECOMMENDED AMOUNTS PANEL
--==================================================

CreateLabel(Main, "RECOMMENDED", UDim2.fromOffset(210, 20), UDim2.fromOffset(230, 58), 12, White, Enum.Font.GothamBold)
CreateLabel(Main, "SELECT YOUR AMOUNT", UDim2.fromOffset(210, 15), UDim2.fromOffset(230, 79), 8, Muted)

local Panel = Instance.new("Frame")
Panel.Size = UDim2.fromOffset(205, 169)
Panel.Position = UDim2.fromOffset(230, 101)
Panel.BackgroundColor3 = PanelDark
Panel.BorderSizePixel = 0
Panel.Parent = Main
Corner(Panel, 11)
Stroke(Panel, Purple, 1, 0.55)

local function LoadRobuxImage(ImageLabel)
	task.spawn(function()
		ImageLabel.Image = PRIMARY_IMAGE
		local Success = pcall(function()
			ContentProvider:PreloadAsync({ImageLabel})
		end)
		if not Success or not ImageLabel.IsLoaded then
			ImageLabel.Image = FALLBACK_IMAGE
			pcall(function() ContentProvider:PreloadAsync({ImageLabel}) end)
		end
	end)
end

local Amounts = {"50", "250", "1000", "5000", "25000"}
for Index, Amount in ipairs(Amounts) do
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, -12, 0, 27)
	Button.Position = UDim2.fromOffset(6, 5 + ((Index - 1) * 32))
	Button.BackgroundColor3 = CardDark
	Button.Text = ""
	Button.AutoButtonColor = false
	Button.Parent = Panel
	Corner(Button, 7)
	local ButtonStroke = Stroke(Button, Purple, 1, 0.8)
	
	local Icon = Instance.new("ImageLabel")
	Icon.Size = UDim2.fromOffset(17, 17)
	Icon.Position = UDim2.fromOffset(9, 5)
	Icon.BackgroundTransparency = 1
	Icon.ScaleType = Enum.ScaleType.Fit
	Icon.Parent = Button
	LoadRobuxImage(Icon)
	
	CreateLabel(Button, FormatNumber(Amount), UDim2.new(1, -40, 1, 0), UDim2.fromOffset(34, 0), 11, White, Enum.Font.GothamBold)
	
	Button.MouseEnter:Connect(function()
		Tween(Button, FastTween, {BackgroundColor3 = Color3.fromRGB(64, 38, 96)})
		Tween(ButtonStroke, FastTween, {Transparency = 0.2})
	end)
	Button.MouseLeave:Connect(function()
		Tween(Button, FastTween, {BackgroundColor3 = CardDark})
		Tween(ButtonStroke, FastTween, {Transparency = 0.8})
	end)
	Button.MouseButton1Click:Connect(function()
		InputBox.Text = Amount
	end)
end

-- FOOTER
CreateLabel(Main, "PYROVEX HUB  •  UI EDITION", UDim2.fromOffset(250, 13), UDim2.fromOffset(15, 310), 8, Muted)
CreateLabel(Main, "v1.0", UDim2.fromOffset(35, 13), UDim2.new(1, -48, 0, 310), 8, Muted)

--==================================================
-- FLOATING P BUTTON
--==================================================

local FloatingButton = Instance.new("TextButton")
FloatingButton.Name = "PyrovexFloatingButton"
FloatingButton.Size = UDim2.fromOffset(54, 54)
FloatingButton.Position = UDim2.new(0, 22, 0.5, -27)
FloatingButton.BackgroundColor3 = Color3.fromRGB(24, 14, 42)
FloatingButton.Text = ""
FloatingButton.AutoButtonColor = false
FloatingButton.Visible = false
FloatingButton.Parent = ScreenGui
Corner(FloatingButton, 17)
AddAnimatedBorder(FloatingButton)
Gradient(FloatingButton, {
	ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 28, 100)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 18, 55)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 22, 50))
}, 45)

local FloatingLogo = CreateLabel(FloatingButton, "P", UDim2.fromScale(1, 1), UDim2.fromOffset(0, -1), 27, White, Enum.Font.GothamBlack)
FloatingLogo.TextXAlignment = Enum.TextXAlignment.Center
Stroke(FloatingButton, Color3.fromRGB(185, 120, 255), 1, 0.35)

local FloatingScale = Instance.new("UIScale")
FloatingScale.Scale = 1
FloatingScale.Parent = FloatingButton

MakeDraggable(FloatingButton, FloatingButton, function()
	Main.Visible = true
	FloatingButton.Visible = false
	MainScale.Scale = 0.85
	Tween(MainScale, PopTween, {Scale = 1})
end)

Minimize.MouseButton1Click:Connect(function()
	Main.Visible = false
	FloatingButton.Visible = true
	FloatingScale.Scale = 0.65
	Tween(FloatingScale, PopTween, {Scale = 1})
end)

MakeDraggable(Header, Main)
Tween(MainScale, PopTween, {Scale = 1})
end

--==================================================
-- KEY VERIFICATION
--==================================================

local KeyBusy = false
local function VerifyKey()
	if KeyBusy then return end
	KeyBusy = true
	local EnteredKey = KeyInput.Text
	
	if ValidKeys[EnteredKey] then
		Status.Text = "KEY VERIFIED!"
		Status.TextColor3 = Green
		VerifyButton.Text = "ACCESS GRANTED"
		task.wait(0.45)
		LoadMainUI()
	else
		Status.Text = "INVALID KEY! TRY AGAIN."
		Status.TextColor3 = Crimson
		Tween(KeyStroke, FastTween, {Color = Crimson})
		task.wait(0.6)
		if KeyStroke.Parent then
			Tween(KeyStroke, FastTween, {Color = Purple})
		end
		KeyBusy = false
	end
end

VerifyButton.MouseButton1Click:Connect(VerifyKey)
KeyInput.FocusLost:Connect(function(EnterPressed)
	if EnterPressed then VerifyKey() end
end)

--==================================================
-- DISCORD BUTTON
--==================================================

DiscordButton.MouseButton1Click:Connect(function()
	local Copied = false
	if setclipboard then
		Copied = pcall(function() setclipboard(DiscordLink) end)
	elseif toclipboard then
		Copied = pcall(function() toclipboard(DiscordLink) end)
	end
	if Copied then
		DiscordButton.Text = "LINK COPIED!"
	else
		DiscordButton.Text = "discord.gg/fUWAW9vB4"
	end
	task.delay(2, function()
		if DiscordButton and DiscordButton.Parent then
			DiscordButton.Text = "DISCORD  •  GET KEY"
		end
	end)
end)

--==================================================
-- HOTKEY: F5 RESCAN
--==================================================

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.F5 then
		if PreviewEnabled then
			ScanTargets()
			PreviewStatus.Text = "RESCANNED: "..#targets.." FOUND"
			PreviewStatus.TextColor3 = Green
			task.delay(1.5, function()
				if PreviewStatus.Parent then
					PreviewStatus.Text = "SPOOFER: ON"
					PreviewStatus.TextColor3 = Green
				end
			end)
		end
	end
end)

-- INITIAL ANIMATION
Tween(KeyScale, PopTween, {Scale = 1})
print("[PYROVEX HUB] Premium UI Loaded")
print("[Pyrovex Spoofer] Functions Loaded & Linked ✅")
