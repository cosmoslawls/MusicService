-- MusicService by Reverb Games, or @ReverbAnnouncer GitHub
-- Scripted on 1/22/21 for fun

--[[
libraries
]]

local MusicService = {}
local InstanceWrap = Instance.new
local lighting = game.Lighting
local TweenService = game:GetService("TweenService")

function Tweener(o,t,s)
	TweenService:Create(o, TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),s):Play()
end

MusicService.Fade = function(sound,vol,fadetime)
	TweenService:Create(sound,TweenInfo.new(fadetime,  Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Volume = vol}):Play()
end

MusicService.AddSound = function(soundid,vol,pitch,playstop,name)
	local sound = InstanceWrap("Sound")
	sound.SoundId = "rbxassetid://"..soundid
	sound.Volume = vol
	sound.PlaybackSpeed = pitch
	sound:playstop()
	sound.Name = name
end

MusicService.Disco = function(enable)
	if enable == true then
	local ColorCorrection = InstanceWrap("ColorCorrectionEffect")
	ColorCorrection.Parent = lighting
	ColorCorrection.Name = "ReverbGames_Disco"
	ColorCorrection.Enabled = true
			repeat
		Tweener(ColorCorrection, 0.9, {TintColor = Color3.fromRGB(255, 0, 4)})
			wait(0.9)
		Tweener(ColorCorrection, 0.9, {TintColor = Color3.fromRGB(19, 14, 181)})
			wait(0.9)
		Tweener(ColorCorrection, 0.9, {TintColor = Color3.fromRGB(170, 101, 25)})
			wait(0.9)
		Tweener(ColorCorrection, 0.9, {TintColor = Color3.fromRGB(148, 236, 255)})
	until enable == false
	if enable == false then
		if game.Lighting:FindFirstChild("ReverbGames_Disco") then
			game.Lighting.ReverbGames_Disco:Destroy()
			end
			end
	end
	end

MusicService.PlayStop = function(sound,playstop)
	if playstop == "Stop" then
		sound:Stop()
	elseif playstop == "Play" then
		sound:Play()
	elseif playstop == "Pause" then
		sound:Pause()
	elseif playstop == "Resume" then
		sound:Resume()
	
	end
end

return MusicService

