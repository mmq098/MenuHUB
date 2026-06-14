local GAMES = {
    ["3226555017"] = {
        name = "SCP: Site Roleplay",
        url = "https://raw.githubusercontent.com/mmq098/SCPMENU-SITERP/refs/heads/main/lua"
    },

    ["99342262733194"] = {
        name = "Randomizer: Redux",
        url = "https://raw.githubusercontent.com/mmq098/RandomizerMenu/refs/heads/main/lua"
    },

    ["5534891288"] = {
        name = "SCP: Project",
        url = "https://api.jnkie.com/api/v1/luascripts/public/aa6f56f0f339f964ef61a3db49c37f1f6b189c8b3611487fc016c70ab7dba51f/download"
    },

    ["102871156420149"] = {
        name = "The Lost Front",
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
