--[[
    Remote Events Module
    Manages client-server communication
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RemoteEvents = {}
RemoteEvents.Events = {}
RemoteEvents.Functions = {}

-- Create or get remote event
function RemoteEvents:GetEvent(eventName)
    if not self.Events[eventName] then
        local event = ReplicatedStorage:FindFirstChild(eventName)
        if not event then
            event = Instance.new("RemoteEvent")
            event.Name = eventName
            event.Parent = ReplicatedStorage
        end
        self.Events[eventName] = event
    end
    return self.Events[eventName]
end

-- Create or get remote function
function RemoteEvents:GetFunction(functionName)
    if not self.Functions[functionName] then
        local func = ReplicatedStorage:FindFirstChild(functionName)
        if not func then
            func = Instance.new("RemoteFunction")
            func.Name = functionName
            func.Parent = ReplicatedStorage
        end
        self.Functions[functionName] = func
    end
    return self.Functions[functionName]
end

-- Initialize all events
function RemoteEvents:Initialize()
    -- Player Data
    self:GetEvent("UpdatePlayerData")
    self:GetEvent("RequestPlayerData")
    
    -- Respect System
    self:GetEvent("UpdateRespect")
    self:GetEvent("RespectChanged")
    
    -- Job System
    self:GetEvent("ChangeJob")
    self:GetEvent("JobChanged")
    self:GetFunction("GetAvailableJobs")
    
    -- Economy
    self:GetEvent("UpdateMoney")
    self:GetEvent("Transaction")
    
    -- Interactions
    self:GetEvent("Handcuff")
    self:GetEvent("Arrest")
    self:GetEvent("Heal")
    self:GetEvent("Revive")
    self:GetEvent("Fine")
    
    -- Inventory
    self:GetEvent("UpdateInventory")
    self:GetEvent("UseItem")
    self:GetFunction("GetInventory")
    
    -- Vehicle System
    self:GetEvent("SpawnVehicle")
    self:GetEvent("DespawnVehicle")
    
    -- Chat/Commands
    self:GetEvent("SendCommand")
    self:GetEvent("SystemMessage")
    
    -- UI Updates
    self:GetEvent("UpdateUI")
    self:GetEvent("ShowNotification")
    
    print("[RemoteEvents] Initialized all remote events and functions")
end

return RemoteEvents
