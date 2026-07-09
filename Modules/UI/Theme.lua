local Theme = {}

-- Colores
Theme.Colors = {
    Background = Color3.fromRGB(15, 15, 15),
    Secondary = Color3.fromRGB(25, 25, 25),
    Accent = Color3.fromRGB(0, 170, 255),

    Text = Color3.fromRGB(255, 255, 255),
    TextDark = Color3.fromRGB(180, 180, 180),

    Success = Color3.fromRGB(80, 200, 120),
    Error = Color3.fromRGB(255, 80, 80)
}

-- Fuentes
Theme.Fonts = {
    Title = Font.fromName("Michroma"),
    Text = Enum.Font.SourceSans,
    Button = Enum.Font.SourceSansBold
}

-- Bordes
Theme.CornerRadius = UDim.new(0, 8)

-- Grosor de borde
Theme.StrokeThickness = 1.5

return Theme
