--[[
    Jobs Module
    Defines all available jobs and their properties
]]

local Jobs = {}

Jobs.List = {
    "Civilian",
    "Police",
    "EMS",
    "FireFighter",
    "Mechanic",
    "Criminal"
}

Jobs.Data = {
    Civilian = {
        DisplayName = "Civilian",
        Description = "A regular citizen of the city",
        Icon = "rbxassetid://0", -- Replace with actual asset ID
        Uniform = {},
        Tools = {},
        Vehicles = {}
    },
    
    Police = {
        DisplayName = "Police Officer",
        Description = "Enforce the law and protect citizens",
        Icon = "rbxassetid://0",
        Uniform = {
            ShirtTemplate = "rbxassetid://0",
            PantsTemplate = "rbxassetid://0"
        },
        Tools = {"Handcuffs", "Taser", "Radio"},
        Vehicles = {"PoliceCar", "PoliceMotorcycle"}
    },
    
    EMS = {
        DisplayName = "Paramedic",
        Description = "Save lives and heal the injured",
        Icon = "rbxassetid://0",
        Uniform = {
            ShirtTemplate = "rbxassetid://0",
            PantsTemplate = "rbxassetid://0"
        },
        Tools = {"MedKit", "Stretcher", "Radio"},
        Vehicles = {"Ambulance"}
    },
    
    FireFighter = {
        DisplayName = "Fire Fighter",
        Description = "Fight fires and rescue people",
        Icon = "rbxassetid://0",
        Uniform = {
            ShirtTemplate = "rbxassetid://0",
            PantsTemplate = "rbxassetid://0"
        },
        Tools = {"FireExtinguisher", "Axe", "Radio"},
        Vehicles = {"FireTruck"}
    },
    
    Mechanic = {
        DisplayName = "Mechanic",
        Description = "Repair vehicles and help stranded drivers",
        Icon = "rbxassetid://0",
        Uniform = {
            ShirtTemplate = "rbxassetid://0",
            PantsTemplate = "rbxassetid://0"
        },
        Tools = {"Wrench", "RepairKit", "TowCable"},
        Vehicles = {"TowTruck", "MechanicVan"}
    },
    
    Criminal = {
        DisplayName = "Criminal",
        Description = "Live outside the law (at your own risk)",
        Icon = "rbxassetid://0",
        Uniform = {},
        Tools = {"Lockpick", "Crowbar"},
        Vehicles = {}
    }
}

function Jobs:GetJobData(jobName)
    return self.Data[jobName]
end

function Jobs:IsValidJob(jobName)
    return self.Data[jobName] ~= nil
end

return Jobs
