local Beans = false
local Bravo = false
local LightReplaceModel = game:GetObjects("rbxassetid://12543866876")[1] or nil
local BookcaseReplaceModel = nil
local v8 = game:GetService("ReplicatedStorage").Sounds:FindFirstChild("LA_The Garden");
function PreloadSounds(msg,Soundid)
	if not game:GetService("ReplicatedStorage").Sounds:FindFirstChild("LA_"..msg) then
		Sound = v8:Clone()
		Sound.SoundId = Soundid
		Sound.Parent = game:GetService("ReplicatedStorage").Sounds
		Sound.Name ='LA_'..msg
	end
end
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue.SoundId = "rbxassetid://10472612727"
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Health.Music.Blue.Pitch = 0.55
local latestroom = game.ReplicatedStorage.GameData.LatestRoom.Value
local roomlatestworkspace = workspace.CurrentRooms[latestroom]
function ChangeStyle(room,Modifed)
	Modifed=Modifed or 'Idk'
	wait(0)
	if Modifed == 'Chandelier' then
		for i,v in pairs(room.Assets:GetDescendants()) do
			if v.Name == "Chandelier" then
				v:Destroy()
			end
		end
		return
	end
	--Change Light Model
	for i,v in pairs(room.Assets.Light_Fixtures:GetDescendants()) do
		if v.Name == "LightStand" then
			if game.ReplicatedStorage.GameData.LatestRoom.Value < 51 then
				local torch = LightReplaceModel:Clone()
				torch.Parent = room.Assets.Light_Fixtures
				torch.LightFixture.PointLight.Changed:Connect(function()
					torch.LightFixture.Neon.atachm["Ok you cannot tell me this isnt good"].Enabled = torch.LightFixture.PointLight.Enabled
					torch.LightFixture.Neon["Bright sh idfk"].ParticleEmitter.Enabled = torch.LightFixture.PointLight.Enabled
					torch.LightFixture:WaitForChild('Dust').ParticleEmitter.Enabled = torch.LightFixture.PointLight.Enabled
				end)
				torch:PivotTo(v:GetPivot())
				v:Destroy()
			else
				v:Destroy()
			end
		end
	end
	--FUNCTIONEND
end
ChangeStyle(roomlatestworkspace)
for i,v in pairs(game.ReplicatedStorage.Misc.Eyes:GetDescendants()) do
	if v.Name == "Eye" then
		v:FindFirstChild("Part").Decal.Texture = "rbxassetid://1882220622"
		v:FindFirstChild("Eye").Name = "KYS"
	end
end
game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Connect(function(v)
	L = game:GetService("Workspace").CurrentRooms[v].PathfindNodes:Clone()
	L.Parent = game:GetService("Workspace").CurrentRooms[v]
	L = game:GetService("Workspace").CurrentRooms[v].PathfindNodes:Clone()
	L.Parent = game:GetService("Workspace").CurrentRooms[v]
	L.Name = 'Nodes'
end)
local function ReplaceAudGit(GithubSnd,SoundName)
local url=GithubSnd
local filePath=SoundName..".mp3"
if not isfile(filePath)then
writefile(filePath,game:HttpGet(url))
end
return(getcustomasset or getsynasset)(filePath)
end

local function replaceSeekMusic(GithubSnd,SoundName)
local customAsset=ReplaceAudGit(GithubSnd,SoundName)
for _,obj in ipairs(workspace:GetDescendants())do
if obj:IsA("Model")and obj.Name=="SeekMovingNewClone"then
local seekMusic=obj:FindFirstChild("SeekMusic")
if seekMusic and seekMusic:IsA("Sound")then
seekMusic.SoundId=customAsset  
end
end
end
end

coroutine.wrap(function()
while true do
--game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
			
replaceSeekMusic("https://github.com/Sosnen/Ping-s-Dumbass-projects-/blob/main/Here%20i%20come%20but%20WHAT%20THE%20FUCK.mp3?raw=true","HardcoreSeek")

wait(0.01)
end
end)()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
coroutine.wrap(function()
    local p = game.Players.LocalPlayer
    local c = p.Character or p.CharacterAdded:Wait()
    local t = false
    local a = false

    while true do
        wait(math.random(5,20))

        if not t and not a then
            local r = game.ReplicatedStorage.GameData.LatestRoom.Value
            local v = not (r == 50 or r == 100)
            local s = true
            for _,x in pairs(workspace:GetChildren()) do
                if x.Name:find("Seek") then
                    s = false
                    break
                end
            end

            if v and s then
                local m = game:GetObjects("rbxassetid://11547803978")[1]
                m.Parent = workspace

                for _,y in pairs(m:GetDescendants()) do
                    if y:IsA("BasePart") then
                        y.CanCollide = false
                        y.Anchored = true
                    end
                end

                local b = m:FindFirstChild("Body") or m:FindFirstChildWhichIsA("BasePart")
                m.PrimaryPart = b
                b.CFrame = c.HumanoidRootPart.CFrame * CFrame.new(0,0,-7)

                local h = false

                c.Humanoid.Died:Connect(function()
                    game.ReplicatedStorage.GameStats["Player_"..p.Name].Total.DeathCause.Value = "Shocker"
                    t = true
                end)

                local function cleanup()
                    if not h and not a then
                        local ts = game:GetService("TweenService")
                        local ti = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                        local goal = {Position = b.Position - Vector3.new(0,100,0)}
                        ts:Create(b, ti, goal):Play()
                        
                        wait(2)
                        
                        a = true
                        loadstring(game:HttpGet"https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua")()({
                            Title = "Shocker experience",
                            Desc = "Survived the encounter",
                            Reason = "Didn't look directly",
                            Image = "rbxassetid://12958363516"
                        })
                        wait(0.5)
                        m:Destroy()
                    end
                end

                local l = 0
                for _ = 1,40 do
                    if (b.Position - workspace.CurrentCamera.CFrame.Position).Unit:Dot(workspace.CurrentCamera.CFrame.LookVector) > 0.5 then
                        l = l + 0.1
                        if l >= 2 then
                            for _,z in pairs(m:GetDescendants()) do
                                if z:IsA("BasePart") then
                                    z.Anchored = false
                                end
                            end

                            local st = tick()
                            local sp = b.Position
                            local ep = c.HumanoidRootPart.Position

                            while tick() - st < 0.5 do
                                b.Position = sp:Lerp(ep,(tick()-st)/0.5)
                                wait()
                            end

                            m["OOGA BOOGAAAA"]["HORROR SCREAM 15"]:Play()

                            c.Humanoid:TakeDamage(20)
                            h = true
                            t = true

                            wait(0.5)
                            local f = Instance.new("BodyVelocity")
                            f.Velocity = Vector3.new(0,-50,0)
                            f.MaxForce = Vector3.new(0,9e9,0)
                            f.Parent = b
                            wait(1.5)
                            m:Destroy()
                            break
                        end
                    end
                    wait(0.1)
                end

                if not h then
                    cleanup()
                end
            end
        end
    end
end)()
