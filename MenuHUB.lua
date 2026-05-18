local GAMES = {
    ["3226555017"] = {
        name = "SCP: Site Roleplay",
        url = "https://raw.githubusercontent.com/mmq098/SCPMENU-SITERP/refs/heads/main/lua"
    },

    ["102871156420149"] = {
        name = "Frontlines",
        url = "https://raw.githubusercontent.com/mmq098/FrontMenu/main/lua"
    }
}

local PlaceId = tostring(game.PlaceId)
local GameData = GAMES[PlaceId]

if GameData then
    print("Loading:", GameData.name)

    local Success, Result = pcall(function()
        return game:HttpGet(GameData.url)
    end)

    if Success then
        loadstring(Result)()
    else
        warn("Failed to load script:", Result)
    end
else
    warn("Unsupported game:", PlaceId)
end