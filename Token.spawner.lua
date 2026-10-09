-- Grow a Garden 1 Place ID Guard
local GrowAGarden_PlaceID = 126884695634066
if game.PlaceId ~= GrowAGarden_PlaceID then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "PYRO VEX HUB", Text = "Exclusive to Grow a Garden!", Duration = 5
    })
    return
end

if _G.TLoop then _G.TLoop = false task.wait(0.15) end
if game.CoreGui:FindFirstChild("PyroVexHub") then game.CoreGui.PyroVexHub:Destroy() end

local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local tInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tInfoFast = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local C = {
    bg = Color3.fromRGB(12, 6, 10),
    top = Color3.fromRGB(26, 10, 18),
    panel = Color3.fromRGB(34, 14, 26),
    panel2 = Color3.fromRGB(48, 18, 36),
    crimson = Color3.fromRGB(150, 22, 50),
    crimson2 = Color3.fromRGB(195, 35, 70),
    purple = Color3.fromRGB(110, 35, 180),
    purple2 = Color3.fromRGB(145, 60, 210),
    text = Color3.fromRGB(245, 235, 240),
    sub = Color3.fromRGB(150, 135, 145)
}

local currentBalance = 0
local function fCom(n)
    local s = tostring(n):gsub(",", "")
    while true do local r; s, r = s:gsub("^(-?%d+)(%d%d%d)", "%1,%2"); if r == 0 then break end end
    return s
end

local SG = Instance.new("ScreenGui")
SG.Name = "PyroVexHub"
SG.ResetOnSpawn = false
SG.Parent = game.CoreGui

local MF = Instance.new("Frame")
MF.Size = UDim2.new(0, 340, 0, 280)
MF.Position = UDim2.new(0.5, -170, 0.4, -140)
MF.BackgroundColor3 = C.bg
MF.Active = true; MF.Draggable = true
Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 16)
MF.Parent = SG

local GB = Instance.new("UIStroke", MF)
GB.Color = C.crimson; GB.Thickness = 2
task.spawn(function()
    while task.wait(1.2) do
        if not MF or not MF.Parent then break end
        TS:Create(GB, TweenInfo.new(1.1), {Color = C.purple}):Play()
        task.wait(1.2)
        TS:Create(GB, TweenInfo.new(1.1), {Color = C.crimson}):Play()
    end
end)

local HB = Instance.new("Frame", MF)
HB.Size = UDim2.new(1, 0, 0, 54)
HB.BackgroundColor3 = C.top
Instance.new("UICorner", HB).CornerRadius = UDim.new(0, 16)

local NL = Instance.new("TextLabel", HB)
NL.Size = UDim2.new(0, 34, 0, 34)
NL.Position = UDim2.new(0, 12, 0, 10)
NL.BackgroundColor3 = C.crimson2
NL.Text = "PR"; NL.TextColor3 = Color3.new(1,1,1)
NL.TextSize = 16; NL.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", NL).CornerRadius = UDim.new(0, 10)

local TL = Instance.new("TextLabel", HB)
TL.Size = UDim2.new(0, 200, 0, 20)
TL.Position = UDim2.new(0, 56, 0, 11)
TL.BackgroundTransparency = 1
TL.Text = "PYRO VEX HUB"
TL.TextColor3 = C.crimson2; TL.TextSize = 14
TL.Font = Enum.Font.SourceSansBold; TL.TextXAlignment = Enum.TextXAlignment.Left

local CT = Instance.new("TextLabel", HB)
CT.Size = UDim2.new(0, 200, 0, 12)
CT.Position = UDim2.new(0, 56, 0, 30)
CT.BackgroundTransparency = 1
CT.Text = "by PyroVex Team"
CT.TextColor3 = C.sub; CT.TextSize = 9
CT.Font = Enum.Font.Code; CT.TextXAlignment = Enum.TextXAlignment.Left

local CloseC = Instance.new("TextButton", HB)
CloseC.Size = UDim2.new(0, 24, 0, 24)
CloseC.Position = UDim2.new(1, -36, 0, 15)
CloseC.BackgroundColor3 = C.crimson2
CloseC.Text = "×"; CloseC.TextColor3 = Color3.new(1,1,1)
CloseC.TextSize = 18; CloseC.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", CloseC).CornerRadius = UDim.new(0, 7)
Instance.new("UIStroke", CloseC).Color = C.crimson

local MinC = Instance.new("TextButton", HB)
MinC.Size = UDim2.new(0, 24, 0, 24)
MinC.Position = UDim2.new(1, -66, 0, 15)
MinC.BackgroundColor3 = C.purple
MinC.Text = "−"; MinC.TextColor3 = Color3.new(1,1,1)
MinC.TextSize = 18; MinC.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", MinC).CornerRadius = UDim.new(0, 7)
Instance.new("UIStroke", MinC).Color = C.purple2

local NB = Instance.new("TextButton", SG)
NB.Size = UDim2.new(0, 52, 0, 52)
NB.Position = UDim2.new(0, 12, 0.5, -26)
NB.BackgroundColor3 = C.crimson2
NB.Text = "PR"; NB.TextColor3 = Color3.new(1,1,1)
NB.TextSize = 20; NB.Font = Enum.Font.SourceSansBold
NB.Active = true; NB.Draggable = true; NB.Visible = false
Instance.new("UICorner", NB).CornerRadius = UDim.new(0, 14)
local NBS = Instance.new("UIStroke", NB)
NBS.Color = C.purple; NBS.Thickness = 2

local Sec1 = Instance.new("Frame", MF)
Sec1.Size = UDim2.new(1, -32, 0, 62)
Sec1.Position = UDim2.new(0, 16, 0, 70)
Sec1.BackgroundColor3 = C.panel
Instance.new("UICorner", Sec1).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", Sec1).Color = C.crimson

local L1 = Instance.new("TextLabel", Sec1)
L1.Size = UDim2.new(0, 180, 0, 20)
L1.Position = UDim2.new(0, 14, 0, 10)
L1.BackgroundTransparency = 1
L1.Text = "Token Spawner"; L1.TextColor3 = C.text
L1.TextSize = 13; L1.Font = Enum.Font.SourceSansBold; L1.TextXAlignment = Enum.TextXAlignment.Left

local L1Sub = Instance.new("TextLabel", Sec1)
L1Sub.Size = UDim2.new(0, 220, 0, 14)
L1Sub.Position = UDim2.new(0, 14, 0, 32)
L1Sub.BackgroundTransparency = 1
L1Sub.Text = "Stealth Matrix — Visual & Purchase Spoofer"
L1Sub.TextColor3 = C.sub; L1Sub.TextSize = 10
L1Sub.Font = Enum.Font.SourceSans; L1Sub.TextXAlignment = Enum.TextXAlignment.Left

local ToggleStatusText = Instance.new("TextLabel", Sec1)
ToggleStatusText.Size = UDim2.new(0, 36, 0, 16)
ToggleStatusText.Position = UDim2.new(1, -98, 0.5, -8)
ToggleStatusText.BackgroundTransparency = 1
ToggleStatusText.Text = "OFF"; ToggleStatusText.TextColor3 = C.sub
ToggleStatusText.TextSize = 10; ToggleStatusText.Font = Enum.Font.SourceSansBold; ToggleStatusText.TextXAlignment = Enum.TextXAlignment.Right

local ToggleBG = Instance.new("TextButton", Sec1)
ToggleBG.Size = UDim2.new(0, 50, 0, 24)
ToggleBG.Position = UDim2.new(1, -58, 0.5, -12)
ToggleBG.BackgroundColor3 = C.panel2
ToggleBG.Text = ""
Instance.new("UICorner", ToggleBG).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBG)
ToggleStroke.Color = C.crimson; ToggleStroke.Thickness = 1.5

local ToggleCircle = Instance.new("Frame", ToggleBG)
ToggleCircle.Size = UDim2.new(0, 18, 0, 18)
ToggleCircle.Position = UDim2.new(0, 3, 0.5, -9)
ToggleCircle.BackgroundColor3 = Color3.fromRGB(210, 205, 210)
Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1, 0)

local TX = Instance.new("TextBox", MF)
TX.Size = UDim2.new(1, -32, 0, 40)
TX.Position = UDim2.new(0, 16, 0, 148)
TX.BackgroundColor3 = C.panel
TX.Text = "0"; TX.PlaceholderText = "Enter token amount..."
TX.PlaceholderColor3 = C.sub; TX.TextColor3 = C.text
TX.TextSize = 15; TX.Font = Enum.Font.Code
Instance.new("UICorner", TX).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", TX).Color = C.crimson

TX:GetPropertyChangedSignal("Text"):Connect(function()
    local clean = TX.Text:gsub("%D", "")
    if TX.Text ~= clean then TX.Text = clean end
end)

local AB = Instance.new("TextButton", MF)
AB.Size = UDim2.new(1, -32, 0, 44)
AB.Position = UDim2.new(0, 16, 0, 200)
AB.BackgroundColor3 = C.panel2
AB.Text = "⚡ APPLY TOKEN MATRIX ⚡"; AB.AutoLocalize = false
AB.TextColor3 = C.sub; AB.TextSize = 12
AB.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", AB).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", AB).Color = C.purple

local CL = Instance.new("TextLabel", MF)
CL.Size = UDim2.new(1, -32, 0, 22)
CL.Position = UDim2.new(0, 16, 0, 252)
CL.BackgroundTransparency = 1
CL.Text = ">> System: Idle. Toggle switch to begin."
CL.TextColor3 = C.sub; CL.TextSize = 10
CL.Font = Enum.Font.Code; CL.TextXAlignment = Enum.TextXAlignment.Left

local isOn, cText, LP = false, "0", game.Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local targets = {}

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

CloseC.MouseButton1Click:Connect(function()
    _G.TLoop = false
    TS:Create(MF, tInfo, {Size = UDim2.new(), Position = UDim2.new(0.5, 0, 0.4, 0)}):Play()
    task.wait(0.2); SG:Destroy()
end)

MinC.MouseButton1Click:Connect(function()
    TS:Create(MF, tInfo, {Size = UDim2.new(), Position = UDim2.new(0.5, 0, 0.4, 0)}):Play()
    task.wait(0.15); MF.Visible = false; NB.Visible = true
end)

NB.MouseButton1Click:Connect(function()
    NB.Visible = false; MF.Visible = true
    TS:Create(MF, tInfo, {Size = UDim2.new(0, 340, 0, 280), Position = UDim2.new(0.5, -170, 0.4, -140)}):Play()
end)

ToggleBG.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        TS:Create(ToggleCircle, tInfoFast, {Position = UDim2.new(1, -21, 0.5, -9), BackgroundColor3 = Color3.new(1,1,1)}):Play()
        TS:Create(ToggleBG, tInfoFast, {BackgroundColor3 = C.crimson}):Play()
        TS:Create(ToggleStroke, tInfoFast, {Color = C.crimson2}):Play()
        TS:Create(AB, tInfoFast, {BackgroundColor3 = C.crimson}):Play()
        AB.TextColor3 = Color3.new(1,1,1)
        ToggleStatusText.Text = "ON"; ToggleStatusText.TextColor3 = C.crimson2
        CL.Text = ">> Status: ACTIVE — Visual hooks engaged."; lockUI()
    else
        TS:Create(ToggleCircle, tInfoFast, {Position = UDim2.new(0, 3, 0.5, -9), BackgroundColor3 = Color3.fromRGB(200, 195, 200)}):Play()
        TS:Create(ToggleBG, tInfoFast, {BackgroundColor3 = C.panel2}):Play()
        TS:Create(ToggleStroke, tInfoFast, {Color = C.crimson}):Play()
        TS:Create(AB, tInfoFast, {BackgroundColor3 = C.panel2}):Play()
        AB.TextColor3 = C.sub
        ToggleStatusText.Text = "OFF"; ToggleStatusText.TextColor3 = C.sub
        CL.Text = ">> Status: DISENGAGED — Normal state restored."
    end
end)

AB.MouseButton1Click:Connect(function()
    if not isOn then CL.Text = ">> ERROR: Toggle ON first!"; return end
    lockUI()
    cText = TX.Text:gsub("%D", "")
    if cText == "" then cText = "0" end
    currentBalance = tonumber(cText) or 0
    local cc = fCom(cText)
    for _, u in pairs(targets) do pcall(function()
        local lt = u.Text:lower()
        if lt:find("tokens:") then u.Text = "Tokens: "..cc
        elseif lt:find("token:") then u.Text = "Token: "..cc
        else u.Text = cc end
    end) end
    CL.Text = ">> APPLIED: "..cc.." Tokens — Matrix synced."
end)

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

UIS.InputBegan:Connect(function(i, p)
    if not isOn or p then return end
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        pcall(function()
            local c = LP.Character; if not c then return end
            local root = c:FindFirstChild("HumanoidRootPart"); if not root then return end
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
                end
            end
        end)
    end
end)

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
