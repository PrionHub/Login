local Drag = {}

local UserInputService =
    game:GetService("UserInputService")

function Drag.Enable(Frame)

    local Dragging = false
    local DragStart
    local StartPosition

    local function Update(Input)

        local Delta = Input.Position - DragStart

        Frame.Position = UDim2.new(

            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,

            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y

        )

    end

    Frame.InputBegan:Connect(function(Input)
    
        if
    
            Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch
    
        then
    
            Dragging = true
            DragStart = Input.Position
            StartPosition = Frame.Position
    
            Input.Changed:Connect(function()

                if Input.UserInputState == Enum.UserInputState.End
                    or Input.UserInputState == Enum.UserInputState.Cancel
                then
            
                    Dragging = false
            
                end
            
            end)
    
        end
    
    end)

    UserInputService.InputChanged:Connect(function(Input)
    
        if Dragging and (
    
            Input.UserInputType == Enum.UserInputType.MouseMovement
            or Input.UserInputType == Enum.UserInputType.Touch
    
        ) then
    
            Update(Input)
    
        end
    
    end)
end

return Drag
