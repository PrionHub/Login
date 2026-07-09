local Components = {}

local App
local Theme

--==========================
-- Funciones privadas
--==========================

local function ApplyProperties(Object, Properties)

    for Property, Value in pairs(Properties) do
        if Property ~= "Parent" then
            Object[Property] = Value
        end
    end

    if Properties.Parent then
        Object.Parent = Properties.Parent
    end

end

local function ApplyCorner(Object)

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = Theme.CornerRadius
    Corner.Parent = Object

end

local function ApplyStroke(Object)

    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = Theme.StrokeThickness
    Stroke.Color = Theme.Colors.Accent
    Stroke.Transparency = 0.4
    Stroke.Parent = Object

end

--==========================
-- Inicialización
--==========================

function Components.Init(Application)

    App = Application
    Theme = App.Theme

end

--==========================
-- Componentes
--==========================

function Components.CreateFrame(Properties)

    local Frame = Instance.new("Frame")

    Frame.BackgroundColor3 = Theme.Colors.Background
    Frame.BorderSizePixel = 0

    ApplyProperties(Frame, Properties)

    ApplyCorner(Frame)
    ApplyStroke(Frame)

    return Frame

end

function Components.CreateLabel(Properties)

    local Label = Instance.new("TextLabel")

    -- Estilo por defecto
    Label.BackgroundTransparency = 1
    Label.BorderSizePixel = 0

    Label.TextColor3 = Theme.Colors.Text
    Label.Font = Theme.Fonts.Text

    Label.TextScaled = true
    Label.TextWrapped = true

    ApplyProperties(Label, Properties)

    return Label

end

function Components.CreateButton(Properties)

    local Button = Instance.new("TextButton")

    Button.BackgroundColor3 = Theme.Colors.Accent
    Button.BorderSizePixel = 0

    Button.TextColor3 = Theme.Colors.Text
    Button.Font = Theme.Fonts.Button

    Button.TextScaled = true
    Button.AutoButtonColor = false

    ApplyProperties(Button, Properties)

    ApplyCorner(Button)
    ApplyStroke(Button)

    return Button

end

function Components.CreateTextBox(Properties)

    local Box = Instance.new("TextBox")

    Box.BackgroundColor3 = Theme.Colors.Secondary
    Box.BorderSizePixel = 0

    Box.TextColor3 = Theme.Colors.Text
    Box.PlaceholderColor3 = Theme.Colors.TextDark

    Box.Font = Theme.Fonts.Text

    Box.TextScaled = true
    Box.ClearTextOnFocus = false

    ApplyProperties(Box, Properties)

    ApplyCorner(Box)
    ApplyStroke(Box)

    return Box

end

return Components
