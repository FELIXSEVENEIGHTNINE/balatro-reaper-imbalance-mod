-- 1 | Joker
SMODS.Joker:take_ownership (
    'joker', 
    {
        order = '1',
        cost = 1
    }
)

-- 2 | Greedy Joker
SMODS.Joker:take_ownership (
    'greedy_joker', 
    {
        order = '2',
    }
)

-- 3 | Lusty Joker
SMODS.Joker:take_ownership (
    'lusty_joker', 
    {
        order = '3',
    }
)

-- 4 | Wrathful Joker
SMODS.Joker:take_ownership (
    'wrathful_joker', 
    {
        order = '4',
    }
)

-- 5 | Gluttonous Joker
SMODS.Joker:take_ownership (
    'gluttenous_joker', 
    {
        order = '5',
    }
)

-- 6 | Jolly Joker
SMODS.Joker:take_ownership (
    'jolly', 
    {
        order = '6',
        config = {
            extra = {
                t_mult = 4,
                type = 'Pair',
            }
        }
    }
)

-- 7 | Zany Joker
SMODS.Joker:take_ownership (
    'zany', 
    {
        order = '7',
        config = {
            extra = {
                t_mult = 6,
                type = 'Three of a Kind',
            }
        }
    }
)

-- 8 | Mad Joker
SMODS.Joker:take_ownership (
    'mad', 
    {
        order = '8',
        config = {
            extra = {
                t_mult = 8,
                type = 'Two Pair',
            }
        }
    }
)

-- 9 | Crazy Joker
SMODS.Joker:take_ownership (
    'crazy', 
    {
        order = '9',
        config = {
            extra = {
                t_mult = 10,
                type = 'Straight',
            }
        }
    }
)

-- 10 | Droll Joker
SMODS.Joker:take_ownership (
    'droll', 
    {
        order = '10',
        config = {
            extra = {
                t_mult = 10,
                type = 'Flush',
            }
        }
    }
)

-- 16 | Half Joker
SMODS.Joker:take_ownership (
    'half', 
    {
        order = '15',
    }
)

-- 17 | Joker Stencil
SMODS.Joker:take_ownership (
    'stencil', 
    {
        order = '16',
        loc_vars = function(self, info_queue, card)
            local x_mult = 0
            if G.jokers then
                x_mult = G.jokers.config.card_limit - #G.jokers.cards

                for i=1, #G.jokers.cards do
                    if G.jokers.cards[i].ability.name == 'Joker Stencil' then
                        x_mult = x_mult + 1
                    end
                end

                x_mult = math.max(1, x_mult * 2)
            end

            return {
                vars = {
                    x_mult
                }
            }
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                local x_mult = 0
            
                x_mult = G.jokers.config.card_limit - #G.jokers.cards

                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].ability.name == 'Joker Stencil' then
                        x_mult = x_mult + 1
                    end
                end

                x_mult = math.max(1, x_mult * 2)

                return {
                    xmult = x_mult
                }
            end
        end
    }
)

-- 18 | Four Fingers
SMODS.Joker:take_ownership (
    'four_fingers', 
    {
        order = '17',
    }
)

-- 19 | Mime
SMODS.Joker:take_ownership (
    'mime', 
    {
        order = '18',
    }
)

-- 20 | Credit Card
SMODS.Joker:take_ownership (
    'credit_card', 
    {
        order = '20',
        config = {
            extra = {
                bankrupt_at = 50,
            },
        },
    }
)


-- 23 | Mystic Summit
SMODS.Joker:take_ownership (
    'mystic_summit', 
    {
        order = '23',
        config = {
            extra = {
                mult = 10,
                d_remaining = 0,
            },
        },
    }
)

-- 26 | 8 Ball
SMODS.Joker:take_ownership (
    '8_ball', 
    {
        order = '26',
        config = {
            extra = 3
        },
    }
)

-- 42 | Business Card
SMODS.Joker:take_ownership (
    'business',
    {
        order = '42',
        config = {
            extra = 1
        },
    }
)

-- 58 | Green Joker
SMODS.Joker:take_ownership (
    'green_joker',
    {
        order = '58',
        config = {
            extra = {
                hand_add = 2,
                discard_sub = 9999999999999,
            }
        },

        calculate = function(self, card, context)
            if context.discard and not context.blueprint and context.other_card == context.full_hand[#context.full_hand] then
                local prev_mult = card.ability.mult
                card.ability.mult = math.max(0, card.ability.mult - card.ability.extra.discard_sub)
                if card.ability.mult ~= prev_mult then
                    return {
                        -- message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.discard_sub } },
                        message = localize('k_reset')
                        -- colour = G.C.RED
                    }
                end
                    
            end
        end
    }
)

-- 65 | Square Joker
SMODS.Joker:take_ownership (
    'square', 
    {
        order = '65',
        config = {
            extra = {
                chips = 0,
                chip_mod = 8,
            },
        },
    }
)

-- 67 | Riff-raff
SMODS.Joker:take_ownership (
    'riff_raff', 
    {
        order = '67',
        config = {
            extra = 3
        },
        
        calculate = function(self, card, context)
            if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                local jokers_to_create = math.min(card.ability.extra, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _ = 1, jokers_to_create do
                            local card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, 'rif')
                            card:add_to_deck()
                            G.jokers:emplace(card)
                            card:start_materialize()
                            G.GAME.joker_buffer = 0
                        end
                        return true
                    end
                }))
                return {
                    message = localize('k_plus_joker'),
                    colour = G.C.BLUE,
                }
            end
        end
    }
)

-- 103 | Castle
SMODS.Joker:take_ownership (
    'castle', 
    {
        order = '103',
        config = {
            extra = {
                chips = 0,
                chip_mod = 5,
            },
        },
    }
)

-- 116 | Rough Gem
SMODS.Joker:take_ownership (
    'rough_gem', 
    {
        order = '116',
        config = {
            extra = 3
        },
    }
)

-- 122 | Flowerpot
SMODS.Joker:take_ownership (
    'flower_pot', 
    {
        order = '122',
        config = {
            extra = 12
        },
    }
)

-- 137 | Invisible Joker
SMODS.Joker:take_ownership (
    'invisible', 
    {
        order = '137',
        config = {
            extra = 3
        },
    }
)

-- 145 | Bootstraps
SMODS.Joker:take_ownership (
    'bootstraps', 
    {
        order = '145',
        config = {
            extra = {
                mult = 5,
                dollars = 5,
            },
        },
    }
)

-- 147 | Yorick
SMODS.Joker:take_ownership (
    'yorick', 
    {
        order = '147',
        config = {
            extra = {
                xmult = 0.5,
                discards = 10,
            },
        },
    }
)