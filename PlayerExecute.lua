-- Replace the username to search for
local targetUsername = "ellxzyie"
local playerService = game:GetService("Players")
local function executeTargetPlayer()
   --Replace this with the code you want to run
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
   ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Test", "All")
   --Replace this with the code you want to run
end

local function checkTargetPlayer()
    while true do
        local targetPlayer = playerService:FindFirstChild(targetUsername)
        if targetPlayer then
            executeTargetPlayer()
            break
        end
        wait(1) -- Adjust the frequency of checking for that player
    end
end

checkTargetPlayer()
