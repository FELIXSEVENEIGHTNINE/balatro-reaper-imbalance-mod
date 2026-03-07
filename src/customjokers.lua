SMODS.Atlas{
    key = "CustomJoker",
    path = "CustomJoker.png",
    px = 71,
    py = 95,
}

-- SMODS.Joker{
--     key = "wild_joker",
--     atlas = "CustomJoker",
--     pos = {x = 0, y = 0},
--     rarity = 2,
--     cost = 5,
--     blueprint_compat = true,
--     eternal_compat = true,
--     perishable_compat = true,
--     config = {
--         extra = 1,
--     },

--     calculate = function(self, card, context)
--         if context.repetition and context.cardarea == G.play and context.other_card and context.other_card.config.center.key == "m_wild" then
--             return {
--                 repetitions = card.ability.extra
--             }
--         end
--     end,

--     loc_txt = {
--         name = "Wild Joker",
--         text = {
--             "Retrigger all",
--             "played {C:attention}Wild{} cards",
--         },
--     },
-- }