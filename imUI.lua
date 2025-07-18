local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Library = {}
Library.__index = Library

function Library:CreateWindow(settings)
    settings = settings or {}
    local title = settings.Name or "🌈 imUI Hub"
    local rainbowSpeed = settings.RainbowSpeed or 5

    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "aMainUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    -- Rainbow Outline
    local outline = Instance.new("UIStroke", mainFrame)
    outline.Thickness = 3
    outline.Color = Color3.fromHSV(0, 1, 1)

    -- Title
    local titleBar = Instance.new("TextLabel")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundTransparency = 1
    titleBar.Text = title
    titleBar.TextColor3 = Color3.new(1, 1, 1)
    titleBar.TextSize = 24
    titleBar.Font = Enum.Font.GothamBold
    titleBar.Parent = mainFrame

    -- Tab Holder
    local tabHolder = Instance.new("Frame")
    tabHolder.Size = UDim2.new(1, 0, 1, -40)
    tabHolder.Position = UDim2.new(0, 0, 0, 40)
    tabHolder.BackgroundTransparency = 1
    tabHolder.Parent = mainFrame

    -- Animate rainbow
    spawn(function()
        while true do
            for hue = 0, 1, 0.01 do
                local color = Color3.fromHSV(hue, 1, 1)
                outline.Color = color
                titleBar.TextColor3 = color
                wait(0.01 / rainbowSpeed)
            end
        end
    end)

    local Window = {}

    function Window:CreateTab(tabName)
        local tabFrame = Instance.new("Frame")
        tabFrame.Size = UDim2.new(1, 0, 1, 0)
        tabFrame.BackgroundTransparency = 1
        tabFrame.Visible = true
        tabFrame.Parent = tabHolder

        local Tab = {}

        function Tab:CreateButton(buttonName, callback)
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, -20, 0, 40)
            button.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren() * 45)
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            button.TextColor3 = Color3.new(1, 1, 1)
            button.TextSize = 18
            button.Text = buttonName
            button.Font = Enum.Font.Gotham
            button.Parent = tabFrame

            -- Button rainbow
            spawn(function()
                while true do
                    for hue = 0, 1, 0.01 do
                        local color = Color3.fromHSV(hue, 1, 1)
                        button.TextColor3 = color
                        wait(0.02 / rainbowSpeed)
                    end
                end
            end)

            button.MouseButton1Click:Connect(callback)
        end

        return Tab
    end

    return Window
end

return Library
