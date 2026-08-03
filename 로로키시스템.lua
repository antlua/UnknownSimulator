local Players = game:GetService("Players")
local player = Players.LocalPlayer

local scriptUrl = "https://api.jnkie.com/api/v1/luascripts/public/24a4006e6b4cb21953dfb8d05ecbae53488fb841e8b31bae633a501ebfa575a8/download"
local keyLink = "https://jnkie.com/get-key/rorokey"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JnkieKeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 180)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Jnkie Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.85, 0, 0, 40)
TextBox.Position = UDim2.new(0.075, 0, 0, 55)
TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextBox.BorderSizePixel = 0
TextBox.PlaceholderText = "여기에 키를 입력하세요..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14
TextBox.Font = Enum.Font.Gotham
TextBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = TextBox

local CopyButton = Instance.new("TextButton")
CopyButton.Size = UDim2.new(0.4, 0, 0, 35)
CopyButton.Position = UDim2.new(0.075, 0, 0, 115)
CopyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CopyButton.BorderSizePixel = 0
CopyButton.Text = "키 링크 복사"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 13
CopyButton.Font = Enum.Font.GothamSemibold
CopyButton.Parent = MainFrame

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 6)
CopyCorner.Parent = CopyButton

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.4, 0, 0, 35)
SubmitButton.Position = UDim2.new(0.525, 0, 0, 115)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitButton.BorderSizePixel = 0
SubmitButton.Text = "완료"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 13
SubmitButton.Font = Enum.Font.GothamSemibold
SubmitButton.Parent = MainFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 6)
SubmitCorner.Parent = SubmitButton

CopyButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(keyLink)
		CopyButton.Text = "복사 완료!"
		task.wait(1.5)
		CopyButton.Text = "키 링크 복사"
	else
		CopyButton.Text = "지원 X"
		task.wait(1.5)
		CopyButton.Text = "키 링크 복사"
	end
end)

SubmitButton.MouseButton1Click:Connect(function()
	local inputKey = TextBox.Text
	
	if inputKey ~= "" then
		SubmitButton.Text = "완료"
		
		getgenv().SCRIPT_KEY = inputKey
		
		ScreenGui:Destroy()
		loadstring(game:HttpGet(scriptUrl))()
	else
		SubmitButton.Text = "키를 입력하세요!"
		task.wait(1.5)
		SubmitButton.Text = "완료"
	end
end) -- 내가 특별히 난독화 안하고 업로드 하는거임 스크는 난독화됨
