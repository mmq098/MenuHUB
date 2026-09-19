local GAMES = {
    ["3226555017"] = {
        name = "SCP: Site Roleplay",
        url = "https://api.jnkie.com/api/v1/luascripts/public/73973cbe12a57c34f6481fbc151b15b9df149c7eb9b1a50fb1c0f7c680a4c514/download"
    },

    ["99342262733194"] = {
        name = "Randomizer: Redux",
        url = "https://api.jnkie.com/api/v1/luascripts/public/db7600c943a9c8eb6ceb369bf8fbfc18abf2450a491c8090f8687e21b7f57d2a/download"
    },

    ["1934496708"] = {
        name = "SCP: Project",
        url = "https://api.jnkie.com/api/v1/luascripts/public/5e86518fdda2a39048d65d8954421e6cd29a7c0a2ddaf32a865ed2809f65eb0d/download"
    },
    
    ["5534891288"] = {
        name = "SCP: Project (Place)",
        url = "https://api.jnkie.com/api/v1/luascripts/public/5e86518fdda2a39048d65d8954421e6cd29a7c0a2ddaf32a865ed2809f65eb0d/download"
    },

    ["9889997181"] = {
        name = "Passport plz",
        url = "https://api.jnkie.com/api/v1/luascripts/public/ee9bf9e5eaed952b3f716092a12456e8f60c0932cc8463efc68166b30f3e0f63/download"
    },
    
    ["6416498845"] = {
        name = "Facility Roleplay",
        url = "https://api.jnkie.com/api/v1/luascripts/public/ee9bf9e5eaed952b3f716092a12456e8f60c0932cc8463efc68166b30f3e0f63/download"
    },

    ["132352755769957"] = {
        name = "Asylum Life",
        url = "https://api.jnkie.com/api/v1/luascripts/public/fd2395d4a78d2ddebbbcf69b488fe92fbf017c33eaa50792a6f82912d0f56789/download"
    },

    ["84091462741027"] = {
        name = "Anomaly Lockdown",
        url = "https://api.jnkie.com/api/v1/luascripts/public/65e9ad28a47e45aa0bb95fb5a937f695b1ce9c70c3ba9a72f198644a24291053/download"
    },
    
    ["102871156420149"] = {
        name = "The Lost Front",
        url = "https://api.jnkie.com/api/v1/luascripts/public/6c2cf0b8d9427d691d0a81b4aa2fbc68bc4bd12542d3262722d57fc04f01fa51/download"
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
