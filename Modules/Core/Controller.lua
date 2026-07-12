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

function Controller.Setup()

    UI.LoginButton.MouseButton1Click:Connect(function()

        Animations.ButtonClick(UI.LoginButton)

        if not UI.LoginButton.Active then
            return
        end

        UI.LoginButton.Active = false

        local Username = UI.UsernameBox.Text
        local Password = UI.PasswordBox.Text

        if Username == "" or Password == "" then

            UI.StatusLabel.Text =
                "STATUS: Missing username or password."

            UI.LoginButton.Active = true

            return

        end

        UI.StatusLabel.Text = "STATUS: Connecting..."

        local Result

        if UI.Mode == "Register" then

            local Key = UI.KeyBox.Text

            if Key == "" then

                UI.StatusLabel.Text =
                    "STATUS: Missing key."

                UI.LoginButton.Text = "Register"

                UI.LoginButton.Active = true

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

            if UI.Remember:GetValue() then

                Remember.Save(

                    Username,
                    Password

                )

            else

                Remember.Clear()

            end

            UI.StatusLabel.Text =
                "STATUS: Successfully authenticated."

            task.wait(0.8)

            Animations.Close(UI)

            loadstring(game:HttpGet("https://raw.githubusercontent.com/PrionHub/PH/main/source.lua", true))()

        else

            UI.StatusLabel.Text =
                "STATUS: " ..
                tostring(Result.message)

            UI.LoginButton.Text = UI.Mode

        end

        UI.LoginButton.Active = true

    end)

end

return Controller
