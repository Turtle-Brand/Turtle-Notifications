<h1 align="center">Turtle-Notifications</h1>

![Image Of Turtle Notifications](https://i.gyazo.com/3d63118f4f8f44106add2d7ef12cef85.png)

A Notification and Popup library made in the style of Turtle Spy!

If you find any bugs or want to make a suggestions, Make a issue on github ❤️

## Features

* Plugin Support
* Notifications (duh)
* Notification "Queueing" So the user doesn't get bombarded with Notifications.
* Popups.

## API

Initiate The Library:

```lua
local TurtleNotifications = loadstring(game:HttpGet("raw.githubusercontent.com/Turtle-Brand/Turtle-Notifications/main/source.lua"))()

-- Args
-- 1: DestroyOld: If the library already has a exsisting instance then it will destroy the old Gui and Make a new one. If false then will return the old instance (if it exsists)

-- 2: TimeBetweenNotifications: The Time Between Notifications

local NotificationLibrary = TurtleNotifications.new(false, 2)
```

Load A Plugin.

```lua
-- Args:
--  1: URL: URL of the plugins code i.e. "raw.githubusercontent.com/Turtle-Brand/Turtle-Notifications/main/pluginexample.lua"


-- Load the example plugin from the Turtle Notifications repo
local Plugin = NotificationLibrary:LoadPlugin("raw.githubusercontent.com/Turtle-Brand/Turtle-Notifications/main/pluginexample.lua")

-- Then you call one of the plugins functions. Dont call a plugin function if it starts with and _ because that means its a plugins internal function (You can call it if you know what you're doing, of course)
Plugin:HelloWorld()
```

Queue Up A Notification.

```lua
-- Args:
--  1: WaitTime: The time to wait until the Notification goes away, if 0 then it will not go away until user interacts

--  2: Title: Title of the Notification

--  3: Description: Description of the Notification (Description just being a the text under the title)

--  4: Type: Type of Notification. The only two type as of now is "Cancel-Continue" and "Ok" these pick which buttons apear, If it is Ok then the Ok Button will be visible. If  Cancel-Continue then the Cancel and Continue buttons will be visible.

--  5: Callbacks: In the form of a Dictionary, i.e. if you have type as "Cancel-Continue" Then you make a Table with the Callbacks formated like this {Cancel = function() 
--   print("Cancel Pressed")
--  end, Continue = function()
--   print("Continue Pressed")
--  end} 
--  and if the type is "Ok" then it would look like {Ok = function()
--   print("Ok Pressed")
--  end}

-- 6: ?Positions: Optional arg that lets you pick where the notification will start and end. i.e. {
--    Start = UDim2.new(0.7, 0, 1, 0),
--    End = UDim2.new(0.7, 0, 0.8, 0)
--} This will make the Notification goto the End and then Tween To The Start and then Tween To The End. So the end should be off screen, and the Start should be where you want the user to look to see the Notification


-- Returns 2 bindable events one that gets fired when the notification starts and one that gets fired when the notification is finished (its duration passed or a user interacted)

NotificationLibrary:QueueNotification(5, "Test Title", "Example Text!", "Ok", {Ok = function() 
    print("Ok Pressed!")
end})
```

Notification Design If Type Is "Ok".

![Turtle Notification with the Type "Ok"](https://gyazo.com/0a274957d722e9ba6e74d5e60e277e9f.png)

Make A Popup.

*One cool thing you can do with this is instead of using :PopupOnMouse to have it on the mouse,
You can have it popup on the Gui button the user pressed itself, maybe making it centered or something like that.
It just allows more design choices

```lua
-- Args:
--  1: Position: Position of the popup as a UDim2

--  2: Buttons: A table of Buttons to be in the popup in the form of a Dictonary i.e. {{
--      Text = "Example",
--      Callback = function()
--          print("Example Pressed")
--      end
--  }, {
--      Text = "Example 2",
--      Callback = function()
--            print("Example 2 Pressed")
--      end
--  }} 

-- returns a bindable event that fires when the popup is clicked off, a button is pressed or another popup overrides it.

NotificationLibrary:Popup(UDim2.new(0.5, 0, 0.5, 0), {{
    Text = "Test Button",
    Callback = function()
        print("Test Button Pressed")
    end
}})
```

Set Notification Delay.

```lua
-- Args
-- 1: Delay: The Delay Between Queued Notifications

NotificationLibrary:SetNotificationDelay(5)
```

Make A Popup On The Mouse.

```lua
-- Args
-- 1: Buttons: A table of Buttons to be in the popup in the form of a Dictonary i.e. {{
--      Text = "Example",
--      Callback = function()
--          print("Example Pressed")
--      end
--  }, {
--      Text = "Example 2",
--      Callback = function()
--            print("Example 2 Pressed")
--      end
--  }} 

-- returns a bindable event that fires when the popup is clicked off, a button is pressed or another popup overrides it.

NotificationLibrary:PopupAtMouse({{
    Text = "Test Button",
    Callback = function()
        print("Test Button Pressed")
    end
}})
```

## Plugins

If you would like to make a plugin check out [pluginexample.lua](https://github.com/Turtle-Brand/Turtle-Notifications/blob/main/pluginexample.lua) in the repo.
Also feel free to make a pull request exapanding the PluginUtils table in the TurtleNotifications.new() which is basically the Plugin API.
If I don't see your plugin and add it and you would like it here, message me on on discord (littlepriceonu#0001)
Documented Plugins:

* Warn, A plugin by me that lets you use the :Warn function to make the description of that notification red. read Warn.md in the Plugins/Warn folder in the repo

<h2 align="center">Made With ❤️ By Littlepriceonu#0001</h2>
<h3 align="center">With Emotional Support From Intrer#0421</h3>
