local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Modifiers", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "ModifiersConfig",
    IntroIcon = "rbxassetid://124672511323537",
    IntroText = "Modifiers"
})

local MainTab = Window:MakeTab({
    Name = "Random Modifier",
    Icon = "rbxassetid://4483345998"
})

local modifiers = {
    -- Original Modifiers
    {
        name = "Slippery",
        func = function()
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Friction = 0.1
                end
            end
        end
    },
    {
        name = "One Eye",
        func = function()
            local screen = Instance.new("Frame")
            screen.Size = UDim2.new(0.5, 0, 1, 0)
            screen.BackgroundColor3 = Color3.new(0, 0, 0)
            screen.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
        end
    },
    {
        name = "Silent Night",
        func = function()
            game.Lighting.Brightness = 0.2
            game.Lighting.ClockTime = 0
        end
    },
    {
        name = "First Person",
        func = function()
            game.Players.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
        end
    },
    {
        name = "Anti Shift Lock",
        func = function()
            game.Players.LocalPlayer.DevEnableMouseLock = false
        end
    },
    -- Additional Modifiers
    {
        name = "Cartoon Mode",
        func = function()
            game.Lighting.Ambient = Color3.new(1, 1, 1)
            game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            game.Lighting.Brightness = 2
        end
    },
    {
        name = "Zero Friction",
        func = function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then part.Friction = 0 end
            end
        end
    },
    {
        name = "Moonwalk",
        func = function()
            local char = game.Players.LocalPlayer.Character
            char.Humanoid.WalkSpeed = -16
        end
    },
    {
        name = "Spinning World",
        func = function()
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(0, math.rad(1), 0)
        end
    },
    {
        name = "Giant Head",
        func = function()
            local char = game.Players.LocalPlayer.Character
            char.Head.Size = Vector3.new(4, 4, 4)
        end
    },
    {
        name = "Invisible Limbs",
        func = function()
            local char = game.Players.LocalPlayer.Character
            char["Right Arm"].Transparency = 1
            char["Left Arm"].Transparency = 1
            char["Right Leg"].Transparency = 1
            char["Left Leg"].Transparency = 1
        end
    },
    {
        name = "Neon Character",
        func = function()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.Neon
                end
            end
        end
    },
    {
        name = "Disco Mode",
        func = function()
            while wait(0.1) do
                game.Lighting.Ambient = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
            end
        end
    },
    {
        name = "Backwards Camera",
        func = function()
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(0, math.rad(180), 0)
        end
    },
    {
        name = "Glass Character",
        func = function()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.Glass
                    part.Transparency = 0.5
                end
            end
        end
    },
    {
        name = "Teleporting Steps",
        func = function()
            game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                game.Players.LocalPlayer.Character:MoveTo(game.Players.LocalPlayer.Character.Position + Vector3.new(math.random(-5,5), 0, math.random(-5,5)))
            end)
        end
    },
    {
        name = "Floating",
        func = function()
            local char = game.Players.LocalPlayer.Character
            char.Humanoid.HipHeight = 5
        end
    },
    {
        name = "Ragdoll Physics",
        func = function()
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
        end
    },
    {
        name = "Pixelated",
        func = function()
            local blur = Instance.new("BlurEffect")
            blur.Size = 20
            blur.Parent = game.Lighting
        end
    },
    {
        name = "Speed Lines",
        func = function()
            local blur = Instance.new("BlurEffect")
            blur.Size = 10
            blur.Parent = game.Lighting
        end
    },
    {
        name = "Sepia Filter",
        func = function()
            local color = Instance.new("ColorCorrectionEffect")
            color.Saturation = -0.5
            color.TintColor = Color3.fromRGB(255, 222, 189)
            color.Parent = game.Lighting
        end
    },
    {
        name = "Negative Colors",
        func = function()
            local color = Instance.new("ColorCorrectionEffect")
            color.Saturation = -1
            color.Contrast = 1
            color.Parent = game.Lighting
        end
    },
    {
        name = "Thermal Vision",
        func = function()
            local color = Instance.new("ColorCorrectionEffect")
            color.TintColor = Color3.fromRGB(255, 89, 89)
            color.Parent = game.Lighting
        end
    },
    {
        name = "Night Vision",
        func = function()
            local color = Instance.new("ColorCorrectionEffect")
            color.TintColor = Color3.fromRGB(89, 255, 89)
            color.Brightness = 0.2
            color.Parent = game.Lighting
        end
    },
    {
        name = "Underwater Effect",
        func = function()
            local blur = Instance.new("BlurEffect")
            blur.Size = 4
            local color = Instance.new("ColorCorrectionEffect")
            color.TintColor = Color3.fromRGB(89, 89, 255)
            blur.Parent = game.Lighting
            color.Parent = game.Lighting
        end
    },
    {
        name = "Dramatic Camera",
        func = function()
            workspace.CurrentCamera.FieldOfView = 50
        end
    },
    {
        name = "Wide Angle",
        func = function()
            workspace.CurrentCamera.FieldOfView = 120
        end
    },
    {
        name = "Tilted World",
        func = function()
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(0, 0, math.rad(45))
        end
    },
    {
        name = "Random Teleports",
        func = function()
            while wait(5) do
                local char = game.Players.LocalPlayer.Character
                char:MoveTo(char.Position + Vector3.new(math.random(-10,10), 0, math.random(-10,10)))
            end
        end
    },
    {
        name = "Bouncy World",
        func = function()
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Elasticity = 1
                end
            end
        end
    },
    {
        name = "Mirror Movement",
        func = function()
            local char = game.Players.LocalPlayer.Character
            char.Humanoid.Running:Connect(function(speed)
                char:MoveTo(char.Position + (char.PrimaryPart.CFrame.LookVector * -speed))
            end)
        end
    },
    {
        name = "Random Sizes",
        func = function()
            while wait(1) do
                game.Players.LocalPlayer.Character:ScaleTo(math.random(5,20)/10)
            end
        end
    },
    {
        name = "Glitch Effect",
        func = function()
            while wait(0.1) do
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = math.random(-1,1)
            end
        end
    },
    {
        name = "Cartoon Outline",
        func = function()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    local highlight = Instance.new("SelectionBox")
                    highlight.Parent = part
                    highlight.Adornee = part
                end
            end
        end
    },
    {
        name = "Random Materials",
        func = function()
            local materials = {Enum.Material.Plastic, Enum.Material.Wood, Enum.Material.Slate, Enum.Material.Concrete, Enum.Material.Glass}
            while wait(1) do
                for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Material = materials[math.random(1,#materials)]
                    end
                end
            end
        end
    },
    {
        name = "Crazy Colors",
        func = function()
            while wait(0.1) do
                for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Color = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
                    end
                end
            end
        end
    },
    {
        name = "Tornado Spin",
        func = function()
            while wait() do
                game.Players.LocalPlayer.Character:PivotTo(game.Players.LocalPlayer.Character:GetPivot() * CFrame.Angles(0, math.rad(5), 0))
            end
        end
    },
    {
        name = "Parkour Mode",
        func = function()
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
        end
    },
    {
        name = "Matrix Mode",
        func = function()
            game.Lighting.Ambient = Color3.fromRGB(0, 255, 0)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 255, 0)
            game.Lighting.TimeOfDay = "00:00:00"
        end
    },
    {
        name = "Cursed Walking",
        func = function()
            local char = game.Players.LocalPlayer.Character
            char.Humanoid.Running:Connect(function()
                char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(math.random(-45,45)), 0)
            end)
        end
    },
    {
        name = "Spy Mode",
        func = function()
            local character = game.Players.LocalPlayer.Character
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 1
                end
            end
        end
    },
    {
        name = "Spy Map",
        func = function()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not game.Players.LocalPlayer.Character:IsAncestorOf(obj) then
                    local tween = game:GetService("TweenService"):Create(obj, TweenInfo.new(1), {Transparency = 1})
                    tween:Play()
                end
            end
            
            game.Players.LocalPlayer.CharacterAdded:Connect(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local tween = game:GetService("TweenService"):Create(obj, TweenInfo.new(1), {Transparency = 0})
                        tween:Play()
                    end
                end
            end)
        end
    }
}

MainTab:AddButton({
    Name = "Roll Random Modifier",
    Callback = function()
        local selectedModifier = modifiers[math.random(1, #modifiers)]
        OrionLib:MakeNotification({
            Name = "New Modifier!",
            Content = "You got: " .. selectedModifier.name,
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        selectedModifier.func()
    end
})

OrionLib:Init()
