
-- 20 | Credit Card
SMODS.Joker:take_ownership (
    'credit_card', 
    {
        blueprint_compat = true,
        rarity = 1,
        cost = 1,
        pos = {x=5, y=1},
        config = {
            extra = {
                bankrupt_at = 50,
            },
        },
        loc_vars = function(self, info_queue, card)
            return { 
                vars = {
                    card.ability.extra.bankrupt_at
                }
            }
        end,

        add_to_deck = function(self, card, from_debuff)
            G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
        end,

        remove_from_deck = function(self, card, from_debuff)
            G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
        end,
    }
)


-- 23 | Mystic Summit
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
        end,
    }
)

-- Riff-raff
SMODS.Joker:take_ownership (
    'riff_raff', 
    {
        blueprint_compat = false,
        perishable_compat = true,
        rarity = 1,
        cost = 6,
        pos = {x=1, y=12},
        config = {
            extra = {
                creates = 3,
            },
        },

        loc_vars = function(self, info_queue, card)
            return { 
                vars = {
                    card.ability.extra.creates
                }
            }
        end,

        calculate = function(self, card, context)
            if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                local jokers_to_create = math.min(card.ability.extra.creates, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _ = 1, jokers_to_create do
                            SMODS.add_card {
                                set = 'Joker',
                                rarity = 'Common',
                                key_append = 'vremade_riff_raff'
                            }
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
        end,
    }
)

-- Castle
SMODS.Joker:take_ownership (
    'castle', 
    {
        blueprint_compat = true,
        perishable_compat = false,
        rarity = 2,
        cost = 6,
        pos = {x=9, y=15},
        config = {
            extra = {
                chips = 0,
                chip_mod = 5,
            },
        },
        loc_vars = function(self, info_queue, card)
            local suit = (G.GAME.current_round.vremade_castle_card or {}).suit or 'Spades'
            return { 
                vars = {
                    card.ability.extra.chip_mod,
                    localize(suit, 'suits_singular'),
                    card.ability.extra.chips,
                    colours = {G.C.SUITS[suit]}
                }
            }
        end,

        calculate = function(self, card, context)
            if context.discard and not context.blueplrint and not context.other_card.debuff and context.other_card:is_suit(G.GAME.current_round.vremade_castle_card.suit) then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            end

            if context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end,
    }
)