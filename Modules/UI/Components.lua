local Components = {}

local App
local Theme

function Components.Init(Application)

    App = Application
    Theme = App.Theme

end

function Components.CreateFrame(Properties)

    local Frame = Instance.new("Frame")

    Frame.BackgroundColor3 = Theme.Colors.Background
    Frame.BorderSizePixel = 0

    Frame.Size = Properties.Size or UDim2.new()
    Frame.Position = Properties.Position or UDim2.new()
    Frame.AnchorPoint = Properties.AnchorPoint or Vector2.zero

    if Properties.Parent then
        Frame.Parent = Properties.Parent
    end

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = Theme.CornerRadius
    Corner.Parent = Frame

    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = Theme.StrokeThickness
    Stroke.Color = Theme.Colors.Accent
    Stroke.Transparency = 0.4
    Stroke.Parent = Frame

    return Frame

end

return Components
