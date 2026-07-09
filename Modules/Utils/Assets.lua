local Assets = {}

local URL_LOGO = "https://i.imgur.com/fUUT0M8.jpeg"
local FILE_NAME = "prion_logo.jpeg"

function Assets.LoadImage(ImageObject)
    local httpRequest =
        (syn and syn.request)
        or (http and http.request)
        or http_request
        or request

    task.spawn(function()

        if not (httpRequest and writefile and isfile) then
            return
        end

        if not isfile(FILE_NAME) then

            local success, response = pcall(function()
                return httpRequest({
                    Url = URL_LOGO,
                    Method = "GET"
                })
            end)

            if success and response and response.StatusCode == 200 then
                writefile(FILE_NAME, response.Body)
            end
        end

        if isfile(FILE_NAME) then

            ImageObject.Image =
                getcustomasset
                and getcustomasset(FILE_NAME)
                or ("rbxasset://" .. FILE_NAME)

        end
    end)
end

return Assets
