local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

local hwid = "Unavailable"

pcall(function()
    if typeof(gethwid) == "function" then
        local ok, result = pcall(gethwid)
        if ok and result then
            hwid = tostring(result)
        end
    elseif typeof(get_hwid) == "function" then
        local ok, result = pcall(get_hwid)
        if ok and result then
            hwid = tostring(result)
        end
    end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "HWIDDisplay"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local box = Instance.new("Frame")
box.Size = UDim2.new(0, 370, 0, 310)
box.Position = UDim2.new(0.5, -185, 0.5, -155)
box.BackgroundColor3 = Color3.fromRGB(22, 17, 43)
box.BorderSizePixel = 1
box.BorderColor3 = Color3.fromRGB(100, 70, 150)
box.Parent = gui

local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(1, 0, 0, 3)
topLine.BackgroundColor3 = Color3.fromRGB(168, 85, 247)
topLine.BorderSizePixel = 0
topLine.Parent = box

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 32)
title.Position = UDim2.new(0, 15, 0, 15)
title.BackgroundTransparency = 1
title.Text = "HWID VERIFICATION"
title.TextColor3 = Color3.fromRGB(225, 205, 255)
title.TextSize = 19
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = box

local line = Instance.new("Frame")
line.Size = UDim2.new(1, -30, 0, 1)
line.Position = UDim2.new(0, 15, 0, 52)
line.BackgroundColor3 = Color3.fromRGB(65, 50, 90)
line.BorderSizePixel = 0
line.Parent = box

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -30, 0, 48)
label.Position = UDim2.new(0, 15, 0, 62)
label.BackgroundTransparency = 1
label.Text = "Copy your HWID, then join our Discord server and create a ticket. Send your HWID in the ticket to receive your Lifetime Role."
label.TextColor3 = Color3.fromRGB(200, 195, 215)
label.TextSize = 12
label.Font = Enum.Font.Gotham
label.TextWrapped = true
label.TextXAlignment = Enum.TextXAlignment.Left
label.TextYAlignment = Enum.TextYAlignment.Top
label.Parent = box

local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -30, 0, 32)
infoLabel.Position = UDim2.new(0, 15, 0, 112)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "Your HWID is required for verification and access."
infoLabel.TextColor3 = Color3.fromRGB(155, 150, 170)
infoLabel.TextSize = 11
infoLabel.Font = Enum.Font.GothamMedium
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.Parent = box

local hwidLabel = Instance.new("TextLabel")
hwidLabel.Size = UDim2.new(1, -30, 0, 35)
hwidLabel.Position = UDim2.new(0, 15, 0, 145)
hwidLabel.BackgroundColor3 = Color3.fromRGB(16, 13, 32)
hwidLabel.BorderSizePixel = 1
hwidLabel.BorderColor3 = Color3.fromRGB(65, 50, 90)
hwidLabel.Text = hwid
hwidLabel.TextColor3 = Color3.fromRGB(205, 195, 225)
hwidLabel.TextSize = 11
hwidLabel.Font = Enum.Font.Code
hwidLabel.TextXAlignment = Enum.TextXAlignment.Center
hwidLabel.TextYAlignment = Enum.TextYAlignment.Center
hwidLabel.TextTruncate = Enum.TextTruncate.AtEnd
hwidLabel.Parent = box

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0.5, -20, 0, 42)
copyButton.Position = UDim2.new(0, 15, 0, 195)
copyButton.BackgroundColor3 = Color3.fromRGB(168, 85, 247)
copyButton.BorderSizePixel = 0
copyButton.AutoButtonColor = false
copyButton.Text = "COPY HWID"
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.TextSize = 14
copyButton.Font = Enum.Font.GothamBold
copyButton.Parent = box

local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(0.5, -20, 0, 42)
discordButton.Position = UDim2.new(0.5, 5, 0, 195)
discordButton.BackgroundColor3 = Color3.fromRGB(88, 70, 160)
discordButton.BorderSizePixel = 0
discordButton.AutoButtonColor = false
discordButton.Text = "DISCORD"
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextSize = 14
discordButton.Font = Enum.Font.GothamBold
discordButton.Parent = box

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -30, 0, 25)
status.Position = UDim2.new(0, 15, 0, 250)
status.BackgroundTransparency = 1
status.Text = hwid ~= "Unavailable" and "● HWID DETECTED" or "● HWID UNAVAILABLE"
status.TextColor3 = hwid ~= "Unavailable"
    and Color3.fromRGB(170, 255, 190)
    or Color3.fromRGB(255, 130, 130)
status.TextSize = 11
status.Font = Enum.Font.GothamMedium
status.TextXAlignment = Enum.TextXAlignment.Center
status.Parent = box

copyButton.MouseButton1Click:Connect(function()
    if typeof(setclipboard) == "function" and hwid ~= "Unavailable" then
        setclipboard(hwid)
        copyButton.Text = "COPIED!"

        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "HWID",
                Text = "Your HWID has been copied!",
                Duration = 3
            })
        end)

        task.delay(1.5, function()
            if copyButton.Parent then
                copyButton.Text = "COPY HWID"
            end
        end)
    end
end)

discordButton.MouseButton1Click:Connect(function()
    if typeof(setclipboard) == "function" then
        setclipboard("https://discord.gg/n9gtmefsjc")
        discordButton.Text = "LINK COPIED!"

        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "DISCORD",
                Text = "Discord invite copied!",
                Duration = 3
            })
        end)

        task.delay(1.5, function()
            if discordButton.Parent then
                discordButton.Text = "DISCORD"
            end
        end)
    end
end)
