
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

-- Construir la interfaz
local UI = Build.Build()

App.UI = UI

Auth.Init()

Particles.Create(UI.MainFrame, UI.ParticleContainer)

Animations.Setup(UI)

local GET_KEY_URL = "TU_LINK_AQUI"

UI.GetKeyButton.MouseButton1Click:Connect(function()

    if setclipboard then

        setclipboard(GET_KEY_URL)

        UI.GetKeyButton.Text = "Copied!"

        task.wait(2)

        UI.GetKeyButton.Text =
            "Obtener Llave | Get Key"

    else

        UI.GetKeyButton.Text =
            "Clipboard not supported"

    end

end)

--temp
UI.LoginButton.MouseButton1Click:Connect(function()

    local Username = UI.UsernameBox.Text
    local Password = UI.PasswordBox.Text

    if Username == "" or Password == "" then

        warn("Faltan datos.")

        return

    end

    UI.LoginButton.Text = "Connecting..."

    local Result

    if UI.Mode == "Register" then

        local Key = UI.KeyBox.Text

        if Key == "" then

            warn("Falta la key.")

            UI.LoginButton.Text = "Register"

            return

        end

        Result = Auth.Register(
            Username,
            Password,
            Key
        )

    else

        Result = Auth.Login(
            Username,
            Password
        )

    end

    print(Result)

    if Result.success then

        print("¡Autenticado!")

        if UI.Remember:GetValue() then

            Remember.Save(
                Username,
                Password
            )

        else

            Remember.Clear()

        end

        UI.LoginButton.Text = "Success!"

        -- Aquí luego llamaremos a:
        -- loadstring(game:HttpGet(...))()

    else

        warn(Result.message)

        UI.LoginButton.Text = "Login"

    end

end)
--====

local Data = Remember.Load()

if Data then

    UI.UsernameBox.Text = Data.Username

    UI.PasswordBox.Text = Data.Password

    UI.Remember:SetValue(true)

end
