local Clipboard = {}
local Animations
local GET_KEY_URL = "discord.gg/uVwnP9WWbx"

function Clipboard.Setup(App)

    local UI = App.UI

    Animations = App.Animations

    UI.GetKeyButton.MouseButton1Click:Connect(function()

        Animations.ButtonClick(UI.GetKeyButton)

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

end

return Clipboard
