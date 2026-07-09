local Build = {}

local App
local Components

--==========================
-- Inicialización
--==========================

function Build.Init(Application)

    App = Application
    Components = App.Components

end

--==========================
-- Funciones privadas
--==========================

local function CreateScreenGui()

    local ScreenGui = Instance.new("ScreenGui")

    ScreenGui.Name = "PrionHub"

    ScreenGui.ResetOnSpawn = false

    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ScreenGui.Parent = game:GetService("CoreGui")

    return ScreenGui

end

local function CreateMainFrame(ScreenGui)

    local MainFrame = Components.CreateFrame({

        Parent = ScreenGui,

        Size = UDim2.fromOffset(450, 300),

        Position = UDim2.fromScale(0.5, 0.5),

        AnchorPoint = Vector2.new(0.5, 0.5)

    })

    return MainFrame

end

local function CreateHeader(UI)

    UI.Title = Components.CreateLabel({

        Parent = UI.MainFrame,

        Size = UDim2.new(1, 0, 0, 50),

        Position = UDim2.fromOffset(0, 20),

        Text = "Prion Hub"

    })

end

local function CreateBody(UI)

    UI.KeyBox = Components.CreateTextBox({

        Parent = UI.MainFrame,

        Size = UDim2.fromOffset(320, 45),

        Position = UDim2.fromOffset(65, 120),

        PlaceholderText = "Enter your key..."

    })

    UI.LoginButton = Components.CreateButton({

        Parent = UI.MainFrame,

        Size = UDim2.fromOffset(200, 45),

        Position = UDim2.fromOffset(125, 190),

        Text = "Login"

    })

end

local function CreateFooter(UI)

    UI.Status = Components.CreateLabel({

        Parent = UI.MainFrame,

        Size = UDim2.new(1, 0, 0, 30),

        Position = UDim2.fromOffset(0, 255),

        Text = "Ready"

    })

end

--==========================
-- Construcción
--==========================

function Build.Build()

    local UI = {}

    UI.ScreenGui = CreateScreenGui()

    UI.MainFrame = CreateMainFrame(UI.ScreenGui)

    CreateHeader(UI)

    CreateBody(UI)

    CreateFooter(UI)

    return UI

end

return Build
