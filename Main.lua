
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

local Auth =
    loadstring(game:HttpGet(Base.."Modules/Core/Auth.lua"))()

local Animations =
    loadstring(game:HttpGet(Base.."Modules/UI/Animations.lua"))()

-- Crear App primero
local App = {}

App.Theme = Theme
App.Components = Components
App.Build = Build
App.Assets = Assets
App.Particles = Particles
App.Remember = Remember
App.Auth = Auth
App.Animations = Animations

-- Inicializar módulos
Components.Init(App)
Build.Init(App)
Auth.Init(App)

-- Construir la interfaz
local UI = Build.Build()

Particles.Create(UI.MainFrame, UI.ParticleContainer)

Animations.Setup(UI)

local Data = Remember.Load()

if Data then

    UI.UsernameBox.Text = Data.Username

    UI.PasswordBox.Text = Data.Password

    UI.Remember:SetValue(true)

end
