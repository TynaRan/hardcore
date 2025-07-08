local Beans = false
local Bravo = false
local LightReplaceModel = game:GetObjects("rbxassetid://12543866876")[1] or nil
local BookcaseReplaceModel = nil
--local v8 = game:GetService("ReplicatedStorage").Sounds:FindFirstChild("LA_The Garden");
--function PreloadSounds(msg,Soundid)
--	if not game:GetService("ReplicatedStorage").Sounds:FindFirstChild("LA_"..msg) then
--		Sound = v8:Clone()
--		Sound.SoundId = Soundid
--		Sound.Parent = game:GetService("ReplicatedStorage").Sounds
--		Sound.Name ='LA_'..msg
--	end
--end
local v1 = game:GetService("Players").LocalPlayer
local v2 = v1:WaitForChild("PlayerGui")
local v3 = game:GetService("UserInputService")
local v4 = game:GetService("RunService")
local v5 = game:GetService("SoundService")

local v6 = 100
local v7 = v6
local v8 = false
local v9 = true
local v10 = 15
local v11 = 10
local v12 = 3
local v13 = false
local v42 = 15
local v43 = nil

local v14 = Instance.new("ScreenGui")
v14.Name = "StaminaGui"
v14.Parent = v2
v14.Enabled = true
v14.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local v15 = Instance.new("TextButton")
v15.Name = "SprintButton"
v15.Parent = v14
v15.AnchorPoint = Vector2.new(1,0.5)
v15.BackgroundColor3 = Color3.fromRGB(255,255,255)
v15.BackgroundTransparency = 1.000
v15.Position = UDim2.new(0.98,0,0.5,0)
v15.Size = UDim2.new(0.08,0,0.08,0)
v15.ZIndex = 1005
v15.Text = ""

local v19 = Instance.new("Frame")
v19.Name = "Bar"
v19.Parent = v14
v19.AnchorPoint = Vector2.new(1,0.5)
v19.BackgroundColor3 = Color3.fromRGB(56,46,39)
v19.BackgroundTransparency = 0.700
v19.Position = UDim2.new(0.98,0,0.6,0)
v19.Size = UDim2.new(0.3,0,0.04,0)
v19.ZIndex = 0

local v22 = Instance.new("Frame")
v22.Name = "Fill"
v22.Parent = v19
v22.AnchorPoint = Vector2.new(0,0.5)
v22.BackgroundColor3 = Color3.fromRGB(213,185,158)
v22.Position = UDim2.new(0,0,0.5,0)
v22.Size = UDim2.new(1,0,1,0)
v22.ZIndex = 2

local v24 = Instance.new("TextLabel")
v24.Name = "StaminaText"
v24.Parent = v15
v24.AnchorPoint = Vector2.new(0.5,0.5)
v24.BackgroundTransparency = 1
v24.Position = UDim2.new(0.5,0,0.5,0)
v24.Size = UDim2.new(1,0,1,0)
v24.Text = "SPRINT"
v24.TextColor3 = Color3.fromRGB(255,255,255)
v24.TextScaled = true
v24.Font = Enum.Font.Oswald
v24.ZIndex = 1006

local function UpdateStamina()
    local v45 = v7/v6
    v22.Size = UDim2.new(v45,0,1,0)
    --v24.Text = "SPRINT: "..math.floor(v45*100).."%"
end

local function ToggleSprint()
    if v7 > 5 and not v8 and not v13 then
        v8 = true
        if v43 then
            v43:Disconnect()
            v43 = nil
        end
    else
        v8 = false
        if not v43 then
            v43 = hookmetamethod(game, "__namecall", function(...)
                local v47, v48 = ...
                if v48 == "WalkSpeed" and getnamecallmethod() == "setWalkSpeed" then
                    return nil
                end
                return v43(...)
            end)
        end
    end
end

v15.MouseButton1Click:Connect(function()
    ToggleSprint()
end)

local v53 = v1.Character and v1.Character:FindFirstChildOfClass("Humanoid")

if not v53 then
    v1.CharacterAdded:Connect(function(v54)
        v53 = v54:WaitForChild("Humanoid")
        v53.WalkSpeed = v42
    end)
end

v43 = hookmetamethod(game, "__namecall", function(...)
    local v55, v56 = ...
    if v56 == "WalkSpeed" and getnamecallmethod() == "setWalkSpeed" then
        return nil
    end
    return v43(...)
end)

v4.Heartbeat:Connect(function(v57)
    if v53 then
        local v58 = v53.MoveDirection.Magnitude > 0
        
        if v8 then
            if v58 then
                v7 = math.max(0, v7 - v10 * v57)
                v53.WalkSpeed = 21
            else
                v7 = math.min(v6, v7 + v11 * v57)
            end
            
            if v7 <= 0 then
                if not v13 then
		    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("You Feel Exhausted.",true)
                    local v59 = Instance.new("Sound")
                    v59.SoundId = "rbxassetid://8258601891"
                    v59.Volume = 0.8
                    v59.PlayOnRemove = true
                    v59.Parent = workspace
                    v59:Destroy()
                    v13 = true
                    task.delay(v12, function()
                        v13 = false
                    end)
                end
                ToggleSprint()
                v53.WalkSpeed = v42
            end
        else
            v53.WalkSpeed = v42
            if v9 and v7 < v6 and not v8 then
                if not v58 then
                    v7 = math.min(v6, v7 + v11 * v57)
                end
            end
        end
        
        UpdateStamina()
    end
end)

UpdateStamina()
if v53 then v53.WalkSpeed = v42 end
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
	for i,v in pairs(room.Assets.LightStand.Light_Fixtures:GetDescendants()) do
		if v.Name == "LightStand" then
			if game.ReplicatedStorage.GameData.LatestRoom.Value < 51 then
				local torch = LightReplaceModel:Clone()
				torch.Parent = room.Assets.LightStand.LightFixtures
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
game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Connect(function(v)
	L = game:GetService("Workspace").CurrentRooms[v].PathfindNodes:Clone()
	L.Parent = game:GetService("Workspace").CurrentRooms[v]
	L = game:GetService("Workspace").CurrentRooms[v].PathfindNodes:Clone()
	L.Parent = game:GetService("Workspace").CurrentRooms[v]
	L.Name = 'Nodes'
	local LightReplaceModel = game:GetObjects("rbxassetid://12543866876")[1] or nil
        ChangeStyle(roomlatestworkspace)
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
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Hardcore Original Init",true)
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
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Original: noonie#0001 Ping#1841 and Noah other ",true)
wait(2)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("LOL",true)
