--[[
	LÖVE Dice

	A simple dice library (handy for use in LÖVE games)

	With this library you can:
		- Roll an n-sided die
		- Roll an n-sided die and check the result
		- Get the probability of rolling a number
--]]

local Dice = {}
Dice.__index = Dice

local Die = {}
Die.__index = Die

-- The number of sides on our default die
local DEFAULT_SIDES = 6

-- Roll a die (with self.sides sides) and get the result
-- Example: print("You rolled a " .. die:roll())
function Die:roll()
	return (math.floor(math.random() * self.sides) + 1)
end

-- Roll a die and check if one of the arguments is the result
-- Example: if die:rolled(1, 4) print "You rolled 1 or 4" end
function Die:rolled(...)
	local rolled = self:roll()
	for i = 1, select('#', ...) do
		if select(i, ...) == rolled then
			return true
		end
	end
	return false
end

-- Get the probability of rolling one of the arguments
-- Example: print("There is a " .. string.format("%.2f", die:chanceof(1, 3) * 100) .. "% chance of rolling 1 or 3")
function Die:chanceof(...)
	return select('#', ...) * (1 / self.sides)
end

-- Create a new die with the chosen number of sides
-- Example: local die = Dice.newDie(6)
function Dice.newDie(sides)
	if sides == nil then
		sides = DEFAULT_SIDES
	else
		assert(type(sides) == "number", "sides must be a number (or omit it for a 6-sided die)")
		assert(sides > 0, "sides must be at least 1")
	end
	local self = {sides = sides}
	setmetatable(self, Die)
	return self
end

-- The default die to use for convenience
local default_die = Dice.newDie(DEFAULT_SIDES)

-- Roll the default die
function Dice.roll()
	return default_die:roll()
end

-- Roll and check the default die
function Dice.rolled(...)
	return default_die:rolled(...)
end

-- Chance of getting one of the arguments from the default die
function Dice.chanceof(...)
	return default_die:chanceof(...)
end

return Dice