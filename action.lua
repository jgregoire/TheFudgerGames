--
-- Action
--

Action = {}
Action.__index = Action

Action:new = function(name, logic, min_actor_stats, max_actor_stats, min_target_stats, max_target_stats, rate)
	local action = {}
	setmetatable(action, Action)

	action.name = name
	action.logic = logic -- NB: this is actually a function assignment
	action.min_actor_stats = min_actor_stats
	action.max_actor_stats = max_actor_stats
	action.min_target_stats = min_target_stats
	action.max_target_stats = max_target_stats
	action.rate = rate

	return action
end

