local Components = {}

local App
local Theme

local ComponentType = {
    Frame = "Frame",
    Label = "Label",
    Button = "Button",
    TextBox = "TextBox",
    Image = "Image",
    ScrollingFrame = "ScrollingFrame"
}

--==========================
-- Funciones privadas
--==========================

local function ApplyProperties(Object, Properties)

    Properties = Properties or {}
    
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

local function ApplyTheme(Object, ObjectType)

    if ObjectType == ComponentType.Frame then

        Object.BackgroundColor3 = Theme.Colors.Background
        Object.BorderSizePixel = 0

    elseif ObjectType == ComponentType.Label then

        Object.BackgroundTransparency = 1
        Object.BorderSizePixel = 0

        Object.TextColor3 = Theme.Colors.Text
        Object.Font = Theme.Fonts.Text

        Object.TextScaled = false
        Object.TextWrapped = false

    elseif ObjectType == ComponentType.Button then

        Object.BackgroundColor3 = Theme.Colors.Accent
        Object.BorderSizePixel = 0

        Object.TextColor3 = Theme.Colors.Text
        Object.Font = Theme.Fonts.Button

        Object.TextScaled = false
        Object.AutoButtonColor = false

    elseif ObjectType == ComponentType.TextBox then

        Object.BackgroundColor3 = Theme.Colors.Secondary
        Object.BorderSizePixel = 0

        Object.TextColor3 = Theme.Colors.Text
        Object.PlaceholderColor3 = Theme.Colors.TextDark

        Object.Font = Theme.Fonts.Text

        Object.TextScaled = false
        Object.ClearTextOnFocus = false

    end

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
    
    ApplyTheme(Frame, ComponentType.Frame)
    
    ApplyProperties(Frame, Properties)
    
    ApplyCorner(Frame)
    ApplyStroke(Frame)
    
    return Frame

end

function Components.CreateLabel(Properties)

   local Label = Instance.new("TextLabel")

    ApplyTheme(Label, ComponentType.Label)
    
    ApplyProperties(Label, Properties)
    
    return Label

end

function Components.CreateButton(Properties)

    local Button = Instance.new("TextButton")

    ApplyTheme(Button, ComponentType.Button)
    
    ApplyProperties(Button, Properties)
    
    ApplyCorner(Button)
    ApplyStroke(Button)
    
    return Button

end

function Components.CreateTextBox(Properties)

    local Box = Instance.new("TextBox")

    ApplyTheme(Box, ComponentType.TextBox)

    ApplyProperties(Box, Properties)

    ApplyCorner(Box)
    ApplyStroke(Box)

    return Box

end

function Components.CreateImage(Properties)

    local Image = Instance.new("ImageLabel")

    Image.BackgroundTransparency = 1
    Image.BorderSizePixel = 0

    ApplyProperties(Image, Properties)

    return Image

end

return Components
