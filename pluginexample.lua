---@diagnostic disable: undefined-global
---@diagnostic disable: deprecated
-- You can delete this if you're not using VS Code
-- They dont do anything important though, even in you're using VS Code you can delete them and it'll work just fine.

-- !If you would like to add to the Plugin Api then check out the Turtle Notification source code and see what you can do :)

local PluginName = {}
PluginName.__index = PluginName

local ActualPluginName = "Example Plugin"

function PluginName.new(NotificationLibrary, index)
    local newtable = setmetatable({}, PluginName)

    newtable.index = index
    newtable.NotificationLibrary = NotificationLibrary

    -- !MUST put :Init in a spawn()
    spawn(function()
        newtable:Init()
    end)

    return newtable, ActualPluginName
end


function PluginName:Init()
    -- One Cool Thing You Can Do Is Add Data To The LoadedPlugins Table In The NotificationLibrary Using self.index, This Lets Other Plugins See Data From Your Plugin Without Accesing the Module Manually.
    -- ! This can ONLY be done in the :Init() Function or another functions called in Init(). Trying to edit this in .new() will cause an error
    -- I.E.
    self.NotificationLibrary.LoadedPlugins[self.index].TestData = "Hello!"

    print("Hello From Init!")
    self:HelloWorld()
    self:HookNotification()
end

function PluginName:HelloWorld()
    print("Hello, World!")
    print("Index: " .. tostring(self.index), " | Name: " .. ActualPluginName)
end


--##region Notification Data Example

--data = {
--  WaitTime = int, (if zero will be ignored)
--  TitleText = string,
--  Description = string,
--  Type = "Continue-Cancel" or "Ok",
--  Callbacks = {
--      Continue = function()
--      Cancel = function()
--  } or {
--      Ok = function()
--  },
--  ?Positions = {
--      Start = UDim.new(0.75, 0, 1.1, 0),
--      End = UDim2.new(0.75, 0, 0.78, 0)
--  },
--}
--##endregion

-- This example will hook every notification and add " | Hooked :)" to the end of the description
function PluginName:HookNotification()

    -- OnNotification is a Bindable EVENT not a Bindable Function, This means that changing the data argument and then returning it will not have an effect on the main code.

    self.NotificationLibrary.PluginUtils.OnNotification.Event:Connect(function(data)
        self.NotificationLibrary.Notification.Data.Text = data.Description .. " | Hooked :)"
    end)
end

return PluginName