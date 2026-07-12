local Controller = {}

local App
local UI
local Auth
local Remember
local Animations

function Controller.Init(Application)

    App = Application

    UI = App.UI
    Auth = App.Auth
    Remember = App.Remember
    Animations = App.Animations

end

return Controller
