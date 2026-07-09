local Components = {}

local App
local Theme

function Components.Init(Application)
    App = Application
    Theme = App.Theme
end

function Components.CreateFrame(Properties)

    local Frame = Instance.new("Frame")

    -- Estilo por defecto
    Frame.BackgroundColor3 = Theme.Colors.Background
    Frame.BorderSizePixel = 0

    -- Aplicar todas las propiedades enviadas
    for Property, Value in pairs(Properties) do
        if Property ~= "Parent" then
            Frame[Property] = Value
        end
    end

    -- Esquinas
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = Theme.CornerRadius
    Corner.Parent = Frame

    -- Borde
    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = Theme.StrokeThickness
    Stroke.Color = Theme.Colors.Accent
    Stroke.Transparency = 0.4
    Stroke.Parent = Frame

    -- Parent al final
    if Properties.Parent then
        Frame.Parent = Properties.Parent
    end

    return Frame

end

return Components
