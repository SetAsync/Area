# Area
Use the Area module to create actions whenever a player leaves / enters an area.

Usage:
```lua
-- Fetch Model
local Area = require(path) -- Insert path or 16848690726.
local PartArea = game.Workspace.PartArea -- Define the area using a part.

function OnEnter(Player)

end

function OnLeave(Player)

end

Area.MakeArea(PartArea, OnEnter, OnLeave, 0.1)
```

The last argument of MakeArea is the delay between "ticks", on each tick a copy of all players in the area will be compared to the prior copy and any changes will be directed to their respective functions.

Both OnEnter and OnLeave will also be sent the latest copy of the area as the second argument.
