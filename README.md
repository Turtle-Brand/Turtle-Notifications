# Turtle-Notifications

[Image Of Turtle Notifications](https://gyazo.com/3d63118f4f8f44106add2d7ef12cef8.png)

A Notification library for popups and Notifications (duh), made in the style of turtle!

If you find any bugs or want to make a suggestions, Make a issue on github ❤️

## Features

* Notifications (duh)
* Notification "Queueing" So the user doesn't get bombarded with Notifications.
* Popups.
* Popups On The Mouse.

## API

Initiate The Library:

```lua
local TurtleNotifications = loadstring(game:HttpGet("raw.githubusercontent.com/Turtle-Brand/Turtle-Notifications/main/source.lua"))()

-- Args
-- 1: DestroyOld: If the library already has a exsisting instance then it will destroy the old Gui and Make a new one.

-- 2: TimeBetweenNotifications: The Time Between Notifications

local NotificationLibrary = TurtleNotifications.new(false, 2)
```

Queue Up A Notification.

```lua
-- Args:
--  1: WaitTime: The time to wait until the Notification goes away, if 0 then it will not go away until user interacts

--  2: Title: Title of the Notification

--  3: Description: Description of the Notification

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

NotificationLibrary:QueueNotification(5, "Test Title", "Example Text!", "Ok", {Ok = function() 
    print("Ok Pressed!")
end})
```

Make A Popup.

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

NotificationLibrary:Popup(UDim2.new(0.5, 0, 0.5, 0), {{
    Text = "Test Button",
    Callback = function()
        print("Test Button Pressed")
    end
}})
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

NotificationLibrary:PopupAtMouse({{
    Text = "Test Button",
    Callback = function()
        print("Test Button Pressed")
    end
}})
```

## Made with ❤️ by Littlepriceonu#0001
