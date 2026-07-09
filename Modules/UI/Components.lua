local Components = {}

function Components.CreateFrame(Properties)

    local Frame = Instance.new("Frame")

    Frame.BackgroundColor3 = Theme.Colors.Background
    Frame.BorderSizePixel = 0

    if Properties.Size then
        Frame.Size = Properties.Size
    end

    if Properties.Position then
        Frame.Position = Properties.Position
    end

    if Properties.AnchorPoint then
        Frame.AnchorPoint = Properties.AnchorPoint
    end

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
