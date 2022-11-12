---@diagnostic disable: undefined-global
---@diagnostic disable: deprecated
local Warn = {}
Warn.__index = Warn

local ActualPluginName = "Warn"

function Warn.new(NotificationLibrary, index)
    local nt = setmetatable({}, Warn)

    -- Data is the description btw
    nt.DataCol = NotificationLibrary.Notification.Data.TextColor3
    nt.Og = Color3.new(nt.DataCol.R, nt.DataCol.G, nt.DataCol.B)
    nt.Color = Color3.fromRGB(255, 0, 0)
    nt.index = index
    nt.NotificationLibrary = NotificationLibrary

    --spawn(function()
    --    repeat wait() until NotificationLibrary.LoadedPlugins[index] ~= nil
    --
    --    nt:_Init()
    --end)

    return nt, ActualPluginName
end


--function Warn:_Init()
--    
--end

function Warn:Warn(duration, title, discription, type, typedic, ...)
    print(self.DataCol)

    local optional = {...}

    local pos = optional[1]
    local addwarntext = optional[2]

    if addwarntext then
        title = "!Warn! " .. title
    end

    local Onstart, Onfinish = self.NotificationLibrary:QueueNotification(duration, title, discription, type, typedic, pos)

    Onstart.Event:Connect(function()
        self.NotificationLibrary.Notification.Data.TextColor3 = self.Color
    end)

    Onfinish.Event:Connect(function()
        self.NotificationLibrary.Notification.Data.TextColor3 = self.Og
    end)

    return Onstart, Onfinish
end

return Warn