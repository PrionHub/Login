local Build = {}

local App
local Theme
local Components
local Assets

--==========================
-- Inicialización
--==========================

function Build.Init(Application)

    App = Application
    Components = App.Components
    Assets = App.Assets
    Theme = App.Theme

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

        Size = UDim2.fromOffset(280, 380),

        Position = UDim2.fromScale(0.5, 0.5),

        AnchorPoint = Vector2.new(0.5, 0.5),

        ClipsDescendants = true

    })

    return MainFrame

end

local function CreateHeader(UI)

    UI.Logo = Components.CreateImage({

        Parent = UI.MainFrame,

        Size = UDim2.fromOffset(140, 70),

        Position = UDim2.fromOffset(70, 15)

    })

    Assets.LoadImage(UI.Logo)

    UI.Title = Components.CreateLabel({

        Parent = UI.MainFrame,

        FontFace = Theme.Fonts.Title,

        TextSize = 13,

        Size = UDim2.new(1, 0, 0, 30),

        Position = UDim2.fromOffset(0, 90),

        Text = "PRION HUB | LOGIN SYSTEM"

    })

end

local function CreateBody(UI)

    UI.UsernameBox = Components.CreateTextBox({

        Parent = UI.MainFrame,

        Size = UDim2.fromOffset(240, 32),

        Position = UDim2.fromOffset(20, 115),

        PlaceholderText = "  Username / Usuario...",

        TextXAlignment = Enum.TextXAlignment.Left,

        TextSize = 14

    })

    UI.PasswordBox = Components.CreateTextBox({

        Parent = UI.MainFrame,

        Size = UDim2.fromOffset(240, 32),

        Position = UDim2.fromOffset(20, 155),

        PlaceholderText = "  Password / Contraseña...",

        TextXAlignment = Enum.TextXAlignment.Left,

        TextSize = 14

    })

    UI.KeyBox = Components.CreateTextBox({

        Parent = UI.MainFrame,

        Size = UDim2.fromOffset(240, 32),

        Position = UDim2.fromOffset(20, 195),

        PlaceholderText = "  Key / Llave (Only for Register)...",

        TextXAlignment = Enum.TextXAlignment.Left,

        TextSize = 14

    })

end

local function CreateFooter(UI)

    UI.LoginButton = Components.CreateButton({

        Parent = UI.MainFrame,

        Size = UDim2.fromOffset(240, 35),

        Position = UDim2.fromOffset(20, 275),

        Text = "Login / Register",

        TextSize = 14

    })

    UI.GetKeyButton = Components.CreateButton({

        Parent = UI.MainFrame,

        Size = UDim2.fromOffset(240, 35),

        Position = UDim2.fromOffset(20, 320),

        Text = "Obtener Llave | Get Key",

        TextSize = 14,

        BackgroundColor3 = Color3.fromRGB(50, 50, 50)

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
