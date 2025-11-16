--[[
    Utilities Module
    Helper functions used throughout the game
]]

local Utilities = {}

-- Format number with commas
function Utilities:FormatNumber(number)
    local formatted = tostring(number)
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then
            break
        end
    end
    return formatted
end

-- Format money
function Utilities:FormatMoney(amount)
    return "$" .. self:FormatNumber(amount)
end

-- Get distance between two positions
function Utilities:GetDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

-- Check if player is near position
function Utilities:IsPlayerNear(player, position, maxDistance)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    
    local distance = self:GetDistance(player.Character.HumanoidRootPart.Position, position)
    return distance <= maxDistance
end

-- Get player from partial name
function Utilities:GetPlayerFromPartialName(partialName)
    partialName = string.lower(partialName)
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if string.lower(player.Name):sub(1, #partialName) == partialName or 
           string.lower(player.DisplayName):sub(1, #partialName) == partialName then
            return player
        end
    end
    
    return nil
end

-- Round number to decimal places
function Utilities:Round(number, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(number * mult + 0.5) / mult
end

-- Deep copy table
function Utilities:DeepCopy(original)
    local copy
    if type(original) == 'table' then
        copy = {}
        for key, value in next, original, nil do
            copy[Utilities:DeepCopy(key)] = Utilities:DeepCopy(value)
        end
        setmetatable(copy, Utilities:DeepCopy(getmetatable(original)))
    else
        copy = original
    end
    return copy
end

-- Check if table contains value
function Utilities:TableContains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Get table length (works with dictionaries)
function Utilities:TableLength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

-- Wait for child with timeout
function Utilities:WaitForChildTimeout(parent, childName, timeout)
    local startTime = tick()
    while tick() - startTime < timeout do
        local child = parent:FindFirstChild(childName)
        if child then
            return child
        end
        wait(0.1)
    end
    return nil
end

-- Create notification data
function Utilities:CreateNotification(title, message, duration, notificationType)
    return {
        Title = title,
        Message = message,
        Duration = duration or 5,
        Type = notificationType or "Info" -- Info, Success, Warning, Error
    }
end

-- Validate player data
function Utilities:ValidatePlayerData(data, defaults)
    local validated = self:DeepCopy(defaults)
    
    if not data then
        return validated
    end
    
    for key, defaultValue in pairs(defaults) do
        if data[key] ~= nil then
            if type(data[key]) == type(defaultValue) then
                validated[key] = data[key]
            end
        end
    end
    
    return validated
end

-- Clamp value between min and max
function Utilities:Clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

-- Linear interpolation
function Utilities:Lerp(a, b, t)
    return a + (b - a) * t
end

return Utilities
