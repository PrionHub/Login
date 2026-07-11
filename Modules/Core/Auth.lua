local Auth = {}

local HttpService = game:GetService("HttpService")

local Name = "PrionHub"
local OwnerId = "kYbqjy1KMp"
local Secret = "a97af28167838caa7db505e0f245ae989d47ac1d0d60e70fb76eb7e9793286ef"
local Version = "1.0"

local SessionId

local httpRequest =
    syn and syn.request
    or http_request
    or request

function Auth.Init()

    local response = httpRequest({

        Url = "https://keyauth.win/api/1.2/",

        Method = "POST",

        Headers = {

            ["Content-Type"] =
                "application/x-www-form-urlencoded"

        },

        Body = string.format(

            "type=init&name=%s&ownerid=%s&secret=%s&version=%s",

            Name,
            OwnerId,
            Secret,
            Version

        )

    })

    local data = HttpService:JSONDecode(
        response.Body
    )

    if data.success then

        SessionId = data.sessionid

        print("Sesión iniciada:", SessionId)

        return true
    end

    warn(data.message)

    return false
end

return Auth
