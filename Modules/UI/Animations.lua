local Animations = {}

local TweenService = game:GetService("TweenService")

local AnimationTime = 0.35

local AnimationInfo = TweenInfo.new(

    0.35,

    Enum.EasingStyle.Quint,

    Enum.EasingDirection.Out

)

function Animations.Setup(UI)

    local RegisterMode = false

    UI.SwitchMode.MouseButton1Click:Connect(function()
    
        RegisterMode = not RegisterMode
    
        local NewSize
        local RememberPos
        local LoginPos
        local GetKeyPos
        local SwitchPos
        local StatusPos
    
        if RegisterMode then

            UI.Mode = "Register"
        
            UI.KeyBox.PlaceholderText = "  Key / Llave..."
        
            UI.KeyBox.Visible = true
        
            TweenService:Create(
                UI.KeyBox,
                AnimationInfo,
                {
                    BackgroundTransparency = 0,
                    TextTransparency = 0,
                }
            ):Play()
        
            UI.LoginButton.Text = "Register"
        
            UI.SwitchMode.Text =
                "Already have an account? Login"
        
            NewSize = UDim2.fromOffset(280, 410)
        
            RememberPos = UDim2.fromOffset(30, 242)
        
            LoginPos = UDim2.fromOffset(20, 275)
        
            GetKeyPos = UDim2.fromOffset(20, 320)
        
            SwitchPos = UDim2.fromOffset(30, 360)

            StatusPos = UDim2.fromOffset(20, 375)
        
        else
        
            UI.Mode = "Login"
        
            UI.LoginButton.Text = "Login"
        
            UI.SwitchMode.Text =
                "Don't have an account? Register"
        
            UI.KeyBox.PlaceholderText = ""
        
            NewSize = UDim2.fromOffset(280, 360)
        
            RememberPos = UDim2.fromOffset(30, 200)
        
            LoginPos = UDim2.fromOffset(20, 230)
        
            GetKeyPos = UDim2.fromOffset(20, 275)
        
            SwitchPos = UDim2.fromOffset(30, 315)

            StatusPos = UDim2.fromOffset(20, 335)
        
        end
    
        TweenService:Create(
            UI.MainFrame,
            AnimationInfo,
            {Size = NewSize}
        ):Play()
    
        TweenService:Create(
            UI.Remember.Instance,
            AnimationInfo,
            {Position = RememberPos}
        ):Play()
    
        TweenService:Create(
            UI.LoginButton,
            AnimationInfo,
            {Position = LoginPos}
        ):Play()
    
        TweenService:Create(
            UI.GetKeyButton,
            AnimationInfo,
            {Position = GetKeyPos}
        ):Play()
    
        TweenService:Create(
            UI.SwitchMode,
            AnimationInfo,
            {Position = SwitchPos}
        ):Play()

        TweenService:Create(
            UI.StatusLabel,
            AnimationInfo,
            {Position = StatusPos}
        ):Play()
    
        if not RegisterMode then
    
            TweenService:Create(
                UI.KeyBox,
                AnimationInfo,
                {
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                }
            ):Play()
    
            task.delay(AnimationTime, function()

                UI.KeyBox.Visible = false
            
            end)
    
        end
    
    end)

end

function Animations.Close(UI)

    local Tween = TweenService:Create(

        UI.MainFrame,

        TweenInfo.new(

            0.6,

            Enum.EasingStyle.Quint,

            Enum.EasingDirection.Out

        ),

        {

            Size = UDim2.fromOffset(0, 0),

            BackgroundTransparency = 1

        }

    )

    Tween:Play()

    Tween.Completed:Wait()

    UI.ScreenGui:Destroy()

end

return Animations
