--[[
    Items Module
    Defines all items in the game
]]

local Items = {}

Items.List = {
    -- Tools
    Handcuffs = {
        Name = "Handcuffs",
        Description = "Restrain suspects",
        Type = "Tool",
        MaxStack = 1,
        Price = 0,
        JobRestricted = {"Police"}
    },
    
    Taser = {
        Name = "Taser",
        Description = "Non-lethal weapon",
        Type = "Tool",
        MaxStack = 1,
        Price = 0,
        JobRestricted = {"Police"}
    },
    
    MedKit = {
        Name = "Medical Kit",
        Description = "Heal injured players",
        Type = "Tool",
        MaxStack = 5,
        Price = 500,
        JobRestricted = {"EMS"}
    },
    
    RepairKit = {
        Name = "Repair Kit",
        Description = "Fix damaged vehicles",
        Type = "Tool",
        MaxStack = 3,
        Price = 500,
        JobRestricted = {"Mechanic"}
    },
    
    Lockpick = {
        Name = "Lockpick",
        Description = "Pick locks (illegal)",
        Type = "Tool",
        MaxStack = 10,
        Price = 200,
        JobRestricted = {"Criminal"}
    },
    
    -- Consumables
    Food = {
        Name = "Food",
        Description = "Restore hunger",
        Type = "Consumable",
        MaxStack = 10,
        Price = 50,
        Effect = {Type = "Hunger", Amount = 50}
    },
    
    Water = {
        Name = "Water",
        Description = "Restore thirst",
        Type = "Consumable",
        MaxStack = 10,
        Price = 30,
        Effect = {Type = "Thirst", Amount = 50}
    },
    
    -- Documents
    IDCard = {
        Name = "ID Card",
        Description = "Your identification",
        Type = "Document",
        MaxStack = 1,
        Price = 0,
        JobRestricted = {}
    },
    
    DriverLicense = {
        Name = "Driver License",
        Description = "Legal driving permit",
        Type = "Document",
        MaxStack = 1,
        Price = 1000,
        JobRestricted = {}
    },
    
    -- Misc
    Radio = {
        Name = "Radio",
        Description = "Communicate with team",
        Type = "Tool",
        MaxStack = 1,
        Price = 0,
        JobRestricted = {"Police", "EMS", "FireFighter"}
    }
}

function Items:GetItem(itemName)
    return self.List[itemName]
end

function Items:IsValidItem(itemName)
    return self.List[itemName] ~= nil
end

function Items:CanPlayerUseItem(player, itemName, playerJob)
    local item = self:GetItem(itemName)
    if not item then return false end
    
    if #item.JobRestricted == 0 then
        return true
    end
    
    for _, job in ipairs(item.JobRestricted) do
        if job == playerJob then
            return true
        end
    end
    
    return false
end

return Items
