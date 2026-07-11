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

    if UI.Mode == "Login" then

        UI.Mode = "Register"

        UI.KeyBox.Visible = true

        UI.LoginButton.Text = "Register"

        UI.SwitchMode.Text =
            "Already have an account? Login"

    else

        UI.Mode = "Login"

        UI.KeyBox.Visible = false

        UI.LoginButton.Text = "Login"

        UI.SwitchMode.Text =
            "Don't have an account? Register"

    end

end)

local Data = Remember.Load()

if Data then

    UI.UsernameBox.Text = Data.Username

    UI.PasswordBox.Text = Data.Password

    UI.Remember:SetValue(true)

end
