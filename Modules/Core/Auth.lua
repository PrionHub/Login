local Auth = {}

local HttpService = game:GetService("HttpService")

local Name = "PrionHub"
local OwnerId = "kYbqiy1KMp"
local Secret = "a97af28167838caa7db505e0f245ae989d47ac1d0d60e70fb76eb7e9793286ef"
local Version = "1.0"

local SessionId

local httpRequest =
    (syn and syn.request)
    or http_request
    or request

if not httpRequest then

    warn("Tu executor no soporta HTTP requests.")

    return Auth

end

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

    if not response then
    
        warn("KeyAuth no respondió.")
    
        return false

    end
    
    local data = HttpService:JSONDecode(
        response.Body
    )

    if data.success then

        SessionId = data.sessionid

        return true
    end

    warn(data.message)

    return false
end

local HWID =
    (gethwid and gethwid())
    or game:GetService("RbxAnalyticsService"):GetClientId()

function Auth.Login(username, password)

    local response = httpRequest({

        Url = "https://keyauth.win/api/1.2/",

        Method = "POST",

        Headers = {
            ["Content-Type"] =
                "application/x-www-form-urlencoded"
        },

        Body = string.format(
        
            "type=login&username=%s&pass=%s&hwid=%s&sessionid=%s&name=%s&ownerid=%s",
        
            username,
            password,
            HWID,
            SessionId,
            Name,
            OwnerId
        
        )

    })

    local data = HttpService:JSONDecode(
        response.Body
    )

    return data

end

function Auth.Register(username, password, key)

    local response = httpRequest({

        Url = "https://keyauth.win/api/1.2/",

        Method = "POST",

        Headers = {
            ["Content-Type"] =
                "application/x-www-form-urlencoded"
        },

        Body = string.format(

            "type=register&username=%s&pass=%s&key=%s&hwid=%s&sessionid=%s&name=%s&ownerid=%s",

            username,
            password,
            key,
            HWID,
            SessionId,
            Name,
            OwnerId

        )

    })

    local data = HttpService:JSONDecode(
        response.Body
    )

    return data

end

return Auth
