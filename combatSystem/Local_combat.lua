local userInput = game:GetService("UserInputService");

local player = game.Players.LocalPlayer;

local combo = 1;

local Debounce = false;

local Remote = game.ReplicatedStorage:WaitForChild("Combat")

userInput.InputBegan:Connect(function(input,IsTyping)
	
	if IsTyping then return end
	
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		local Char = player.Character;
		local Hum = Char:WaitForChild("Humanoid")
		
		if Debounce == false then
			Debounce = true
			
			if combo == 1 then
				Remote:FireServer("Punch",combo)
				combo = 2
			elseif combo == 2 then
				Remote:FireServer("Punch",combo)
				combo = 3
			elseif combo == 3 then
				Remote:FireServer("Punch",combo)
				combo =4
			elseif combo == 4 then
				Remote:FireServer("Punch",combo)
				combo = 1				
			end
		end
		
	end
	
end)

Remote.OnClientEvent:Connect(function()
	if Debounce == true then
		Debounce = false
	end
end)

