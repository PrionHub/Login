local Base =
"https://raw.githubusercontent.com/PrionHub/Login/main/"

local Theme =
loadstring(game:HttpGet(Base.."Modules/UI/Theme.lua"))()

local Components =
loadstring(game:HttpGet(Base.."Modules/UI/Components.lua"))()

local Build =
    loadstring(game:HttpGet(Base.."Modules/UI/Build.lua"))()

App.Build = Build

Build.Init(App)

local UI = Build.Build()

local App = {}

App.Theme = Theme
App.Components = Components

Components.Init(App)
