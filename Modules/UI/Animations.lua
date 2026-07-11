UI.SwitchMode.MouseButton1Click:Connect(function()

    RegisterMode = not RegisterMode

    local TweenInfo = TweenInfo.new(

        0.35,

        Enum.EasingStyle.Quint,

        Enum.EasingDirection.Out

    )

    local NewSize
    local RememberPos
    local LoginPos
    local GetKeyPos
    local SwitchPos

    if RegisterMode then

        UI.KeyBox.PlaceholderText = "  Key / Llave..."
    
        UI.KeyBox.Visible = true
    
        TweenService:Create(
            UI.KeyBox,
            TweenInfo,
            {
                BackgroundTransparency = 0,
                TextTransparency = 0,
            }
        ):Play()

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

        UI.KeyBox.PlaceholderText = ""

        NewSize = UDim2.fromOffset(280, 330)

        RememberPos = UDim2.fromOffset(30, 200)

        LoginPos = UDim2.fromOffset(20, 230)

        GetKeyPos = UDim2.fromOffset(20, 275)

        SwitchPos = UDim2.fromOffset(30, 310)

    end

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

        TweenService:Create(
            UI.KeyBox,
            TweenInfo,
            {
                BackgroundTransparency = 1,
                TextTransparency = 1,
            }
        ):Play()

        task.delay(0.35, function()

            UI.KeyBox.Visible = false

        end)

    end

end)

return Animations
