local Remember = {}

local FILE_NAME = "prion_login.txt"

function Remember.Save(username, password)

    if not writefile then
        return
    end

    local data = username .. "\n" .. password

    writefile(FILE_NAME, data)

end

function Remember.Load()

    if not (isfile and readfile) then
        return nil
    end

    if not isfile(FILE_NAME) then
        return nil
    end

    local content = readfile(FILE_NAME)

    local username, password = content:match("([^\n]*)\n(.*)")

    return {

        Username = username,
        Password = password

    }

end

function Remember.LoadToUI(UI)

    local Data = Remember.Load()

    if not Data then
        return
    end

    UI.UsernameBox.Text = Data.Username

    UI.PasswordBox.Text = Data.Password

    UI.Remember:SetValue(true)

end

function Remember.Clear()

    if delfile and isfile(FILE_NAME) then

        if isfile(FILE_NAME) then
            delfile(FILE_NAME)
        end

    end

end

return Remember
