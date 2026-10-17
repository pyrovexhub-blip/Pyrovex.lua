-- PYROVEX HUB | PREMIUM KEY SYSTEM + TOKEN SPOOFER
-- By Kingflame | Pyrovex Team
-- Delta-Friendly Version

local GrowAGarden_PlaceID = 126884695634066
if game.PlaceId ~= GrowAGarden_PlaceID then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "PYROVEX HUB", Text = "Exclusive to Grow a Garden!", Duration = 5
    })
    return
end

-- Cleanup
if _G.TLoop then _G.TLoop = false end
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("PyroVexHub") then CoreGui.PyroVexHub:Destroy() end
if CoreGui:FindFirstChild("PyrovexKeyUI") then CoreGui.PyrovexKeyUI:Destroy() end

local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")

local tInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tInfoFast = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- 🎨 COLORS
local C = {
    black = Color3.fromRGB(10, 8, 14),
    darkGrey = Color3.fromRGB(30, 28, 36),
    grey = Color3.fromRGB(50, 48, 60),
    lightGrey = Color3.fromRGB(110, 105, 125),
    silver = Color3.fromRGB(170, 165, 185),
    crimson = Color3.fromRGB(180, 28, 55),
    crimson2 = Color3.fromRGB(220, 45, 80),
    purple = Color3.fromRGB(165, 80, 255),
    purple2 = Color3.fromRGB(95, 55, 190),
    white = Color3.fromRGB(245, 240, 255),
    muted = Color3.fromRGB(145, 135, 165),
    success = Color3.fromRGB(115, 255, 170),
    error = Color3.fromRGB(255, 100, 125)
}

-- 🔑 KEY LIST
local KEYS = {
    ["519384726105839"] = true,
    ["741958263047182"] = true,
    ["395827461059283"] = true,
    ["827461935082746"] = true,
    ["482957103629485"] = true,
    ["103958274619385"] = true,
    ["582947103628471"] = true,
}

local function fCom(n)
    local s = tostring(n):gsub(",", "")
    while true do local r; s, r = s:gsub("^(-?%d+)(%d%d%d)", "%1,%2"); if r == 0 then break end end
    return s
end

-- ======================================
-- 🔑 KEY SYSTEM UI
-- ======================================
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "PyrovexKeyUI"
keyGui.ResetOnSpawn = false
keyGui.IgnoreGuiInset = true
keyGui.Parent = CoreGui

local keyMain = Instance.new("Frame")
keyMain.Name = "Main"
keyMain.AnchorPoint = Vector2.new(0.5, 0.5)
keyMain.Position = UDim2.fromScale(0.5, 0.5)
keyMain.Size = UDim2.fromOffset(0, 0)
keyMain.BackgroundColor3 = Color3.fromRGB(14, 12, 21)
keyMain.ClipsDescendants = true
keyMain.Parent = keyGui

Instance.new("UICorner", keyMain).CornerRadius = UDim.new(0, 14)

local keyBorder = Instance.new("UIStroke")
keyBorder.Color = C.purple
keyBorder.Thickness = 1.4
keyBorder.Transparency = 0.15
keyBorder.Parent = keyMain

local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(1, 0, 0, 3)
topLine.BackgroundColor3 = C.purple
topLine.Parent = keyMain

local header = Instance.new("Frame")
header.Name = "DragBar"
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = Color3.fromRGB(24, 20, 34)
header.Active = true
header.Parent = keyMain
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 14)

local logo = Instance.new("Frame")
logo.Position = UDim2.fromOffset(14, 12)
logo.Size = UDim2.fromOffset(32, 32)
logo.BackgroundColor3 = C.purple
logo.Parent = header
Instance.new("UICorner", logo).CornerRadius = UDim.new(0, 9)

local logoText = Instance.new("TextLabel")
logoText.Size = UDim2.fromScale(1, 1)
logoText.BackgroundTransparency = 1
logoText.Text = "P"
logoText.TextColor3 = C.white
logoText.Font = Enum.Font.GothamBlack
logoText.TextSize = 20
logoText.Parent = logo

local title = Instance.new("TextLabel")
title.Position = UDim2.fromOffset(56, 10)
title.Size = UDim2.new(1, -105, 0, 20)
title.BackgroundTransparency = 1
title.Text = "PYROVEX HUB"
title.TextColor3 = C.white
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Position = UDim2.fromOffset(57, 30)
subtitle.Size = UDim2.new(1, -110, 0, 13)
subtitle.BackgroundTransparency = 1
subtitle.Text = "PREMIUM ACCESS  /  KEY SYSTEM"
subtitle.TextColor3 = C.muted
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 8
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header

local closeKey = Instance.new("TextButton")
closeKey.Position = UDim2.new(1, -37, 0, 13)
closeKey.Size = UDim2.fromOffset(24, 24)
closeKey.BackgroundColor3 = Color3.fromRGB(49, 28, 53)
closeKey.Text = "×"
closeKey.TextColor3 = Color3.fromRGB(240, 160, 255)
closeKey.Font = Enum.Font.GothamMedium
closeKey.TextSize = 20
closeKey.AutoButtonColor = false
closeKey.Parent = header
Instance.new("UICorner", closeKey).CornerRadius = UDim.new(0, 7)

local badge = Instance.new("TextLabel")
badge.Position = UDim2.fromOffset(18, 70)
badge.Size = UDim2.fromOffset(105, 22)
badge.BackgroundColor3 = Color3.fromRGB(42, 28, 60)
badge.Text = "  ◆  SECURE GATE"
badge.TextColor3 = Color3.fromRGB(205, 160, 255)
badge.Font = Enum.Font.GothamBold
badge.TextSize = 9
badge.TextXAlignment = Enum.TextXAlignment.Left
badge.Parent = keyMain
Instance.new("UICorner", badge).CornerRadius = UDim.new(0, 6)

local heading = Instance.new("TextLabel")
heading.Position = UDim2.fromOffset(18, 101)
heading.Size = UDim2.new(1, -36, 0, 25)
heading.BackgroundTransparency = 1
heading.Text = "Unlock Your Access"
heading.TextColor3 = C.white
heading.Font = Enum.Font.GothamBold
heading.TextSize = 19
heading.TextXAlignment = Enum.TextXAlignment.Left
heading.Parent = keyMain

local description = Instance.new("TextLabel")
description.Position = UDim2.fromOffset(19, 128)
description.Size = UDim2.new(1, -38, 0, 18)
description.BackgroundTransparency = 1
description.Text = "Enter your access key to continue."
description.TextColor3 = C.muted
description.Font = Enum.Font.Gotham
description.TextSize = 10
description.TextXAlignment = Enum.TextXAlignment.Left
description.Parent = keyMain

local inputLabel = Instance.new("TextLabel")
inputLabel.Position = UDim2.fromOffset(19, 157)
inputLabel.Size = UDim2.new(1, -38, 0, 15)
inputLabel.BackgroundTransparency = 1
inputLabel.Text = "ACCESS KEY"
inputLabel.TextColor3 = Color3.fromRGB(190, 175, 210)
inputLabel.Font = Enum.Font.GothamBold
inputLabel.TextSize = 9
inputLabel.TextXAlignment = Enum.TextXAlignment.Left
inputLabel.Parent = keyMain

local keyInput = Instance.new("TextBox")
keyInput.Position = UDim2.fromOffset(18, 177)
keyInput.Size = UDim2.new(1, -36, 0, 39)
keyInput.BackgroundColor3 = Color3.fromRGB(29, 24, 40)
keyInput.TextColor3 = C.white
keyInput.PlaceholderText = "15-digit key..."
keyInput.PlaceholderColor3 = Color3.fromRGB(115, 105, 130)
keyInput.Font = Enum.Font.Code
keyInput.TextSize = 14
keyInput.ClearTextOnFocus = false
keyInput.Text = ""
keyInput.BorderSizePixel = 0
keyInput.Parent = keyMain
Instance.new("UICorner", keyInput).CornerRadius = UDim.new(0, 8)

local inputBorder = Instance.new("UIStroke")
inputBorder.Color = Color3.fromRGB(69, 54, 88)
inputBorder.Thickness = 1
inputBorder.Parent = keyInput

local keyStatus = Instance.new("TextLabel")
keyStatus.Position = UDim2.fromOffset(19, 221)
keyStatus.Size = UDim2.new(1, -38, 0, 15)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = "●  READY FOR VERIFICATION"
keyStatus.TextColor3 = C.muted
keyStatus.Font = Enum.Font.GothamMedium
keyStatus.TextSize = 9
keyStatus.TextXAlignment = Enum.TextXAlignment.Left
keyStatus.Parent = keyMain

local submitKey = Instance.new("TextButton")
submitKey.Position = UDim2.fromOffset(18, 243)
submitKey.Size = UDim2.new(1, -36, 0, 37)
submitKey.BackgroundColor3 = Color3.fromRGB(135, 65, 225)
submitKey.Text = "VERIFY ACCESS     →"
submitKey.TextColor3 = C.white
submitKey.Font = Enum.Font.GothamBold
submitKey.TextSize = 11
submitKey.AutoButtonColor = false
submitKey.Parent = keyMain
Instance.new("UICorner", submitKey).CornerRadius = UDim.new(0, 8)

-- Drag Function for Key UI
local dragging, dragStart, startPos
header.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = inp.Position
        startPos = keyMain.Position
        inp.Changed:Connect(function()
            if inp.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UIS.InputChanged:Connect(function(inp)
    if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = inp.Position - dragStart
        keyMain.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Open Animation
TS:Create(keyMain, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.fromOffset(330, 300), BackgroundTransparency = 0
}):Play()

-- Key Input Filter
keyInput:GetPropertyChangedSignal("Text"):Connect(function()
    local cleaned = keyInput.Text:gsub("%D", ""):sub(1, 15)
    if keyInput.Text ~= cleaned then keyInput.Text = cleaned end
end)

local function setKeyStatus(text, color)
    keyStatus.Text = text
    keyStatus.TextColor3 = color
end

local keyBusy = false
local function openMainUI()
    -- Destroy Key UI with animation
    local fade = TS:Create(keyMain, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1
    })
    fade:Play()
    fade.Completed:Wait()
    keyGui:Destroy()

    -- ======================================
    -- 🎯 MAIN TOKEN SPOOFER UI
    -- ======================================
    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = "PyroVexHub"
    mainGui.ResetOnSpawn = false
    mainGui.Parent = CoreGui

    local MF = Instance.new("Frame")
    MF.Size = UDim2.new(0, 340, 0, 330)
    MF.Position = UDim2.new(0.5, -170, 0.4, -165)
    MF.BackgroundColor3 = C.black
    MF.Active = true
    MF.Draggable = true
    Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 20)
    MF.Parent = mainGui

    Instance.new("UIStroke", MF).Color = C.crimson

    -- Top Bar
    local HB = Instance.new("Frame", MF)
    HB.Size = UDim2.new(1, 0, 0, 60)
    HB.BackgroundColor3 = C.darkGrey
    Instance.new("UICorner", HB).CornerRadius = UDim.new(0, 20)

    local LogoContainer = Instance.new("Frame", HB)
    LogoContainer.Size = UDim2.new(0, 36, 0, 36)
    LogoContainer.Position = UDim2.new(0, 14, 0, 12)
    LogoContainer.BackgroundColor3 = C.black
    Instance.new("UICorner", LogoContainer).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", LogoContainer).Color = C.crimson

    local LogoP = Instance.new("TextLabel", LogoContainer)
    LogoP.Size = UDim2.new(1, 0, 1, 0)
    LogoP.BackgroundTransparency = 1
    LogoP.Text = "P"
    LogoP.TextColor3 = C.white
    LogoP.TextSize = 22
    LogoP.Font = Enum.Font.GothamBold
    LogoP.Parent = LogoContainer

    local TL = Instance.new("TextLabel", HB)
    TL.Size = UDim2.new(0, 220, 0, 22)
    TL.Position = UDim2.new(0, 62, 0, 10)
    TL.BackgroundTransparency = 1
    TL.Text = "PYRO VEX HUB"
    TL.TextColor3 = C.crimson2
    TL.TextSize = 15
    TL.Font = Enum.Font.GothamBold
    TL.TextXAlignment = Enum.TextXAlignment.Left
    TL.Parent = HB

    local CT = Instance.new("TextLabel", HB)
    CT.Size = UDim2.new(0, 220, 0, 12)
    CT.Position = UDim2.new(0, 62, 0, 34)
    CT.BackgroundTransparency = 1
    CT.Text = "Grow a Garden — Token Spoofer"
    CT.TextColor3 = C.silver
    CT.TextSize = 10
    CT.Font = Enum.Font.Gotham
    CT.TextXAlignment = Enum.TextXAlignment.Left
    CT.Parent = HB

    local CloseC = Instance.new("TextButton", HB)
    CloseC.Size = UDim2.new(0, 28, 0, 28)
    CloseC.Position = UDim2.new(1, -40, 0, 16)
    CloseC.BackgroundColor3 = C.grey
    CloseC.Text = "×"
    CloseC.TextColor3 = C.white
    CloseC.TextSize = 20
    CloseC.Font = Enum.Font.GothamBold
    CloseC.AutoLocalize = false
    Instance.new("UICorner", CloseC).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", CloseC).Color = C.crimson
    CloseC.Parent = HB

    local MinC = Instance.new("TextButton", HB)
    MinC.Size = UDim2.new(0, 28, 0, 28)
    MinC.Position = UDim2.new(1, -76, 0, 16)
    MinC.BackgroundColor3 = C.grey
    MinC.Text = "−"
    MinC.TextColor3 = C.white
    MinC.TextSize = 20
    MinC.Font = Enum.Font.GothamBold
    MinC.AutoLocalize = false
    Instance.new("UICorner", MinC).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", MinC).Color = C.purple
    MinC.Parent = HB

    local NB = Instance.new("TextButton", mainGui)
    NB.Size = UDim2.new(0, 50, 0, 50)
    NB.Position = UDim2.new(0, 14, 0.5, -25)
    NB.BackgroundColor3 = C.black
    NB.Text = "P"
    NB.TextColor3 = C.white
    NB.TextSize = 22
    NB.Font = Enum.Font.GothamBold
    NB.Active = true
    NB.Draggable = true
    NB.Visible = false
    Instance.new("UICorner", NB).CornerRadius = UDim.new(0, 14)
    Instance.new("UIStroke", NB).Color = C.purple
    NB.Parent = mainGui

    -- Section
    local Sec1 = Instance.new("Frame", MF)
    Sec1.Size = UDim2.new(1, -32, 0, 70)
    Sec1.Position = UDim2.new(0, 16, 0, 80)
    Sec1.BackgroundColor3 = C.darkGrey
    Instance.new("UICorner", Sec1).CornerRadius = UDim.new(0, 14)
    Instance.new("UIStroke", Sec1).Color = C.lightGrey
    Sec1.Parent = MF

    local L1 = Instance.new("TextLabel", Sec1)
    L1.Size = UDim2.new(0, 180, 0, 20)
    L1.Position = UDim2.new(0, 16, 0, 12)
    L1.BackgroundTransparency = 1
    L1.Text = "Token Spoofer"
    L1.TextColor3 = C.white
    L1.TextSize = 14
    L1.Font = Enum.Font.GothamBold
    L1.TextXAlignment = Enum.TextXAlignment.Left
    L1.Parent = Sec1

    local L1Sub = Instance.new("TextLabel", Sec1)
    L1Sub.Size = UDim2.new(0, 240, 0, 14)
    L1Sub.Position = UDim2.new(0, 16, 0, 38)
    L1Sub.BackgroundTransparency = 1
    L1Sub.Text = "Visual & Purchase Spoofer"
    L1Sub.TextColor3 = C.silver
    L1Sub.TextSize = 11
    L1Sub.Font = Enum.Font.Gotham
    L1Sub.TextXAlignment = Enum.TextXAlignment.Left
    L1Sub.Parent = Sec1

    local ToggleStatusText = Instance.new("TextLabel", Sec1)
    ToggleStatusText.Size = UDim2.new(0, 40, 0, 16)
    ToggleStatusText.Position = UDim2.new(1, -106, 0.5, -8)
    ToggleStatusText.BackgroundTransparency = 1
    ToggleStatusText.Text = "OFF"
    ToggleStatusText.TextColor3 = C.silver
    ToggleStatusText.TextSize = 11
    ToggleStatusText.Font = Enum.Font.GothamBold
    ToggleStatusText.TextXAlignment = Enum.TextXAlignment.Right
    ToggleStatusText.Parent = Sec1

    -- Toggle Switch
    local ToggleBG = Instance.new("TextButton", Sec1)
    ToggleBG.Size = UDim2.new(0, 52, 0, 26)
    ToggleBG.Position = UDim2.new(1, -60, 0.5, -13)
    ToggleBG.BackgroundColor3 = C.grey
    ToggleBG.Text = ""
    Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)
    local ToggleStroke = Instance.new("UIStroke", ToggleBG)
    ToggleStroke.Color = C.lightGrey
    ToggleStroke.Thickness = 1.5
    ToggleBG.Parent = Sec1

    local ToggleCircle = Instance.new("Frame", ToggleBG)
    ToggleCircle.Size = UDim2.new(0, 20, 0, 20)
    ToggleCircle.Position = UDim2.new(0, 3, 0.5, -10)
    ToggleCircle.BackgroundColor3 = C.silver
    Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1, 0)
    ToggleCircle.Parent = ToggleBG

    -- Input Box
    local TX = Instance.new("TextBox", MF)
    TX.Size = UDim2.new(1, -32, 0, 44)
    TX.Position = UDim2.new(0, 16, 0, 166)
    TX.BackgroundColor3 = C.darkGrey
    TX.Text = "0"
    TX.PlaceholderText = "Enter token amount..."
    TX.PlaceholderColor3 = C.lightGrey
    TX.TextColor3 = C.white
    TX.TextSize = 14
    TX.Font = Enum.Font.GothamBold
    Instance.new("UICorner", TX).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", TX).Color = C.lightGrey
    TX.Parent = MF

    TX:GetPropertyChangedSignal("Text"):Connect(function()
        local clean = TX.Text:gsub("%D", "")
        if TX.Text ~= clean then TX.Text = clean end
    end)

    -- Apply Button
    local AB = Instance.new("TextButton", MF)
    AB.Size = UDim2.new(1, -32, 0, 48)
    AB.Position = UDim2.new(0, 16, 0, 226)
    AB.BackgroundColor3 = C.grey
    AB.Text = "⚡ APPLY TOKEN MATRIX ⚡"
    AB.AutoLocalize = false
    AB.TextColor3 = C.silver
    AB.TextSize = 13
    AB.Font = Enum.Font.GothamBold
    Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", AB).Color = C.lightGrey
    AB.Parent = MF

    -- Status Log
    local CL = Instance.new("TextLabel", MF)
    CL.Size = UDim2.new(1, -32, 0, 22)
    CL.Position = UDim2.new(0, 16, 0, 292)
    CL.BackgroundTransparency = 1
    CL.Text = ">> System: Idle. Toggle switch to begin."
    CL.TextColor3 = C.silver
    CL.TextSize = 10
    CL.Font = Enum.Font.Code
    CL.TextXAlignment = Enum.TextXAlignment.Left
    CL.Parent = MF

    -- Variables
    local isOn, cText, LP = false, "0", Players.LocalPlayer
    local PlayerGui = LP:WaitForChild("PlayerGui")
    local targets = {}
    local currentBalance = 0

    local function lockUI()
        targets = {}
        pcall(function()
            for _, u in pairs(PlayerGui:GetDescendants()) do
                if u:IsA("TextLabel") or u:IsA("TextBox") then
                    if not u:IsDescendantOf(workspace) and not u:FindFirstAncestorOfClass("BillboardGui") and not u:FindFirstAncestorOfClass("SurfaceGui") then
                        local lt = u.Text:lower()
                        local pn = (u.Parent and u.Parent.Name:lower()) or ""
                        local gpn = (u.Parent and u.Parent.Parent and u.Parent.Parent.Name:lower()) or ""
                        if not lt:find("boost") and not lt:find("multiplier") and not lt:find("level") and not lt:find("rebirth") then
                            if not pn:find("card") and not pn:find("template") and not pn:find("price") and not pn:find("btn") and not pn:find("button") then
                                if not gpn:find("card") and not gpn:find("template") and not gpn:find("list") then
                                    if lt:find("tokens:") or lt:find("token:") or pn == "tokens" or pn == "token" then
                                        table.insert(targets, u)
                                    elseif u.Text:find("^[%d,]+$") and (pn:find("currency") or pn:find("main") or pn:find("top") or pn:find("bar") or pn:find("trade") or gpn:find("trade")) then
                                        table.insert(targets, u)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end

    -- Buttons
    CloseC.MouseButton1Click:Connect(function()
        _G.TLoop = false
        mainGui:Destroy()
    end)

    MinC.MouseButton1Click:Connect(function()
        MF.Visible = false
        NB.Visible = true
    end)

    NB.MouseButton1Click:Connect(function()
        NB.Visible = false
        MF.Visible = true
    end)

    ToggleBG.MouseButton1Click:Connect(function()
        isOn = not isOn
        if isOn then
            TS:Create(ToggleCircle, tInfoFast, {Position = UDim2.new(1, -23, 0.5, -10), BackgroundColor3 = C.white}):Play()
            TS:Create(ToggleBG, tInfoFast, {BackgroundColor3 = C.crimson}):Play()
            TS:Create(ToggleStroke, tInfoFast, {Color = C.crimson2}):Play()
            TS:Create(AB, tInfoFast, {BackgroundColor3 = C.crimson}):Play()
            AB.TextColor3 = C.white
            ToggleStatusText.Text = "ON"
            ToggleStatusText.TextColor3 = C.crimson2
            CL.Text = ">> Status: ACTIVE — Visual hooks engaged."
            CL.TextColor3 = C.crimson2
            lockUI()
        else
            TS:Create(ToggleCircle, tInfoFast, {Position = UDim2.new(0, 3, 0.5, -10), BackgroundColor3 = C.silver}):Play()
            TS:Create(ToggleBG, tInfoFast, {BackgroundColor3 = C.grey}):Play()
                   TS:Create(ToggleStroke, tInfoFast, {Color = C.lightGrey}):Play()
            TS:Create(AB, tInfoFast, {BackgroundColor3 = C.grey}):Play()
            AB.TextColor3 = C.silver
            ToggleStatusText.Text = "OFF"
            ToggleStatusText.TextColor3 = C.silver
            CL.Text = ">> Status: DISENGAGED — Normal state restored."
            CL.TextColor3 = C.silver
        end
    end)

    AB.MouseButton1Click:Connect(function()
        if not isOn then
            CL.Text = ">> ERROR: Toggle ON first!"
            CL.TextColor3 = C.crimson2
            return
        end
        lockUI()
        cText = TX.Text:gsub("%D", "")
        if cText == "" then cText = "0" end
        currentBalance = tonumber(cText) or 0
        local cc = fCom(cText)
        for _, u in pairs(targets) do
            pcall(function()
                local lt = u.Text:lower()
                if lt:find("tokens:") then u.Text = "Tokens: "..cc
                elseif lt:find("token:") then u.Text = "Token: "..cc
                else u.Text = cc end
            end)
        end
        CL.Text = ">> APPLIED: "..cc.." Tokens — Matrix synced."
        CL.TextColor3 = C.purple
    end)

    -- Main Loop
    _G.TLoop = true
    task.spawn(function()
        while _G.TLoop do
            task.wait(0.15)
            if isOn and cText ~= "" then
                if #targets == 0 then continue end
                local cc = fCom(currentBalance)
                for _, u in pairs(targets) do
                    pcall(function()
                        if not u or not u.Parent then return end
                        local lt = u.Text:lower()
                        if lt:find("tokens:") then
                            local newText = "Tokens: "..cc
                            if u.Text ~= newText then u.Text = newText end
                        elseif lt:find("token:") then
                            local newText = "Token: "..cc
                            if u.Text ~= newText then u.Text = newText end
                        elseif u.Text ~= cc and not lt:find("token") then
                            u.Text = cc
                        end
                    end)
                end
            end
        end
    end)

    -- Purchase Detection
    UIS.InputBegan:Connect(function(i, p)
        if not isOn or p then return end
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            pcall(function()
                local c = LP.Character
                if not c then return end
                local root = c:FindFirstChild("HumanoidRootPart")
                if not root then return end
                local booth, dist, price = nil, 15, 0
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Booth" or v.Name:lower():find("booth") then
                        local part = v:IsA("BasePart") and v or v:FindFirstChildWhichIsA("BasePart", true)
                        if part then
                            local d = (root.Position - part.Position).Magnitude
                            if d < dist then booth = v; dist = d end
                        end
                    end
                end
                if booth then
                    for _, lbl in pairs(booth:GetDescendants()) do
                        if lbl:IsA("TextLabel") and lbl.Text:find("^[%d,]+$") then
                            local val = tonumber(lbl.Text:gsub(",", ""))
                            if val and val > price then price = val end
                        end
                    end
                    if price > 0 and currentBalance >= price then
                        task.wait(0.1)
                        currentBalance = currentBalance - price
                        TX.Text = tostring(currentBalance)
                        CL.Text = ">> PURCHASE: −"..fCom(price).." Tokens deducted."
                        CL.TextColor3 = C.purple
                    end
                end
            end)
        end
    end)

    -- Hide "Not Enough Tokens"
    task.spawn(function()
        while task.wait(0.25) do
            if not isOn then continue end
            pcall(function()
                for _, u in pairs(PlayerGui:GetDescendants()) do
                    if u:IsA("TextLabel") then
                        local t = u.Text:lower()
                        if t:find("don't have enough tokens") or t:find("enough tokens to buy") then
                            u.Visible = false
                        end
                    end
                end
            end)
        end
    end)
end

-- Verify Key Function
local function validateKey()
    if keyBusy then return end
    keyBusy = true

    if KEYS[keyInput.Text] then
        setKeyStatus("●  ACCESS GRANTED", C.success)
        submitKey.Text = "VERIFIED  ✓"
        task.wait(0.55)
        openMainUI()
        return
    else
        setKeyStatus("●  INVALID KEY — TRY AGAIN", C.error)
        TS:Create(inputBorder, TweenInfo.new(0.12), {Color = C.error}):Play()
        task.wait(0.45)
        if inputBorder.Parent then
            TS:Create(inputBorder, TweenInfo.new(0.2), {Color = Color3.fromRGB(69, 54, 88)}):Play()
        end
    end
    keyBusy = false
end

submitKey.Activated:Connect(validateKey)
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then validateKey() end
end)

closeKey.Activated:Connect(function()
    keyGui:Destroy()
end)
