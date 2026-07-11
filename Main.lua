local TweenService = game:GetService("TweenService")
local Base =
    "https://raw.githubusercontent.com/PrionHub/Login/main/"

local Theme =
    loadstring(game:HttpGet(Base.."Modules/UI/Theme.lua"))()

local Components =
    loadstring(game:HttpGet(Base.."Modules/UI/Components.lua"))()

local Build =
    loadstring(game:HttpGet(Base.."Modules/UI/Build.lua"))()

local Particles =
    loadstring(game:HttpGet(Base.."Modules/UI/Particles.lua"))()

local Assets =
    loadstring(game:HttpGet(Base.."Modules/Utils/Assets.lua"))()

local Remember =
    loadstring(game:HttpGet(Base.."Modules/Core/Remember.lua"))()

-- Crear App primero
local App = {}

App.Theme = Theme
App.Components = Components
App.Build = Build
App.Assets = Assets
App.Particles = Particles
App.Remember = Remember

-- Inicializar módulos
Components.Init(App)
Build.Init(App)

-- Construir la interfaz
local UI = Build.Build()

local RegisterMode = false

Particles.Create(UI.MainFrame, UI.ParticleContainer)

UI.SwitchMode.MouseButton1Click:Connect(function()

    RegisterMode = not RegisterMode

    local NewSize
    local RememberPos
    local LoginPos
    local GetKeyPos
    local SwitchPos

    if RegisterMode then

        UI.KeyBox.Visible = true

        UI.LoginButton.Text = "Register"

        UI.SwitchMode.Text =
            "Already have an account? Login"

        NewSize = UDim2.fromOffset(280, 380)

        RememberPos = UDim2.fromOffset(30, 242)

        LoginPos = UDim2.fromOffset(20, 275)

        GetKeyPos = UDim2.fromOffset(20, 320)

        SwitchPos = UDim2.fromOffset(30, 355)

    else

        UI.LoginButton.Text = "Login"

        UI.SwitchMode.Text =
            "Don't have an account? Register"

        NewSize = UDim2.fromOffset(280, 330)

        RememberPos = UDim2.fromOffset(30, 200)

        LoginPos = UDim2.fromOffset(20, 230)

        GetKeyPos = UDim2.fromOffset(20, 275)

        SwitchPos = UDim2.fromOffset(30, 310)

    end

    local TweenInfo = TweenInfo.new(

        0.35,

        Enum.EasingStyle.Quint,

        Enum.EasingDirection.Out

    )

    TweenService:Create(
        UI.MainFrame,
        TweenInfo,
        {Size = NewSize}
    ):Play()

    TweenService:Create(
        UI.Remember.Instance,
        TweenInfo,
        {Position = RememberPos}
    ):Play()

    TweenService:Create(
        UI.LoginButton,
        TweenInfo,
        {Position = LoginPos}
    ):Play()

    TweenService:Create(
        UI.GetKeyButton,
        TweenInfo,
        {Position = GetKeyPos}
    ):Play()

    TweenService:Create(
        UI.SwitchMode,
        TweenInfo,
        {Position = SwitchPos}
    ):Play()

    if not RegisterMode then

        task.delay(0.35, function()

            UI.KeyBox.Visible = false

        end)

    end

end)

local Data = Remember.Load()

if Data then

    UI.UsernameBox.Text = Data.Username

    UI.PasswordBox.Text = Data.Password

    UI.Remember:SetValue(true)

end
