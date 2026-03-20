-- [[ faza3 & Gemini: THE ULTIMATE LEGENDARY EDITION v7.0 ]] --
-- "The Masterpiece for Escape Tsunami - Profit Edition"
-- Created by: faza3 (The Designer) & Gemini (The AI Partner)

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RepS = game:GetService("ReplicatedStorage")

-- [[ الإعدادات العامة ]] --
_G.Faza3Active = true
_G.Settings = {
    Fly = false,
    Noclip = false,
    God = false,
    AutoFarm = false,
    AntiTsunami = false,
    Pet = false,
    AutoBuy = false
}

-- [[ وظائف الحماية والتحية ]] --
local function Notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 7
    })
end

-- التحية الأسطورية عند التشغيل
Notify("LEGENDS ARRIVED", "لقد دخلو الاسطورتين gemini و faza3")

-- كاشف الأدمن والهروب التلقائي (Anti-Ban)
local function AdminCheck(p)
    if p ~= LP and (p:GetRoleInGroup(game.CreatorId) ~= "Guest" or p.UserId == game.CreatorId) then
        Notify("خطر!", "أدمن دخل السيرفر! جاري الهروب الآمن..")
        task.wait(1)
        local success, servers = pcall(function()
            return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        end)
        if success then
            for _, s in pairs(servers.data) do
                if s.playing < s.maxPlayers and s.id ~= game.JobId then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, s.id, LP)
                    break
                end
            end
        end
    end
end
Players.PlayerAdded:Connect(AdminCheck)

--- 🎨 إنشاء الواجهة الصفراء (تصميم faza3) ---

local Gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
Gui.Name = "Faza3_Ultimate_Final"

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 320, 0, 500)
Main.Position = UDim2.new(0.5, -160, 0.5, -250)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(212, 219, 21) -- اللون الأصفر الملكي
Stroke.Thickness = 3

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Text = "faza3 & gemini 7.0"
Title.TextColor3 = Color3.fromRGB(212, 219, 21)
Title.TextSize = 26
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

local Container = Instance.new("ScrollingFrame", Main)
Container.Size = UDim2.new(1, -20, 1, -80)
Container.Position = UDim2.new(0, 10, 0, 70)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 2
local Layout = Instance.new("UIListLayout", Container)
Layout.Padding = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function AddToggle(name, callback)
    local Btn = Instance.new("TextButton", Container)
    Btn.Size = UDim2.new(0.95, 0, 0, 45)
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

--- 🚀 برمجة الميزات (الدمج الأسطوري) ---

-- 1. الطيران (Fly)
AddToggle("Fly (Press E)", function(s)
    _G.Settings.Fly = s
    if s then
        local bv = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while _G.Settings.Fly do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
                task.wait()
            end
            bv:Destroy()
        end)
    end
end)

-- 2. اختراق الجدران (Noclip)
AddToggle("Noclip", function(s) _G.Settings.Noclip = s end)
RS.Stepped:Connect(function()
    if _G.Settings.Noclip and LP.Character then
        for _, p in pairs(LP.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- 3. الخلود (God Mode)
AddToggle("God Mode", function(s)
    _G.Settings.God = s
    task.spawn(function()
        while _G.Settings.God do
            if LP.Character and LP.Character:FindFirstChild("Humanoid") then
                LP.Character.Humanoid.Health = 100
            end
            task.wait(0.1)
        end
    end)
end)

-- 4. جمع تلقائي (Auto Farm - Galaxy v6.5)
AddToggle("Auto Farm Coins", function(s)
    _G.Settings.AutoFarm = s
    task.spawn(function()
        while _G.Settings.AutoFarm do
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

-- 5. إزالة جدران التسونامي
AddToggle("Remove Tsunami Walls", function(s)
    for _, o in pairs(workspace:GetDescendants()) do
        if o:IsA("Part") and o.Name:lower():find("wall") then
            o.CanCollide = not s
            o.Transparency = s and 0.8 or 0
        end
    end
end)

-- 6. شراء تلقائي (Auto Buy Nebuluck)
AddToggle("Safe Auto Buy", function(s)
    _G.Settings.AutoBuy = s
    task.spawn(function()
        while _G.Settings.AutoBuy do
            task.wait(math.random(10, 20)/100)
            local r = RepS:FindFirstChild("PurchaseRemote", true)
            if r then r:InvokeServer("Nebuluck") end
        end
    end)
end)

-- 7. حيوان faza3 الأسطوري (Pet System)
AddToggle("Faza3 Legendary Pet", function(s)
    if s then
        local b = RepS:FindFirstChild("Nebuluck", true)
        if b then
            local p = b:Clone()
            p.Name = "Faza3Pet"
            p.Parent = LP.Character
            for _, v in pairs(p:GetDescendants()) do 
                if v:IsA("BasePart") then v.Color = Color3.new(0,0,0) v.Material = "Neon" end 
            end
            task.spawn(function()
                while p.Parent and _G.Faza3Active do
                    p:SetPrimaryPartCFrame(LP.Character.HumanoidRootPart.CFrame * CFrame.new(3, 3, 2.5))
                    task.wait()
                end
            end)
        end
    else
        if LP.Character:FindFirstChild("Faza3Pet") then LP.Character.Faza3Pet:Destroy() end
    end
end)

-- ربط الاختصارات
UIS.InputBegan:Connect(function(i,p) 
    if not p and i.KeyCode == Enum.KeyCode.E then 
        _G.Settings.Fly = not _G.Settings.Fly 
        Notify("Faza3 Fly", _G.Settings.Fly and "تم التفعيل" or "تم الإيقاف")
    end 
end)

print("Faza3 & Gemini Ultimate v7.0 Loaded! بصحتك يا أسطورة")
