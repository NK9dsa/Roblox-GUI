local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.Enabled = true -- แสดง GUI เริ่มต้น

-- สร้างหน้าต่างหลัก
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.4, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

-- สร้างหัวข้อ UI
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Text = "Auto Egg Opener"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = mainFrame

-- Toggle Switch
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 260, 0, 50)
toggle.Position = UDim2.new(0.5, -130, 0.3, 0)
toggle.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
toggle.Text = "Start"
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.SourceSansBold
toggle.TextSize = 18
toggle.Parent = mainFrame

-- ปุ่มซ่อน UI
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 260, 0, 30)
closeButton.Position = UDim2.new(0.5, -130, 0.8, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "Hide UI"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 16
closeButton.Parent = mainFrame

-- สร้างไอคอนแสดง UI
local icon = Instance.new("ImageButton")
icon.Parent = gui
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 10, 0.9, 0)
icon.Image = "rbxassetid://3926305904" -- เปลี่ยนเป็นไอคอนที่ต้องการ
icon.BackgroundTransparency = 1
icon.Visible = false

-- ตัวแปรควบคุมการทำงาน
local isRunning = false

-- ฟังก์ชันเปิด/ปิดการทำงาน
toggle.MouseButton1Click:Connect(function()
    isRunning = not isRunning
    toggle.Text = isRunning and "Stop" or "Start"
    toggle.BackgroundColor3 = isRunning and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(70, 130, 180)

    if isRunning then
        while isRunning do
            local args = {
                [1] = "PurchaseHatchEgg",
                [2] = "39700045-671c-4c27-85c7-b4c810f19077",
                [3] = "M7_Egg1",
                [4] = "Eggs"
            }
            game:GetService("ReplicatedStorage").Postie.Sent:FireServer(unpack(args))
            wait(1) -- ป้องกันการส่งคำขอถี่เกินไป
        end
    end
end)

-- ฟังก์ชันซ่อน UI
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    icon.Visible = true
end)

-- ฟังก์ชันแสดง UI
icon.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    icon.Visible = false
end)
