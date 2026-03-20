-- [[ faza3 & gemini: THE COMPLETE VIP EDITION v10.0 ]] --
-- Features: Key System, Fly, God Mode, Auto Farm, Anti-Admin

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local RepS = game:GetService("ReplicatedStorage")

-- [[ 🔑 إعداد المفتاح - يمكنك تغييره من هنا ]] --
local CorrectKey = "faza3_2026"

-- [[ 🛡️ وظائف النظام ]] --
local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 7
    })
end

-- [[ 🎨 1. واجهة نظام المفاتيح (Login) ]] --
local KeyGui = Instance.new("ScreenGui", CoreGui)
local KeyMain = Instance.new("Frame", KeyGui)
KeyMain.Size = UDim2.new(0, 350, 0, 220)
KeyMain.Position = UDim2.new(0.5, -175, 0.5, -110)
KeyMain.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyMain.Active = true
KeyMain.Draggable = true
Instance.new("UICorner", KeyMain)
Instance.new("UIStroke", KeyMain).Color = Color3.fromRGB(212, 219, 21)

local KeyTitle = Instance.new("TextLabel", KeyMain)
KeyTitle.Size = UDim2.new(1, 0, 0, 60)
KeyTitle.Text = "faza3 & gemini LOGIN"
KeyTitle.TextColor3 = Color3.fromRGB(212, 219, 21)
KeyTitle.TextSize = 24
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.BackgroundTransparency = 1

local KeyInput = Instance.new("TextBox", KeyMain)
KeyInput.Size = UDim2.new(0.8, 0, 0, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.PlaceholderText = "أدخل المفتاح هنا..."
KeyInput.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", KeyInput)

local SubmitBtn = Instance.new("TextButton", KeyMain)
SubmitBtn.Size = UDim2.new(0.6, 0, 0, 45)
SubmitBtn.Position = UDim2.new(0.2, 0, 0.7, 0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(212, 219, 21)
SubmitBtn.Text = "دخول VIP"
SubmitBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", SubmitBtn)

-- [[ 🚀 2. السكربت الأساسي (بعد وضع المفتاح) ]] --
local function LaunchMainScript()
    Notify("faza3 & gemini", "لقد دخلو الاسطورتين gemini و faza3")
    
    local MainGui = Instance.new("ScreenGui", CoreGui)
    local MainFrame = Instance.new("Frame", MainGui)
    MainFrame.Size = UDim2.new(0, 320, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -160, 0.5, -225)
    MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame)
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(212, 219, 21)

    local MainTitle = Instance.new("TextLabel", MainFrame)
    MainTitle.Size = UDim2.new(1, 0, 0, 60)
    MainTitle.Text = "faza3 & gemini v10.0"
    MainTitle.TextColor3 = Color3.fromRGB(212, 219, 21)
    MainTitle.TextSize = 25
    MainTitle.Font = Enum.Font.GothamBold
    MainTitle.BackgroundTransparency = 1

    local Scroll = Instance.new("ScrollingFrame", MainFrame)
    Scroll.Size = UDim2.new(1, -20, 1, -80)
    Scroll.Position = UDim2.new(0, 10, 0, 70)
    Scroll.BackgroundTransparency = 1
    Scroll.ScrollBarThickness = 2
    local Layout = Instance.new("UIListLayout", Scroll)
    Layout.Padding = UDim.new(0, 10)
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function CreateBtn(name, callback)
        local B = Instance.new("TextButton", Scroll)
        B.Size = UDim2.new(0.9, 0, 0, 45)
        B.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        B.Text = name .. ": OFF"
        B.TextColor3 = Color3.new(1,1,1)
        B.Font = Enum.Font.SourceSansBold
        B.TextSize = 18
        Instance.new("UICorner", B)

        local active = false
        B.MouseButton1Click:Connect(function()
            active = not active
            B.Text = name .. (active and ": ON" or ": OFF")
            B.BackgroundColor3 = active and Color3.fromRGB(212, 219, 21) or Color3.fromRGB(30, 30, 30)
            B.TextColor3 = active and Color3.new(0,0,0) or Color3.new(1,1,1)
            callback(active)
        end)
    end

    -- الميزات
    CreateBtn("الطيران (E)", function(s)
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

    CreateBtn("اختراق الجدران", function(s) _G.Noclip = s end)
    RS.Stepped:Connect(function()
        if _G.Noclip and LP.Character then
            for _, v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
        end
    end)

    CreateBtn("الخلود (God Mode)", function(s)
        _G.God = s
        task.spawn(function() while _G.God do LP.Character.Humanoid.Health = 100 task.wait(0.1) end end)
    end)

    CreateBtn("الجمع التلقائي", function(s)
        _G.Farm = s
        task.spawn(function()
            while _G.Farm do
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Coin" or v.Name == "Gem" then
                        pcall(function() firetouchinterest(LP.Character.HumanoidRootPart, v, 0) firetouchinterest(LP.Character.HumanoidRootPart, v, 1) end)
                    end
                end
                task.wait(0.5)
            end
        end)
    end)
    
    -- نظام اختصار الكيبورد
    UIS.InputBegan:Connect(function(i,p) if not p and i.KeyCode == Enum.KeyCode.E then _G.Fly = not _G.Fly end end)
end

-- [[ 🛡️ التحقق من المفتاح عند الضغط ]] --
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        KeyGui:Destroy()
        LaunchMainScript()
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "خطأ! جرب: faza3_2026"
    end
end)
