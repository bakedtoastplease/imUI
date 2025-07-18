local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local imUI = {}
imUI.__index = imUI

function imUI:CreateWindow(title)
    local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    gui.Name = "imUI"
    gui.ResetOnSpawn = false

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 400, 0, 500)
    frame.Position = UDim2.new(0.5, -200, 0.5, -250)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.Active = true
    frame.Draggable = true

    local titleBar = Instance.new("TextLabel", frame)
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.Text = title or "🌈 imUI"
    titleBar.TextColor3 = Color3.new(1, 1, 1)
    titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    titleBar.Font = Enum.Font.GothamBold
    titleBar.TextSize = 22

    -- Радужная анимация
    spawn(function()
        while task.wait() do
            for hue = 0, 1, 0.01 do
                titleBar.TextColor3 = Color3.fromHSV(hue, 1, 1)
                task.wait(0.03)
            end
        end
    end)

    local container = Instance.new("Frame", frame)
    container.Size = UDim2.new(1, 0, 1, -40)
    container.Position = UDim2.new(0, 0, 0, 40)
    container.BackgroundTransparency = 1

    local Window = {}

    function Window:CreateButton(text, callback)
        local button = Instance.new("TextButton", container)
        button.Size = UDim2.new(1, -20, 0, 40)
        button.Position = UDim2.new(0, 10, 0, #container:GetChildren() * 45)
        button.Text = text
        button.Font = Enum.Font.Gotham
        button.TextSize = 18
        button.TextColor3 = Color3.new(1,1,1)
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        button.MouseButton1Click:Connect(callback)

        -- Радуга на кнопках
        spawn(function()
            while task.wait() do
                for hue = 0, 1, 0.01 do
                    button.TextColor3 = Color3.fromHSV(hue, 1, 1)
                    task.wait(0.05)
                end
            end
        end)
    end

    return Window
end

return imUI
