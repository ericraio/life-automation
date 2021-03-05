set itsAlive to true

-- check if Things is running
if application "Things3" is not running then
        set itsAlive to false
        tell application "Things3" to activate
end if

-- if we start before EN or Things is ready, we'll get an error. So give them a chance!
-- Wait a cycle. If they're still not right, we'll see the error then
if not itsAlive then
        delay 60
end if

tell application "Things3"
        make new to do with properties {name:"Execute things3 helper app in Applications directory", due date:current date} at beginning of list "Today"
end tell
