--
-- Player
--

-- Create the prototype (the "parent" object)
Player = {}
Player.__index = Player

-- Define a constructor, called "new".
function Player:new(name, district, stats, items, img, score, alliance)
	-- initialize child
	local player = {}
	setmetatable(player, Player)

	-- set attributes
	player.name = name
	player.district = district
	player.stats = stats
	player.inventory = player:trim_inventory(stats, inventory)
	player.img = img
	player.score = score
	player.alliance = alliance

	-- send the child to whoever called this function. Now they have an "object!"
	return player
end

function Player:trim_inventory(stats, items)
	local inv = {}

	-- Ensure that players start with a nearly full inventory, consisting of items they can use.

	-- Randomize list of items
	-- Foreach item:
		-- Check if player can use it.
			-- No: Skip to next item in list.
			-- Yes: Check if item fits in inventory.
				-- Yes: Add item
				-- No: Finished. This is the player's starting inventory.
		-- If we ran through the full list, then end.

	return inv
end

