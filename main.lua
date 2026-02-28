assert(SMODS.load_file("src/jokers.lua"))()

assert(SMODS.load_file("src/tarots.lua"))()
assert(SMODS.load_file("src/spectrals.lua"))()
assert(SMODS.load_file("src/vouchers.lua"))()

assert(SMODS.load_file("src/decks.lua"))()

-- Modified Poker Hands
-- assert(SMODS.load_file("src/pokerhands.lua"))()

-- Custom Challenges
-- assert(SMODS.load_file("src/challenges/madness_and_chaos.lua"))()
-- assert(SMODS.load_file("src/challenges/flush_five.lua"))()

-- Test - A shit ton of cash, disable when uploading to github
assert(SMODS.load_file("test/test.lua"))()