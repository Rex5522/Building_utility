--- manages basic hud functions
-- @param data
-- @return nil
function CMD_Hud(data)
    local formatCommandData = {
        command = "?hud",
        argData = {
            [1] = {
                argName = "hudMode",
                Description = "the mode the hud will be changed to. minimal, combat, normal",
                exampleValue = "normal",
                required = false
            }
        }
    }

    local user = data.user
    local hudMode = data.arg1

    if hudMode == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    if not hudMode then
        user.hud = not user.hud
        user:display("hud "..booleanTranslator(user.hud, 1), true)
        return
    elseif hudMode and G_Misc.hudModes[hudMode] then
        user.hudMode = hudMode
        user:display("hud mode: "..hudMode, true)
    else
        createCommandFormat(formatCommandData, user)
    end
end