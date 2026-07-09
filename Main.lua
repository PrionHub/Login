local Base =
    "https://raw.githubusercontent.com/PrionHub/Login/main/"

local Theme =
    loadstring(game:HttpGet(Base.."Modules/UI/Theme.lua"))()

local Components =
    loadstring(game:HttpGet(Base.."Modules/UI/Components.lua"))()

local Build =
    loadstring(game:HttpGet(Base.."Modules/UI/Build.lua"))()

-- Crear App primero
local App = {}

App.Theme = Theme
App.Components = Components
App.Build = Build

-- Inicializar módulos
Components.Init(App)
Build.Init(App)

-- Construir la interfaz
local UI = Build.Build()
