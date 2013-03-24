# LÖVE Dice

This is a small (and hopefully useful) Lua library for rolling dice.

## Usage

Import the library:

	local Dice = require('lovedice.lua')

Roll the default six-sided die:

	print("You rolled a " .. Dice.roll()) -- You rolled a 4

Try and roll an even number:

	if Dice.rolled(2, 4, 6) then
		print("You rolled an even number")
	end

Get our chances of rolling a 3 or 6:

	local chance = Dice.chanceof(3, 6)
	print("There is a " .. string.format("%.2f", chance * 100) .. "% chance of rolling 3 or 6")

Create a 20-sided die:

	local die20 = Dice.newDie(20)

Roll our 20-sided die:

	print("You rolled a " .. die20:roll()) -- You rolled a 13

Try and roll a multiple of 4:

	if die20:rolled(4, 8, 12, 16, 20) then
		print("You rolled a multiple of 4")
	end

Get our chances of rolling 1, 10 or 20:

	local chance = die20:chanceof(1, 10, 20)
	print("There is a " .. string.format("%.2f", chance * 100) .. "% chance of rolling 1, 10 or 20")

## Requirements

Lua 5.1 (varargs are handled with select)

## License

This project is released under the MIT License - see the LICENSE file for details.