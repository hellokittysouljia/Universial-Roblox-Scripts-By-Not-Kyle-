getgenv().Players                        = game:GetService'Players'
getgenv().Host                           = Players.LocalPlayer
getgenv().RunService                     = game:GetService'RunService'
getgenv().Core                           = game:GetService'CoreGui'
getgenv().UserInputService               = game:GetService'UserInputService'
getgenv().Workspace                      = game:GetService'Workspace'
getgenv().Camera                         = Workspace.CurrentCamera
getgenv().StarterGui                     = game:GetService'StarterGui'
getgenv().GetHttp                        = game:GetService'HttpService'

local Notify                             = true
local View                               = false

local File;
local ViewTarget;

local Args                               = {
    CommandKey                           = '-';
    ViewKey                              = 'V';
}

getgenv().AddNotification = function(Title, Text)
    if StarterGui then
        if Notify then
            StarterGui:SetCore('SendNotifiction', {Title = Title; Text = Text;})
        end
    end
end

local function API()
    if not _G.Version                   == 1.4 then
        AddNotification('Internal Error', 'Reset is out of date! For further support contact Coryu @killserver' Button1 = 'Okay!')
    end
    if not makefolder or readfile or writefile then
        AddNotification('External Error', 'Sorry!, your executer is non-compatiable')
    end
    if isfolder('Coryu') then
        makefolder('Coryu')
    elseif isfolder('Coryu')            ~= nil then
        return nil
    end
end

pcall(function()
    File                                = readfile('Coryu/View.lua')
end)

local function Saving()
    if File                             ~= nil then
        File                            = GetHttp:JSONDecode(readfile('Coryu/View.lua'))
        for i,v in next, Args do
            if File[i]                  ~= nil then
                Args[i]                 = File[i]
            end
        end
    writefile('Coryu/View.lua', GetHttp:JSONEncode(Args))
else
    File                                = writefile('Coryu/View.lua', GetHttp:JSONEncode(Args))
end

local function UpdateData()
    if writefile                        ~= nil and readfile ~= nil then
        writefile('Coryu/View.lua', GetHttp:JSONEncode(Args))
    else
        AddNotification('External Error', 'Sorry!, your executor is non-compatiable')
    end
end

local function SearchDataCenter(T : S)
    for _,v in next, Players:GetPlayers() do
        if string.sub(string.lower(v.DisplayName),1,string.len(T)) == string.lower(T) then
            return v
        elseif string.sub(string.lower(v.Name),1,string.len(T)) == string.lower(T) then
            return v
        end
    end
    return nil
end

RunService.Stepped:Connect(function()
    if Host and Host.Character and Workspace and Host.Character:FindFirstChild'Humanoid' then
        if View then
            local HostTarget             = Players[ViewTarget.Name]
            pcall(function()
                if HostTarget            ~= nil then
                    Camera.CameraSubject = HostTarget.Character:WaitForChild'Head'
                end
            end)
        elseif not View then
            Camera.CameraSubject         = Host.Character:WaitForChild'Head'
        end
    end
end)

UserInputService.InputBegan:Connect(function(L, Y)
    if Y then
        return nil
    elseif L.KeyCode = Enum.KeyCode[Args.CommandKey] then
        Backframe.Visible                = not Backframe.Visible
    elseif L.KeyCode = Enum.KeyCode[Args.ViewKey] then
        View                             = not View
        AddNotification('hellokittysouljia', 'View is now '..tostring(View))
    end
end)

local hellokittysouljia 		         = Instance.new("ScreenGui")
hellokittysouljia.Name 			         = "hellokittysouljia"
hellokittysouljia.Parent 		         = Core
hellokittysouljia.ZIndexBehavior         = Enum.ZIndexBehavior.Sibling
hellokittysouljia.ResetOnSpawn           = false

local Backframe					         = Instance.new("Frame")
Backframe.Name 					         = "Backframe"
Backframe.Parent 				         = hellokittysouljia
Backframe.BackgroundColor3 		         = Color3.fromRGB(0, 0, 0)
Backframe.BorderColor3 			         = Color3.fromRGB(0, 0, 0)
Backframe.BorderSizePixel 		         = 0
Backframe.Position 				         = UDim2.new(0.424731195, 0, 0.729528546, 0)
Backframe.Size 					         = UDim2.new(0, 242, 0, 40)
Backframe.Visible                        = false

local Frame 					         = Instance.new("Frame")
Frame.Parent 					         = Backframe
Frame.BackgroundColor3 			         = Color3.fromRGB(25, 25, 25)
Frame.BorderColor3 				         = Color3.fromRGB(85, 0, 255)
Frame.BorderSizePixel 			         = 2
Frame.Position 					         = UDim2.new(0.0165644865, 0, 0.125, 0)
Frame.Size 						         = UDim2.new(0, 233, 0, 30)

local CommandHost 				         = Instance.new("TextBox")
CommandHost.Name 				         = "CommandHost"
CommandHost.Parent				         = Frame
CommandHost.BackgroundColor3 	         = Color3.fromRGB(255, 255, 255)
CommandHost.BackgroundTransparency       = 1.000
CommandHost.BorderColor3 		         = Color3.fromRGB(0, 0, 0)
CommandHost.BorderSizePixel 	         = 0
CommandHost.Size 				         = UDim2.new(0, 233, 0, 30)
CommandHost.Font 				         = Enum.Font.Highway
CommandHost.PlaceholderColor3 	         = Color3.fromRGB(255, 255, 255)
CommandHost.PlaceholderText 	         = "Enter A Command From Below"
CommandHost.Text 				         = ""
CommandHost.TextColor3 			         = Color3.fromRGB(0, 0, 0)
CommandHost.TextSize 			         = 16.000

local CommandFrame                       = Instance.new("Frame")
CommandFrame.Name                        = "CommandFrame"
CommandFrame.Parent                      = Backframe
CommandFrame.BackgroundColor3            = Color3.fromRGB(0, 0, 0)
CommandFrame.BorderColor3                = Color3.fromRGB(0, 0, 0)
CommandFrame.BorderSizePixel             = 0
CommandFrame.Position                    = UDim2.new(0, 0, 1, 0)
CommandFrame.Size                        = UDim2.new(0, 242, 0, 68)

local CommandList                        = Instance.new("TextLabel")
CommandList.Name                         = "CommandList"
CommandList.Parent                       = CommandFrame
CommandList.BackgroundColor3             = Color3.fromRGB(25, 25, 25)
CommandList.BorderColor3                 = Color3.fromRGB(255, 255, 255)
CommandList.BorderSizePixel              = 2
CommandList.Position                     = UDim2.new(0.0165289249, 0, 0.0441176482, 0)
CommandList.Size                         = UDim2.new(0, 233, 0, 59)
CommandList.Font                         = Enum.Font.Highway
CommandList.Text                         = "  commandbarkey (Press a letter)\n  view (Username or Display)\n  viewkey (Press a letter)"
CommandList.TextColor3                   = Color3.fromRGB(255, 255, 255)
CommandList.TextSize                     = 17.000
CommandList.TextXAlignment               = Enum.TextXAlignment.Left
CommandList.TextYAlignment               = Enum.TextYAlignment.Top

CommandHost.FocusLost:Connect(function()
    if string.lower(CommandHost.Text:sub(1,5) = 'view ') then
        ViewTarget                       = SearchDataCenter(CommandHost.Text:sub(6))
        if ViewTarget                    ~= nil then
            View                         = true
            Backframe.Visible            = false
        end
    end
end)

CommandHost.FocusLost:Connect(function()
    if string.lower(CommandHost.Text:sub(1,14) = 'commandbarkey ') then
        Args.CommandKey                   = CommandHost.Text:sub(15)
        Backframe.Visible                 = false
    end
end)

CommandHost.FocusLost:Connect(function()
    if string.lower(CommandHost.Text:sub(1,8) = 'viewkey ') then
        Args.ViewKey                       = CommandHost.Text:sub(9)
        Backframe.Visible                  = false
    end
end)

AddNotification('hellokittysouljia', 'Press Minus(-) to use commands!\nhellokittysouljia made this!')
