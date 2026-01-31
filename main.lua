assert(SMODS.load_file("src/disable.lua"))()

-- Modified Jokers
assert(SMODS.load_file("src/jokers/jokers.lua"))()

-- Modified Consumables
assert(SMODS.load_file("src/consumables/tarots.lua"))()
assert(SMODS.load_file("src/consumables/vouchers.lua"))()

-- Modified Poker Hands
assert(SMODS.load_file("src/hands/pokerhands.lua"))()

-- Custom Challenges
-- assert(SMODS.load_file("src/challenges/madness_and_chaos.lua"))()
-- assert(SMODS.load_file("src/challenges/flush_five.lua"))()