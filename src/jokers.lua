


SMODS.Joker:take_ownership (
    'mystic_summit', 
    {
        blueprint_compat = true,
        rarity = 1,
        cost = 5,
        pos = {x=2, y=2},
        config = {
            extra = {
                mult = 10,
                d_remaining = 0,
            },
        },
        loc_vars = function(self, info_queue, card)
            return { 
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.d_remaining
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main and G.GAME.current_round.discards_left == cards.ability.extra.d_remaining then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end

    },
    -- true -- silent | suppresses mod badge
)