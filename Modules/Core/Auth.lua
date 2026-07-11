local Auth = {}

local HttpService = game:GetService("HttpService")

local App

local Name = "PrionHub"
local OwnerId = "kYbqiy1KMp"
local Version = "1.0"

local SessionId = nil

local function Init()

    local response = game:HttpGet(

        "https://keyauth.win/api/1.1/"
        .. "?name=" .. Name
        .. "&ownerid=" .. OwnerId
        .. "&type=init"
        .. "&ver=" .. Version

    )

    print("RESPUESTA:")
    print(response)

    local data = HttpService:JSONDecode(response)

    if data.success then

        SessionId = data.sessionid

        print("Sesion iniciada:", SessionId)

        return true

    end

    warn("KeyAuth error:", data.message)

    return false

end
function Auth.Init(Application)

    App = Application

    Init()

end

return Auth
