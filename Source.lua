-- [[ faza3 & gemini: THE LEGENDARY CROSSOVER v8.0 ]] --
-- "Official Script for Escape Tsunami & Profit"

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- [[ نظام الإشعارات ]] --
local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 7
    })
end

Notify("faza3 & gemini", "لقد دخلو الاسطورتين gemini و faza3")

-- [[ إنشاء الواجهة الصفراء الاحترافية ]] --
local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "Faza3_Official_v8"

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 300, 0, 420)
Main.Position = UDim2.new(0.5, -150, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(212, 219, 21) -- لون فزاع الأصفر
Stroke.Thickness = 3

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "faza3 & gemini v8.0"
Title.TextColor3 = Color3.fromRGB(212, 219, 21)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

local Container = Instance.new("ScrollingFrame", Main)
Container.Size = UDim2.new(1, -20, 1, -70)
Container.Position = UDim2.new(0, 10, 0, 60)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 2
local Layout = Instance.new("UIListLayout", Container)
Layout.Padding = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- [[ وظيفة الأزرار ]] --
local function AddToggle(name, callback)
    local Btn = Instance.new("TextButton", Container)
    Btn.Size = UDim2.new(0.9, 0, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.Text = name .. ": OFF"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.SourceSansBold
    Btn.TextSize = 18
    Instance.new("UICorner", Btn)

    local state = false
    Btn.MouseButton1Click:Connect(function()
        state = not state
        Btn.Text = name .. (state and ": ON" or ": OFF")
        Btn.BackgroundColor3 = state and Color3.fromRGB(212, 219, 21) or Color3.fromRGB(30, 30, 30)
        Btn.TextColor3 = state and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        callback(state)
    end)
end

-- [[ تفعيل الميزات ]] --

-- 1. الطيران
AddToggle("Fly (Press E)", function(s)
    _G.Fly = s
    if s then
        local bv = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(1,1,1) * 500000
        task.spawn(function()
            while _G.Fly do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
                task.wait()
            end
            bv:Destroy()
        end)
    end
end)

-- 2. اختراق الجدران
AddToggle("Noclip", function(s) _G.Noclip = s end)
RS.Stepped:Connect(function()
    if _G.Noclip and LP.Character then
        for _, p in pairs(LP.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- 3. الخلود
AddToggle("God Mode", function(s)
    _G.God = s
    task.spawn(function()
        while _G.God do
            if LP.Character and LP.Character:FindFirstChild("Humanoid") then
                LP.Character.Humanoid.Health = 100
            end
            task.wait(0.1)
        end
    end)
end)

-- 4. جمع تلقائي (النسخة المصححة)
AddToggle("Auto Farm Coins", function(s)
    _G.Collect = s
    task.spawn(function()
        while _G.Collect do
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Coin" or v.Name == "Gem" then
                    pcall(function()
                        firetouchinterest(LP.Character.HumanoidRootPart, v, 0)
                        firetouchinterest(LP.Character.HumanoidRootPart, v, 1)
                    end)
                end
            end
            task.wait(0.5)
        end
    end)
end)

-- اختصار الكيبورد للطيران
UIS.InputBegan:Connect(function(i,p) 
    if not p and i.KeyCode == Enum.KeyCode.E then _G.Fly = not _G.Fly end 
end)

print("faza3 & gemini script fixed and ready!")
