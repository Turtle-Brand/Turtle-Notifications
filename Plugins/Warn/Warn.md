
# Warn

use the :Warn() to make the description text red

add the plugin to Turtle Notis

```lua
local Warn = NotificationLibrary:LoadPlugin("raw.githubusercontent.com/Turtle-Brand/Turtle-Notifications/main/Plugins/Warn/Warn.lua")
```

Warn the user

```lua

-- Yea this is just Copy and pasted from the readme.md's QueueNotifcation Function with a new "AddWarnText" argument after the "Postitions" argument

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

-- 7: Add Warn Text: Addeds "!Warn!" to the start of the title: boolean (true or false)


-- Returns 2 bindable events one that gets fired when the notification starts and one that gets fired when the notification is finished (its duration passed or a user interacted)

    Warn:Warn(5, "Test Title", "Test Description", "Ok", {Ok=function() 
        print("Ok Clicked")
    end}, nil, true)
```
