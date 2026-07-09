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

return Components
