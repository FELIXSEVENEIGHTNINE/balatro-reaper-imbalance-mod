-- 1 | Joker
SMODS.Joker:take_ownership('joker', { order = 1, cost = 1, })

-- 2 | Greedy Joker
SMODS.Joker:take_ownership('greedy_joker', { order = 2, })

-- 3 | Lusty Joker
SMODS.Joker:take_ownership('lusty_joker', { order = 3, })

-- 4 | Wrathful Joker
SMODS.Joker:take_ownership('wrathful_joker', { order = 4, })

-- 5 | Gluttonous Joker
SMODS.Joker:take_ownership('gluttenous_joker', { order = 5, })

-- 6 | Jolly Joker
SMODS.Joker:take_ownership('jolly', { order = 6, config = { t_mult = 8, type = 'Pair' },})

-- 7 | Zany Joker
SMODS.Joker:take_ownership('zany', { order = 7, config = { t_mult = 12, type = 'Three of a Kind',}})

-- 8 | Mad Joker
SMODS.Joker:take_ownership('mad', { order = 8, config = { t_mult = 10, type = 'Two Pair',}})

-- 9 | Crazy Joker
SMODS.Joker:take_ownership('crazy', { order = 9, config = { t_mult = 12, type = 'Straight',}})

-- 10 | Droll Joker
SMODS.Joker:take_ownership ('droll', { order = 10, config = { t_mult = 12, type = 'Flush',}})

-- 11 | Sly Joker
SMODS.Joker:take_ownership ('sly', { order = 11, config = { t_chips = 50, type = 'Pair',}})

-- 12 | Wily Joker
SMODS.Joker:take_ownership (
    'wily', 
    {
        order = 12,
        config = {
            t_chips = 100,
            type = 'Three of a Kind',
        }
    }
)

-- 13 | Clever Joker
SMODS.Joker:take_ownership (
    'clever', 
    {
        order = 13,
        config = {
            t_chips = 80,
            type = 'Two Pair',
        }
    }
)

-- 14 | Devious Joker
SMODS.Joker:take_ownership (
    'devious', 
    {
        order = 14,
        config = {
            t_chips = 100,
            type = 'Straight',
        }
    }
)

-- 15 | Crafty Joker
SMODS.Joker:take_ownership (
    'crafty', 
    {
        order = 15,
        config = {
            t_chips = 80,
            type = 'Flush',
        }
    }
)

-- 16 | Half Joker
SMODS.Joker:take_ownership ('half', { order = 16, config = { extra = { mult = 15, size = 3, }},})

-- 17 | Joker Stencil
SMODS.Joker:take_ownership (
    'stencil', 
    {
        order = 17,
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
SMODS.Joker:take_ownership ('four_fingers', { order = 18, })

-- 19 | Mime
SMODS.Joker:take_ownership ('mime', { order = 19, config = { extra = 1, }})

-- 20 | Credit Card
SMODS.Joker:take_ownership (
    'credit_card', 
    {
        order = 20,
        config = {
            extra = 30,
        },
    }
)

-- 21 | Ceremonial Dagger
SMODS.Joker:take_ownership (
    'ceremonial', 
    {
        order = 21,
        config = {
            mult = 0
        },
    }
)

-- 22 | Banner
SMODS.Joker:take_ownership (
    'banner', 
    {
        order = 22,
        config = {
            extra = 30
        },
    }
)


-- 23 | Mystic Summit
SMODS.Joker:take_ownership (
    'mystic_summit', 
    {
        order = 23,
        config = {
            extra = {
                mult = 10,
                d_remaining = 0,
            },
        },
    }
)

-- 24 | Marble Joker
SMODS.Joker:take_ownership (
    'marble', 
    {
        order = 24,
        config = {
            extra = 1
        },
    }
) 

-- 25 | Loyalty Card
SMODS.Joker:take_ownership (
    'loyalty_card', 
    {
        order = 25,
        config = {
            extra = {
                Xmult = 4,
                every = 5,
                remaining = "5 remaining"
            },
        },
    }
)

-- 26 | 8 Ball
SMODS.Joker:take_ownership (
    '8_ball', 
    {
        order = 26,
        config = {
            extra = 3
        },
    }
)

-- 27 | Misprint
SMODS.Joker:take_ownership (
    'misprint', 
    {
        order = 27,
        config = {
            extra = {
                max = 23,
                min = 0
            }
        },
    }
)

-- 28 | Dusk
SMODS.Joker:take_ownership (
    'dusk', 
    {
        order = 28,
        config = {
            extra = 1
        },
    }
)

-- 29 | Raised Fist
SMODS.Joker:take_ownership (
    'raised_fist', 
    {
        order = 29,
        config = {},
    }
)

-- 30 | Chaos the Clown
SMODS.Joker:take_ownership (
    'chaos', 
    {
        order = 30,
        config = {
            extra = 2
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra
                }
            }
        end,

        -- shit crashes the game
        -- calculate = function(self, card, context)
        --     if G.GAME.current_round.free_rerolls == 0 then
        --         SMODS.destroy_cards(card, nil, nil, true)
        --         return {
        --             message = localize('k_eaten_ex')
        --         }
        --     end
        -- end,

        add_to_deck = function(self, card, from_debuff)
            SMODS.change_free_rerolls(card.ability.extra - 1)
        end,
        remove_from_deck = function(self, card, from_debuff)
            SMODS.change_free_rerolls(-card.ability.extra)
        end
    }
)

-- 31 | Fibonacci
SMODS.Joker:take_ownership (
    'fibonacci', 
    {
        order = 31,
        config = {
            extra = 8
        },
    }
)

-- 32 | Steel Joker
SMODS.Joker:take_ownership (
    'steel_joker', 
    {
        order = 32,
        config = {
            extra = 0.5
        },
    }
)

-- 33 | Scary Face
SMODS.Joker:take_ownership (
    'scary_face', 
    {
        order = 33,
        config = {
            extra = 30
        },
    }
)

-- 34 | Abstract
SMODS.Joker:take_ownership (
    'abstract', 
    {
        order = 34,
        config = {
            extra = 5
        },
    }
)

-- 35 | Delayed Gratification
SMODS.Joker:take_ownership (
    'delayed_grat', 
    {
        order = 35,
        config = {
            extra = 2
        },
    }
)

-- 36 | Hack
SMODS.Joker:take_ownership (
    'hack', 
    {
        order = 36,
        config = {
            extra = 1
        },
    }
)

-- 37 | Delayed Gratification
SMODS.Joker:take_ownership (
    'pareidolia', 
    {
        order = 37,
        config = {},
    }
)

-- 38 | Gros Michel
SMODS.Joker:take_ownership (
    'gros_michel', 
    {
        order = 38,
        config = {
            extra = {
                odds = 6,
                mult = 15
            }
        },
    }
)

-- 39 | Even Steven
SMODS.Joker:take_ownership ('even_steven', { order = 40, config = { extra = 4, }, })

-- 40 | Odd Todd
SMODS.Joker:take_ownership ('odd_todd', { order = 39, config = { extra = 31 }, })

-- 41 | Scholar
SMODS.Joker:take_ownership ('scholar', { order = 41, config = { extra = { mult = 4, chips = 20,}},})

-- 42 | Business Card
SMODS.Joker:take_ownership ('business', { order = 42, config = { extra = 1 },})

-- 43 | Supernova
SMODS.Joker:take_ownership ('supernova', { order = 43, config = { extra = 1 },})

-- 44 | Ride the Bus
SMODS.Joker:take_ownership ('ride_the_bus', { order = 44, config = { extra = 1 },})

-- 45 | Space Joker
SMODS.Joker:take_ownership ('space', { order = 45, config = { extra = 2 },})

-- 49 | Runner
SMODS.Joker:take_ownership ('runner', { order = 49, config = { extra = { chips = 0, chip_mod = 30,}},})

-- 50 | Ice Cream
SMODS.Joker:take_ownership ('ice_cream', { order = 50, config = { extra = { chips = 100, chip_mod = 5,}},})

-- 51 | DNA
SMODS.Joker:take_ownership ('dna', { order = 51, config = {},})

-- 52 | Splash
SMODS.Joker:take_ownership (
    'splash', 
    {
        order = 52,
        config = {},
    }
)

-- 53 | Blue Joker
SMODS.Joker:take_ownership (
    'blue_joker', 
    {
        order = 53,
        config = {
            extra = 2,
        },
    }
)

-- 54 | Sixth Sense
SMODS.Joker:take_ownership (
    'sixth_sense', 
    {
        order = 54,
        config = {},
    }
)

-- 55 | Constellation
SMODS.Joker:take_ownership (
    'constellation', 
    {
        order = 55,
        config = {
            extra = 0.2,
            Xmult = 1,
        },
    }
)

-- 56 | Hiker
SMODS.Joker:take_ownership (
    'constellation', 
    {
        order = 56,
        config = {
            extra = 10,
        },
    }
)

-- 57 | Faceless Joker
SMODS.Joker:take_ownership (
    'faceless', 
    {
        order = 57,
        config = {
            extra = {
                dollars = 10,
                faces = 4,
            }
        },
    }
)

-- 58 | Green Joker
SMODS.Joker:take_ownership (
    'green_joker',
    {
        order = 58,
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

-- 59 | Superposition
SMODS.Joker:take_ownership (
    'superposition',
    {
        order = 59,
        config = {},
    }
)

-- 60 | To Do List
SMODS.Joker:take_ownership (
    'todo_list',
    {
        order = 60,
        config = {
            extra = {
                dollars = 4,
                poker_hand = 'High Card',
            }
        },
    }
)

-- 61 | Cavendish
SMODS.Joker:take_ownership (
    'cavendish',
    {
        order = 61,
        config = {
            extra = {
                odds = 1000,
                Xmult = 3,
            }
        },
    }
)

-- 62 | Card Sharp
SMODS.Joker:take_ownership (
    'card_sharp',
    {
        order = 62,
        config = {
            extra = {
                Xmult = 3,
            }
        },
    }
)

-- 63 | Red Card
SMODS.Joker:take_ownership (
    'red_card', 
    {
        order = 63,
        config = {
            extra = 3,
        },
    }
)

-- 64 | Madness
-- THIS JOKER IS FUCKING CURSED BECAUSE ITS HARD CODED
SMODS.Joker:take_ownership (
    'madness', 
    {
        order = 64,
        config = {
            extra = 1
        },

        -- calculate = function(self, card, context)
        --     if not context.setting_blind then
        --         return
        --     end

        --     if context.blueprint then
        --         return
        --     end

        --     if not context.blind.boss then
        --         card.ability.x_mult = card.ability.x_mult + card.ability.extra
        --         return
        --     end

        --     if context.blind.boss then
        --         local destructable_jokers = {}
        --         for i = 1, #G.jokers.cards do
        --             if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and not G.jokers.cards[i].getting_sliced then
        --                 destructable_jokers[#destructable_jokers + 1] =
        --                     G.jokers.cards[i]
        --             end
        --         end
        --         local joker_to_destroy = pseudorandom_element(destructable_jokers, 'vremade_madness')

        --         if joker_to_destroy then
        --             joker_to_destroy.getting_sliced = true
        --             G.E_MANAGER:add_event(Event({
        --                 func = function()
        --                     (context.blueprint_card or card):juice_up(0.8, 0.8)
        --                     joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
        --                     return true
        --                 end
        --             }))
        --         end
        --         return { message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.x_mult } } }
        --     end

        --     if context.joker_main then
        --         return {
        --             xmult = card.ability.x_mult
        --         }
        --     end
        -- end,
    }
)

-- 65 | Square Joker
SMODS.Joker:take_ownership (
    'square', 
    {
        order = 65,
        config = {
            extra = {
                chips = 0,
                chip_mod = 8,
            },
        },
    }
)

-- -- 66 | Seance
SMODS.Joker:take_ownership (
    'seance', 
    {
        order = 66,
        cost = 5,
        config = {
            extra = {
                poker_hand = 'Four of a Kind',
            },
        },
    }
)

-- 67 | Riff-raff
SMODS.Joker:take_ownership (
    'riff_raff', 
    {
        order = 67,
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

-- 68 | Vampire
SMODS.Joker:take_ownership (
    'vampire', 
    {
        order = 68,
        config = {
            extra = 0.1,
            Xmult = 1,
        },
    }
)

-- 69 | Shortcut
SMODS.Joker:take_ownership ('shortcut', { order = 69, config = {},})

-- 70 | Hologram
SMODS.Joker:take_ownership ('hologram', { order = 70, config = {extra = 0.5, Xmult = 1},})

-- 71 | Vagabond
SMODS.Joker:take_ownership ('vagabond', { order = 71, config = {extra = 5},})

-- 72 | Baron
SMODS.Joker:take_ownership ('baron', { order = 72, config = {extra = 1.5},})

-- 73 | Cloud 9
SMODS.Joker:take_ownership ('cloud_9', { order = 73, config = {extra = 2},})

-- 74 | Rocket
SMODS.Joker:take_ownership ('rocket', { order = 74, config = {extra = { dollars = 1, increase = 2}},})

-- 75 | Obelisk
SMODS.Joker:take_ownership ('obelisk', { order = 75, config = { extra = 1, Xmult = 1,},})

-- 80 | Turtle Bean
SMODS.Joker:take_ownership ('turtle_bean', { order = 80, config = { extra = {h_size = 5, h_mod = 1}},})

-- 86 | Fortune Teller
SMODS.Joker:take_ownership ('fortune_teller', { order = 86, config = { extra = 2 },})

-- 87 | Juggler
SMODS.Joker:take_ownership ('juggler', { order = 87, config = { h_size = 2 },})

-- 88 | Drunkard
SMODS.Joker:take_ownership ('drunkard', { order = 88, config = { d_size = 2 },})

-- 103 | Castle
SMODS.Joker:take_ownership ('castle', { order = 103, config = { extra = { chips = 0, chip_mod = 5, },},})

-- 105 | Campfire
SMODS.Joker:take_ownership (
    'campfire', 
    {
        order = 105,
        config = {
            extra = 0.5
        },
        loc_vars = function(self, info_queue, card)
            return { 
                vars = {
                    card.ability.extra, card.ability.x_mult 
                }
            }
        end,

        calculate = function(self, card, context)
            if context.selling_card and not context.blueprint then
                card.ability.x_mult = card.ability.x_mult + card.ability.extra
                return {
                    message = localize('k_upgrade_ex')
                }
            end

            if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                -- if context.beat_boss and card.ability.extra.xmult > 1 then
                --     card.ability.extra.xmult = 1
                --     return {
                --         message = localize('k_reset'),
                --         colour = G.C.RED
                --     }
                -- end
            end
        end
    }
)

-- 116 | Rough Gem
SMODS.Joker:take_ownership (
    'rough_gem', 
    {
        order = 116,
        config = {
            extra = 3
        },
    }
)

-- 117 | Bloodstone
SMODS.Joker:take_ownership (
    'bloodstone', 
    {
        order = 117,
        config = {
            extra = {
                odds = 3,
                Xmult = 2,
            }
        },
    }
)

-- 118 | Arrowhead
SMODS.Joker:take_ownership (
    'arrowhead', 
    {
        order = 118,
        config = {
            extra = 100
        },
    }
)

-- 119 | Onyx Agate
SMODS.Joker:take_ownership (
    'onyx_agate', 
    {
        order = 119,
        config = {
            extra = 35
        },
    }
)

-- 120 | Glass Joker
SMODS.Joker:take_ownership (
    'glass', 
    {
        order = 120,
        config = {
            extra = 0.75,
            Xmult = 1,
        },
    }
)

-- 121 | Showman
SMODS.Joker:take_ownership ('ring_master', { order = 121, config = {}, })

-- 122 | Flowerpot
SMODS.Joker:take_ownership (
    'flower_pot', 
    {
        order = 122,
        config = {
            extra = 12
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra
                }
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                local suits = {
                    ['Hearts'] = 0,
                    ['Diamonds'] = 0,
                    ['Spades'] = 0,
                    ['Clubs'] = 0
                }
                for i = 1, #context.scoring_hand do
                    if context.poker_hand['Four of a Kind'] then
                        if not SMODS.has_any_suit(context.scoring_hand[i]) then
                            if context.scoring_hand[i]:is_suit('Hearts', true) and suits["Hearts"] == 0 then
                                suits["Hearts"] = suits["Hearts"] + 1
                            elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0 then
                                suits["Diamonds"] = suits["Diamonds"] + 1
                            elseif context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0 then
                                suits["Spades"] = suits["Spades"] + 1
                            elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0 then
                                suits["Clubs"] = suits["Clubs"] + 1
                            end
                        end
                    end
                end
                for i = 1, #context.scoring_hand do
                    if context.poker_hand['Four of a Kind'] then
                        if SMODS.has_any_suit(context.scoring_hand[i]) then
                            if context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then
                                suits["Hearts"] = suits["Hearts"] + 1
                            elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0 then
                                suits["Diamonds"] = suits["Diamonds"] + 1
                            elseif context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0 then
                                suits["Spades"] = suits["Spades"] + 1
                            elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0 then
                                suits["Clubs"] = suits["Clubs"] + 1
                            end
                        end
                    end
                end

                if suits["Hearts"] > 0 and
                    suits["Diamonds"] > 0 and
                    suits["Spades"] > 0 and
                    suits["Clubs"] > 0 then
                    return {
                        xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    }
)

-- 137 | Invisible Joker
SMODS.Joker:take_ownership ( 'invisible', { order = 137, config = { extra = 3 }, })

-- 139 | Satellite
SMODS.Joker:take_ownership (
    'satellite', 
    {
        order = 139,
        config = {
            extra = 3
        },
    }
)

-- 140 | Shoot the Moon
SMODS.Joker:take_ownership (
    'shoot_the_moon', 
    {
        order = 140,
        config = {
            extra = 1.25
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra
                }
            }
        end,

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 12 then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    return {
                        x_mult = card.ability.extra
                    }
                end
            end
        end,
    }
)

-- 143 | Astronomer
SMODS.Joker:take_ownership ('astronomer', { order = 143, cost = 4, config = {}, } )

-- 145 | Bootstraps
SMODS.Joker:take_ownership ('bootstraps', { order = 145, config = { extra = { mult = 5, dollars = 5, },},})

-- 147 | Yorick
SMODS.Joker:take_ownership ('yorick', { order = 147, config = { extra = { xmult = 0.5, discards = 10, },},})

-- 150 | Perkeo
SMODS.Joker:take_ownership ('perkeo', { order = 150, config = {},})