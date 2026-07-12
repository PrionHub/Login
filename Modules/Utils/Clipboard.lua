local Clipboard = {}

local GET_KEY_URL = "TU_LINK_AQUI"

function Clipboard.Setup(UI)

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

end

return Clipboard
