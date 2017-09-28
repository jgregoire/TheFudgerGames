--
-- Stats Table
--


-- Declare the table
Stats = {}
Stats.__index = Stats

-- Add a function to the table (a constructor in this case)
function Stats:new(hp, en, cu, st, lr, pr)
	--return setmetatable({ HP = hp, EN = en, CU = cu, ST = st, LR = lr, PR = pr }, Stats)
	local stats = {}
	setmetatable(stats, Stats)
	stats.HP = hp
	stats.EN = en
	stats.CU = cu
	stats.ST = st
	stats.LR = lr
	stats.PR = pr
	return stats
end


