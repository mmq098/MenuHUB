local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")

local DISCORD_URL = "https://discord.gg/XyWaTqR2SM"

local GAMES = {
	{
		name = "SCP: Site Roleplay",
		placeIds = { 3226555017 },
		universeId = 1165835263,
		url = "https://api.jnkie.com/api/v1/luascripts/public/73973cbe12a57c34f6481fbc151b15b9df149c7eb9b1a50fb1c0f7c680a4c514/download",
	},
	{
		name = "Randomizer: Redux",
		placeIds = { 99342262733194 },
		universeId = 6745933496,
		url = "https://api.jnkie.com/api/v1/luascripts/public/db7600c943a9c8eb6ceb369bf8fbfc18abf2450a491c8090f8687e21b7f57d2a/download",
	},
	{
		name = "Project: SCP",
		placeIds = { 5534891288 },
		universeId = 1934496708,
		url = "https://api.jnkie.com/api/v1/luascripts/public/5e86518fdda2a39048d65d8954421e6cd29a7c0a2ddaf32a865ed2809f65eb0d/download",
	},
	{
		name = "Passport plz",
		placeIds = { 81260950969822 },
		universeId = 9792273312,
		url = "https://api.jnkie.com/api/v1/luascripts/public/3e8510b017db2c519246f57f8a8e5d990b380575da9783f19adeb01f9ae36a74/download",
	},
	{
		name = "Facility Roleplay",
		placeIds = { 6416498845 },
		universeId = 2387000728,
		url = "https://api.jnkie.com/api/v1/luascripts/public/ee9bf9e5eaed952b3f716092a12456e8f60c0932cc8463efc68166b30f3e0f63/download",
	},
	{
		name = "Asylum Life",
		placeIds = { 132352755769957 },
		universeId = 6749060816,
		url = "https://api.jnkie.com/api/v1/luascripts/public/fd2395d4a78d2ddebbbcf69b488fe92fbf017c33eaa50792a6f82912d0f56789/download",
	},
	{
		name = "Anomaly Lockdown",
		placeIds = { 84091462741027 },
		universeId = 8333899831,
		url = "https://api.jnkie.com/api/v1/luascripts/public/65e9ad28a47e45aa0bb95fb5a937f695b1ce9c70c3ba9a72f198644a24291053/download",
	},
	{
		name = "The Lost Front",
		placeIds = { 102871156420149 },
		universeId = 7935634976,
		url = "https://api.jnkie.com/api/v1/luascripts/public/6c2cf0b8d9427d691d0a81b4aa2fbc68bc4bd12542d3262722d57fc04f01fa51/download",
	},
}

local byPlaceId = {}
local byUniverseId = {}

for _, entry in ipairs(GAMES) do
	for _, placeId in ipairs(entry.placeIds) do
		byPlaceId[placeId] = entry
	end

	if entry.universeId then
		byUniverseId[entry.universeId] = entry
	end
end

local function notify(title, text, duration)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = duration or 5,
		})
	end)
end

local function stop(title, message, duration)
	if type(setclipboard) == "function" and pcall(setclipboard, DISCORD_URL) then
		message = message .. " Discord invite copied to clipboard."
	else
		message = message .. " Discord: " .. DISCORD_URL
	end

	notify(title, message, duration)
end

local function reportFailure(entry)
	notify("Error", "Failed to load " .. entry.name .. ".", 10)
end

local function runRemote(entry, url)
	local fetched, source = pcall(game.HttpGet, game, url)
	if not fetched then
		reportFailure(entry)
		return false
	end

	local chunk = loadstring(source)
	if not chunk then
		reportFailure(entry)
		return false
	end

	local ran = pcall(chunk)
	if not ran then
		reportFailure(entry)
		return false
	end

	return true
end

local function loadGame(entry)
	notify(entry.name, "Loading...", 3)
	task.wait(1)
	runRemote(entry, entry.url)
end

if not game:IsLoaded() then
	game.Loaded:Wait()
end

repeat
	task.wait(0.1)
until game.PlaceId ~= 0 and game.GameId ~= 0 and Players.LocalPlayer and Workspace.CurrentCamera

local current = byPlaceId[game.PlaceId] or byUniverseId[game.GameId]
if not current then
	stop("Error", "This game is not supported.", 5)
	return
end

loadGame(current)
