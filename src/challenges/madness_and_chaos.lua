local ranks = {'A','2','3','4','5','6','7','8','9','10','J','Q','K'}
math.randomseed(os.time())

local rank1 = ranks[math.random(#ranks)]
-- check if rank1 really has a value
if rank1 == nil then
    rank1 = 'A'
end

local rank2
repeat
    rank2 = ranks[math.random(#ranks)]
until rank2 ~= rank1

-- Create the deck table
local suits = {'C', 'D', 'H', 'S'}
local cards = {}

local amount = 2

for _, suit in ipairs(suits) do
    for i = 1, amount do
        table.insert(cards, {s = suit, r = rank1})
        table.insert(cards, {s = suit, r = rank2})
    end
end

SMODS.Challenge {
    key = "ri_ch_1",
    loc_txt = {
        name = "Madness and Chaos",
    },
    rules = {
        custom = {
            { id = 'no_reward_specific', value = 'Small' },
            { id = 'no_reward_specific', value = 'Big' },
            { id = 'no_interest' },
            { id = 'no_extra_hand_money' },
            -- { id = 'all_eternal' },
            { id = 'no_shop_jokers' },
        },
        modifiers = {
            { id = 'joker_slots', value = 0 },
        }
    },
    jokers = {
        -- { id = 'j_joker', eternal = true},
        { id = 'j_madness', eternal = true},
        { id = 'j_chaos', eternal = true},
        -- { id = 'j_midas_mask', eternal = true},
        -- { id = 'j_vampire', eternal = true },
    },
    deck = {
        type = 'Challenge Deck',
        -- type = 'Erratic Plasma Deck',
        cards = cards
    },
    restrictions = {
        banned_other = {
            { id = 'bl_final_heart', type = 'blind' },
            { id = 'bl_final_leaf',  type = 'blind' },
            { id = 'bl_final_acorn', type = 'blind' },
        },
        banned_cards = {
            { id = 'c_judgement' },
            { id = 'c_wraith' },
            { id = 'c_soul' },
            { id = 'v_antimatter' },
            { 
                id = 'p_buffoon_normal_1', 
                ids = { 'p_buffoon_normal_1', 'p_buffoon_normal_2', 'p_buffoon_jumbo_1', 'p_buffoon_mega_1',}
            },
        },
        banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_negative' },
            { id = 'tag_foil' },
            { id = 'tag_holographic' },
            { id = 'tag_polychrome' },
            { id = 'tag_buffoon' },
            { id = 'tag_top_up' },
        },
    }
}

-- SMODS.Back {
--     name = "Erratic Plasma Deck",
--     key = "ch_back_plasma",
--     loc_txt = {
--         name = "Erratic Plasma Deck",
--         text = {
--             "All {C:attention}Ranks{} in deck",
--             "are randomized",
--             "{C:red}X#1#{} base Blind size",
--         }
--     },
--     pos = { x = 2, y = 3 },
--     config = { 
--         ante_scaling = 3
--     },
--     loc_vars = function(self, info_queue, back)
--         return {
--             vars = {
--                 self.config.ante_scaling
--             }
--         }
--     end,
-- }