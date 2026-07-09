local Components = {}

local App
local Theme

local ComponentType = {
    Frame = "Frame",
    Label = "Label",
    Button = "Button",
    TextBox = "TextBox",
    Image = "Image",
    CheckBox = "CheckBox",
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
    Stroke.Color = Theme.Colors.Border
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
        Object.ZIndex = 10

        Object.TextColor3 = Theme.Colors.Text
        Object.Font = Theme.Fonts.Text

        Object.TextScaled = false
        Object.TextWrapped = false

    elseif ObjectType == ComponentType.Button then

        Object.BackgroundColor3 = Theme.Colors.Accent
        Object.BorderSizePixel = 0
        Object.ZIndex = 10

        Object.TextColor3 = Theme.Colors.Text
        Object.Font = Theme.Fonts.Button

        Object.TextScaled = false
        Object.AutoButtonColor = false

    elseif ObjectType == ComponentType.TextBox then

        Object.BackgroundColor3 = Theme.Colors.Secondary
        Object.BorderSizePixel = 0
        Object.ZIndex = 10

        Object.Text = ""

        Object.TextColor3 = Theme.Colors.Text
        Object.PlaceholderColor3 = Theme.Colors.TextDark

        Object.Font = Theme.Fonts.Text

        Object.TextScaled = false
        Object.ClearTextOnFocus = false

    elseif ObjectType == ComponentType.CheckBox then

        Object.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Object.BorderSizePixel = 0
    
        Object.Text = ""
    
        Object.AutoButtonColor = false
        
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
    Image.ZIndex = 10

    ApplyProperties(Image, Properties)

    return Image

end

function Components.CreateCheckBox(Properties)

    local Text = Properties.Text

    local NewProperties = table.clone(Properties)
    NewProperties.Text = nil

    local Box = Instance.new("TextButton")

    ApplyTheme(Box, ComponentType.CheckBox)

    Box.Size = UDim2.fromOffset(18, 18)

    ApplyProperties(Box, NewProperties)

    local Mark = Instance.new("TextLabel")

    Mark.Name = "Mark"

    Mark.Size = UDim2.fromScale(1, 1)

    Mark.BackgroundTransparency = 1

    Mark.Text = ""

    Mark.TextColor3 = Theme.Colors.Accent

    Mark.TextSize = 16

    Mark.Font = Enum.Font.SourceSansBold

    Mark.Parent = Box

    local Label = Instance.new("TextLabel")

    Label.Name = "Label"

    Label.BackgroundTransparency = 1

    Label.Position = UDim2.fromOffset(25, 0)

    Label.Size = UDim2.fromOffset(150, 18)

    Label.Text = Text or ""

    Label.TextColor3 = Theme.Colors.Text

    Label.Font = Theme.Fonts.Text

    Label.TextSize = 14

    Label.TextXAlignment = Enum.TextXAlignment.Left

    Label.Parent = Box

    local Enabled = false

    Box.MouseButton1Click:Connect(function()
    
        Enabled = not Enabled
    
        Mark.Text = Enabled and "✓" or ""
    
    end)
    
    function Box:SetValue(Value)
    
        Enabled = Value
    
        Mark.Text = Enabled and "✓" or ""
    
    end
    
    function Box:GetValue()
    
        return Enabled
    
    end
    
    ApplyCorner(Box)
    
    return Box

end

return Components
