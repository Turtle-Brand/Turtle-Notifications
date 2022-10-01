---@diagnostic disable: undefined-global
---@diagnostic disable: deprecated
local Warn = {}
Warn.__index = Warn

local ActualPluginName = "Warn"

function Warn.new(NotificationLibrary, index)
    local newtable = setmetatable({}, Warn)

    newtable.index = index
    newtable.NotificationLibrary = NotificationLibrary

    spawn(function()
        repeat wait() until NotificationLibrary.LoadedPlugins[index] ~= nil

        newtable:_Init()
    end)

    return newtable, ActualPluginName
end


function Warn:_Init()
    self.NotificationLibrary:QueueNotification(5, "About Popups", "When you want to close a popup without having to press a button, just press left alt!", "Ok", {Ok = function()end})
end

return Warn