local Remote = game.ReplicatedStorage:WaitForChild("Combat")

local TweenService = game:GetService("TweenService")

local Animation = script:WaitForChild("Animation")

local Sound = script:WaitForChild("Sound")

local FX = script:WaitForChild("FX")

Remote.OnServerEvent:Connect(function(player,action,combo)
	local char = player.Character
	local hum = char:WaitForChild("Humanoid")
	local humRP = char:WaitForChild("HumanoidRootPart")
	
	if char:FindFirstChild("Disabled") == nil then
	
		local rightArm = char:WaitForChild("Right Arm")
		local leftArm = char:WaitForChild("Left Arm")
		local rightLeg = char:WaitForChild("Right Leg")
		
		local Combo1Loaded = hum:LoadAnimation(Animation.Combo1)
		local Combo2Loaded = hum:LoadAnimation(Animation.Combo2)
		local Combo3Loaded = hum:LoadAnimation(Animation.Combo3)
		local Combo4Loaded = hum:LoadAnimation(Animation.Combo4)
		
		local InsertDisabled = function(Target,Time)
			local Disabled = Instance.new("BoolValue",Target)
			Disabled.Name = player.Name.."Disabled"
			game.Debris:AddItem(Disabled,Time)
		end
		
		local Hiteffect = function(Target)
			local hitEffectFX = FX.Hiteffect:Clone()
			hitEffectFX.Parent = Target
			hitEffectFX:Emit(1)
			game.Debris:AddItem(hitEffectFX,1)
			
			local sound = Sound.ImpactSound:Clone()
			sound.Parent = Target
			sound.PlaybackSpeed = math.random(70,110)/100
			sound:Play()
			game.Debris:AddItem(sound,1)
			
			Target.Orientation = humRP.Orientation - Vector3.new(0,180,0)
		end
		
		delay(0.5,function()
			Remote:FireClient(player)
		end)
		delay(0.2,function()
			local Folder = Instance.new("Folder",workspace)
			Folder.Name = player.Name.." Hitbox"
			game.Debris:AddItem(Folder,0.65)
			
			if(combo == 1)then
				Combo1Loaded:Play()
			elseif(combo == 2)then
				Combo2Loaded:Play()
			elseif(combo == 3)then
				Combo3Loaded:Play()
			elseif(combo == 4)then
				Combo4Loaded:Play()
			end
			
			
			if(combo == 1)then
				local Hitbox = script:WaitForChild("HItbox"):Clone()
				Hitbox.Parent = Folder
				
				local Weld = Instance.new("Weld",rightArm)
				Weld.Part0 = rightArm
				Weld.Part1 = Hitbox
				Weld.C0 = Hitbox.CFrame:Inverse() * rightArm.CFrame
				
				Hitbox.Touched:Connect(function(hit)
					if hit.Parent ~= player.Name then
						local gethum = hit.Parent:FindFirstChild("Humanoid")
						if gethum then
							Folder:Destroy()
							gethum:TakeDamage(5)
							
							local Hit1Load = gethum:LoadAnimation(Animation.Hit1);
							Hit1Load:Play()
							
							local BV = Instance.new("BodyVelocity",hit.Parent.HumanoidRootPart)
							BV.MaxForce = Vector3.new(10000,10000,10000)
							BV.Velocity= humRP.CFrame.lookVector*5
							game.Debris:AddItem(BV,0.2)
							
							InsertDisabled(hit.Parent,0.8)
							Hiteffect(hit.Parent.HumanoidRootPart)
							
						end
					end
				end)
				
				
			elseif(combo == 2)then
				local Hitbox = script:WaitForChild("HItbox"):Clone()
				Hitbox.Parent = Folder

				local Weld = Instance.new("Weld",leftArm)
				Weld.Part0 = leftArm
				Weld.Part1 = Hitbox
				Weld.C0 = Hitbox.CFrame:Inverse() * leftArm.CFrame

				Hitbox.Touched:Connect(function(hit)
					if hit.Parent ~= player.Name then
						local gethum = hit.Parent:FindFirstChild("Humanoid")
						if gethum then
							Folder:Destroy()
							gethum:TakeDamage(5)
							
							local Hit1Load = gethum:LoadAnimation(Animation.Hit1);
							Hit1Load:Play()
							
							local BV = Instance.new("BodyVelocity",hit.Parent.HumanoidRootPart)
							BV.MaxForce = Vector3.new(10000,10000,10000)
							BV.Velocity= humRP.CFrame.lookVector*8
							game.Debris:AddItem(BV,0.3)
							
							InsertDisabled(hit.Parent,0.8)
							Hiteffect(hit.Parent.HumanoidRootPart)
							
						end
					end
				end)
				
			elseif(combo == 3)then
				local Hitbox = script:WaitForChild("HItbox"):Clone()
				Hitbox.Parent = Folder

				local Weld = Instance.new("Weld",rightArm)
				Weld.Part0 = rightArm
				Weld.Part1 = Hitbox
				Weld.C0 = Hitbox.CFrame:Inverse() * rightArm.CFrame

				Hitbox.Touched:Connect(function(hit)
					if hit.Parent ~= player.Name then
						local gethum = hit.Parent:FindFirstChild("Humanoid")
						if gethum then
							Folder:Destroy()
							gethum:TakeDamage(5)
							
							local Hit1Load = gethum:LoadAnimation(Animation.Hit1);
							Hit1Load:Play()
							
							local BV = Instance.new("BodyVelocity",hit.Parent.HumanoidRootPart)
							BV.MaxForce = Vector3.new(10000,10000,10000)
							BV.Velocity= humRP.CFrame.lookVector*5
							game.Debris:AddItem(BV,0.2)
							
							InsertDisabled(hit.Parent,0.8)
							Hiteffect(hit.Parent.HumanoidRootPart)
							
						end
					end
				end)
			elseif(combo == 4)then
				local Hitbox = script:WaitForChild("HItbox"):Clone()
				Hitbox.Parent = Folder

				local Weld = Instance.new("Weld",leftArm)
				Weld.Part0 = leftArm
				Weld.Part1 = Hitbox
				Weld.C0 = Hitbox.CFrame:Inverse() * leftArm.CFrame

				Hitbox.Touched:Connect(function(hit)
					if hit.Parent ~= player.Name then
						local gethum = hit.Parent:FindFirstChild("Humanoid")
						if gethum then
							Folder:Destroy()
							gethum:TakeDamage(5)
							
							local Hit1Load = gethum:LoadAnimation(Animation.Hit1);
							Hit1Load:Play()
							
							local BV = Instance.new("BodyVelocity",hit.Parent.HumanoidRootPart)
							BV.MaxForce = Vector3.new(10000,10000,10000)
							BV.Velocity= humRP.CFrame.lookVector*10
							game.Debris:AddItem(BV,0.4)
							
							InsertDisabled(hit.Parent,0.8)
							Hiteffect(hit.Parent.HumanoidRootPart)
							
						end
					end
				end)
			end
		end)
	end
end)
