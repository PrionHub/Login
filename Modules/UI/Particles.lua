local Particles = {}

local RunService = game:GetService("RunService")

function Particles.Create(Frame, Container)

    repeat
        task.wait()
    until Frame.AbsoluteSize.X > 0

    local PARTICLE_COUNT = 40
    local particles = {}

    for i = 1, PARTICLE_COUNT do

        local dot = Instance.new("Frame")

        dot.ZIndex = 1
        dot.AnchorPoint = Vector2.new(0.5, 0.5)

        local size = math.random(2, 4)

        dot.Size = UDim2.fromOffset(size, size)

        dot.BorderSizePixel = 0

        dot.BackgroundTransparency =
            math.random(30, 70) / 100

        dot.BackgroundColor3 =
            math.random() < 0.25
            and Color3.fromRGB(255, 40, 40)
            or Color3.fromRGB(255, 255, 255)

        Instance.new("UICorner", dot).CornerRadius =
            UDim.new(1, 0)

        local width = Frame.AbsoluteSize.X
        local height = Frame.AbsoluteSize.Y

        local x = math.random() * width
        local y = math.random() * height

        dot.Position = UDim2.fromOffset(x, y)

        dot.Parent = Container

        local angle = math.random() * math.pi * 2
        local speed = math.random(15, 30)

        particles[#particles + 1] = {

            gui = dot,

            x = x,
            y = y,

            vx = math.cos(angle) * speed,
            vy = math.sin(angle) * speed,

            speed = speed,

            pulse = math.random() * 6.28,

            transparency = dot.BackgroundTransparency

        }

    end

    RunService.RenderStepped:Connect(function(dt)

        local width = Frame.AbsoluteSize.X
        local height = Frame.AbsoluteSize.Y

        for _, p in ipairs(particles) do

            p.x += p.vx * dt
            p.y += p.vy * dt

            if p.x < 0 or p.x > width then
                p.vx = -p.vx
            end

            if p.y < 0 or p.y > height then
                p.vy = -p.vy
            end

            p.pulse += dt

            p.gui.BackgroundTransparency =
                p.transparency + math.sin(p.pulse) * 0.08

            p.gui.Position = UDim2.fromOffset(p.x, p.y)

        end

    end)

end

return Particles
