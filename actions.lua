--
-- Action List
--

-- A list of all the actions that can be performed.
-- Guidelines:
--     'Actor' is the player performing the action.
--     'Target' is the target of the action. This could be the Actor, or another player.
--     Actions should generally require the actor to be alive.

Actions = {}

-- Helper function: Ensure stat stays between 0 and 10.
function set_stat(stat)
	if stat > 10 then
		return 10
	elseif stat < 0
		return 0
	else
		return stat
	end
end


-- Action: Do Nothing
-- Effects: Regain a little HP and EN.
-- Dead actor: still return 'true', but seriously do nothing, ending this player's turn.
function do_nothing(actor, target)
	if actor.stats.HP <= 0 then -- Actor must be alive.
		return false
	else
		actor.stats.HP = set_stat(actor.stats.HP + 1)
		actor.stats.EN = set_stat(actor.stats.EN + 1)
		print actor.name + " stares vacantly into space."
		-- Consider adding a list of flavor text options to randomly choose from.
		return true
	end
end

Actions.Do_Nothing = {
	items_needed = {},
	rate = 5,
	do_action = do_nothing
}

-- Action: Rest
-- Effects: Regain moderate energy and a little HP
function rest(actor, target)
	if actor.stats.HP == 0 or
	   actor.stats.HP >= 10 or
	   actor.stats.EN >= 10 then
		return false
	else
		actor.stats.HP = set_stat(actor.stats.HP + 1)
		actor.stats.EN = set_stat(actor.stats.EN + 4)
		print actor.name + " decides they're tired and rests for a while."
		return true
	end
end

-- Action: Scream
-- Effects: Sort of like doing nothing, but screaming is cathartic, so recover some PR
function scream(actor, target)
	if actor.stats.HP == 0 or
	   actor.stats.EN < 1 then
		return false
	else
		actor.stats.HP = set_stat(actor.stats.HP + 1)
		actor.stats.PR = set_stat(actor.stats.PR + 1)
		actor.stats.EN = set_stat(actor.stats.EN - 1)
		print actor.name + " screams for a while, then feels a bit better."
		return true
	end
end

-- Action: Scream At
-- Effects: Get pumped, freak out the other guy. 
function scream_at(actor, target)
	if actor.stats.HP == 0 then
		return false
	else
		actor.stats.EN = set_stat(actor.stats.EN + 2)
		target.stats.EN = set_stat(target.stats.EN - 2)
		print actor.name + " screams at " target.name + "!"
		return true
	end
end

-- Action: Die
-- Effects: Actor dies.
function die(actor, target)
	if actor.stats.HP == 0 then
		return false
	else
		actor.stats.HP = set_stat(0)
		print actor.name + " fell off a cliff and died!"
		return true
	end
end

-- Action: Injure Self
-- Effects: Lose some HP. Idiot.
function injure_self(actor, target)
	if actor.stats.HP == 0 then
		return false
	else
		actor.stats.HP = set_stat(actor.stats.HP - 5)
		if actor.stats.HP == 0 then
			print actor.name + " got mauled by a bear and died."
		else
			print actor.name + " ran headfirst into a tree. Ouch!"
		end
		return true
	end
end

-- Action: Flee
-- Effects: Lose some Energy.
function flee(actor, target)
	if actor.stats.HP == 0 then
		return false
	else
		actor.stats.EN = set_stat(actor.stats.EN - 2)
		print actor.name + " saw " target.name + " and ran away."
		return true
	end
end
