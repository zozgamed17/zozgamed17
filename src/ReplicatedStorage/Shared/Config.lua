--[[
    Configuration Module
    Central configuration for the roleplay server
]]

local Config = {}

-- Server Settings
Config.ServerName = "FiveM-Style Roleplay Server"
Config.MaxPlayers = 50
Config.AutoSave = true
Config.AutoSaveInterval = 300 -- seconds

-- Respect System
Config.Respect = {
    StartingRespect = 0,
    MinRespect = -1000,
    MaxRespect = 1000,
    
    -- Respect gains/losses
    Actions = {
        HelpPlayer = 5,
        CompleteJob = 10,
        ArrestCriminal = 15,
        HealPlayer = 10,
        RobStore = -20,
        KillPlayer = -30,
        GetArrested = -15,
        PayFine = 5,
        DonateToCharity = 20
    }
}

-- Economy System
Config.Economy = {
    StartingMoney = 5000,
    MaxMoney = 10000000,
    
    -- Job Salaries (per action/time)
    Salaries = {
        Police = 150,
        EMS = 120,
        FireFighter = 130,
        Mechanic = 100,
        Taxi = 80,
        Delivery = 90
    },
    
    -- Prices
    Prices = {
        Vehicle = 25000,
        House = 100000,
        Food = 50,
        Water = 30,
        RepairKit = 500
    }
}

-- Job System
Config.Jobs = {
    Civilian = {
        Name = "Civilian",
        Color = Color3.fromRGB(200, 200, 200),
        Salary = 0,
        RequiredRespect = 0,
        Permissions = {}
    },
    
    Police = {
        Name = "Police Officer",
        Color = Color3.fromRGB(0, 100, 255),
        Salary = 150,
        RequiredRespect = 50,
        Permissions = {"Arrest", "Handcuff", "Fine", "Tase"}
    },
    
    EMS = {
        Name = "Paramedic",
        Color = Color3.fromRGB(255, 100, 100),
        Salary = 120,
        RequiredRespect = 30,
        Permissions = {"Heal", "Revive"}
    },
    
    FireFighter = {
        Name = "Fire Fighter",
        Color = Color3.fromRGB(255, 150, 0),
        Salary = 130,
        RequiredRespect = 30,
        Permissions = {"Extinguish"}
    },
    
    Mechanic = {
        Name = "Mechanic",
        Color = Color3.fromRGB(100, 100, 100),
        Salary = 100,
        RequiredRespect = 10,
        Permissions = {"Repair", "Tow"}
    },
    
    Criminal = {
        Name = "Criminal",
        Color = Color3.fromRGB(150, 0, 0),
        Salary = 0,
        RequiredRespect = -50,
        Permissions = {"Lockpick", "Rob"}
    }
}

-- Admin Ranks
Config.AdminRanks = {
    Owner = 5,
    HeadAdmin = 4,
    Admin = 3,
    Moderator = 2,
    Helper = 1,
    Player = 0
}

-- Admin List (UserId : Rank)
Config.Admins = {
    -- [123456789] = Config.AdminRanks.Owner,
    -- Add admin UserIds here
}

-- Whitelist System
Config.WhitelistEnabled = false
Config.WhitelistedUsers = {
    -- [123456789] = true,
}

-- Spawn Locations
Config.SpawnLocations = {
    Civilian = Vector3.new(0, 5, 0),
    Police = Vector3.new(100, 5, 0),
    EMS = Vector3.new(-100, 5, 0),
    FireFighter = Vector3.new(0, 5, 100),
    Mechanic = Vector3.new(0, 5, -100),
    Criminal = Vector3.new(-100, 5, -100)
}

-- Vehicle System
Config.Vehicles = {
    Enabled = true,
    MaxVehiclesPerPlayer = 3,
    DespawnOnLeave = true
}

-- Interaction System
Config.Interactions = {
    MaxDistance = 10, -- studs
    HandcuffDuration = 300, -- seconds
    TaseDuration = 10 -- seconds
}

-- Anti-Cheat
Config.AntiCheat = {
    Enabled = true,
    MaxSpeed = 100, -- studs per second
    KickOnExploit = true,
    LogExploits = true
}

return Config
