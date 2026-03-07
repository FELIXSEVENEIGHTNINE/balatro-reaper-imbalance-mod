return {
    descriptions = {
        Spectral = {
            c_ouija = {
                text = {
                    "Converts all cards",
                    "in hand to a single",
                    "random {C:attention}rank",
                },
            },

            c_grim = {
                text = {
                    "Destroy {C:attention}#1#{} random",
                    "card in your hand,",
                    "add {C:attention}#2#{} random {C:attention}Enhanced",
                    "{C:attention}Aces{} to your hand",
                }
            },

            c_incantation = {
                text = {
                    "Destroy {C:attention}#1#{} random",
                    "card in your hand, add {C:attention}#2#",
                    "random {C:attention}Enhanced numbered",
                    "{C:attention}cards{} to your hand",
                }
            },

            c_hex = {
                text = {
                    "Add {C:dark_edition}Polychrome{} to a",
                    "random {C:attention}Joker{},",
                    "{C:red}-1{} discard",
                }
            },
        },

        Joker = {
            j_stencil = {
                text = {
                    "{X:red,C:white}X2{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Joker Stencil included",
                    "{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive})",
                }
            },

            j_bloodstone = {
                text = {
                    "Played cards with",
                    "{C:hearts}Heart{} suit give",
                    "{X:mult,C:white} X#3# {} Mult when scored",
                }
            },

            j_marble = {
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "adds a {C:attention}Stone{}",
                    "card with a random",
                    "{C:attention}seal{} to your deck",
                },
            },

            j_business = {
                text = {
                    "Played {C:attention}face{} cards",
                    "give {C:money}$2{} when scored",
                }
            },

            j_green_joker = {
                text = {
                    "{C:mult}+#1#{} Mult per hand played",
                    "{C:attention}Resets{} when using a discard",
                    "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
                }
            },

            j_campfire = {
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for each card {C:attention}sold{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                }
            },

            j_shoot_the_moon = {
                text = {
                    "Each {C:attention}Queen{}",
                    "held in hand",
                    "gives {C:red}+#1#{} Mult",
                }
            },

            -- j_flower_pot = {
            --     text = {
            --         "{X:mult,C:white} X#1# {} Mult if poker hand",
            --         "is a {C:attention}Four of a Kind{}",
            --         "and contains a",
            --         "{C:diamonds}Diamond{} card, {C:clubs}Club{} card,",
            --         "{C:hearts}Heart{} card, and {C:spades}Spade{} card",
            --     }
            -- },
            j_flower_pot = {
                text = {
                    "Gains {C:red}+#1#{} Mult if poker hand",
                    "contains a {C:attention}Four of a Kind{}",
                    -- " ",
                    -- "Gains {C:blue}+#3#{} Chips if hand",
                    -- "contains a {C:diamonds}Diamond{} card,",
                    -- "{C:clubs}Club{} card, {C:hearts}Heart{} card, and {C:spades}Spade{} card",   
                    -- "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult and {C:blue}+#4#{C:inactive} Chips)",  
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                }
            },

            j_shortcut = {
                text = {
                    "Played {C:attention}Straight{} hands",
                    "give {C:blue}+#1#{} Chips,",
                    "{C:red}+#2#{} Mult, and",
                    "earn {C:money}$#3#{} ",
                }
            },

            j_loyalty_card = {
                text = {
                    "{C:red}+#1#{} Mult every",
                    "{C:attention}#2#{} hands played",
                    "{C:inactive}(#3# remaining)",
                    "{C:inactive}(Currently {C:red}+#4#{C:inactive} Mult)",
                }
            },

            j_ceremonial = {
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "and permanently add its",
                    "its sell value as {X:red,C:white}Mult{}",
                    "{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive}/#2# Mult)",
                },
            },

            -- j_madness = {
            --     text = {
            --         "When {C:attention}Small Blind{} or {C:attention}Big Blind{}",
            --         "is selected, gain {X:mult,C:white} X#1# {} Mult.",
            --         "When {C:attention}Boss Blind{} is selected,",
            --         "{C:attention}destroy{} a random Joker",
            --         "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
            --     }
            -- },

            j_invisible = {
                text={
                    "After {C:attention}#1#{} rounds,",
                    "sell this card to",
                    "{C:attention}Duplicate{} a random Joker",
                    "with a {C:dark_edition}Negative{} edition",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)",
                },
            },

            j_seance = {
                text = {
                    -- "If {C:attention}poker hand{} is a",
                    -- "{C:attention}#1#{}, create a",
                    -- "random {C:spectral}Spectral{} card,",
                    -- "and gain {X:red,C:white}X#2#{} Mult",
                    -- "{C:inactive}(Must have room)",
                    -- "{C:inactive}(Currently {X:red,C:white}X#3#{C:inactive} Mult)",

                    "If {C:attention}poker hand{} is a",
                    "{C:attention}#1#{}, gain",
                    "{X:red,C:white}X#2#{} Mult",
                    "{C:inactive}(Currently {X:red,C:white}X#3#{C:inactive} Mult)",
                },
            },

            -- j_blueprint = {
            --     text = {
            --         "Copies ability of",
            --         "{C:attention}Joker{} to the right",
            --         "for {C:attention}#1#{} rounds",
            --         "{C:inactive}(Currently {C:attention}#3#{C:inactive}/#1#)",
            --     }
            -- },

            j_smeared = {
                text = {
                    "Retrigger all",
                    "played {C:attention}Wild{} cards",
                },
            }

        },

        Voucher = {
            -- v_hieroglyph = {
            --     text = {
            --         "{C:attention}-#1#{} Ante,",
            --         "{C:red}-#1#{} discard",
            --         "each round",
            --     }
            -- },

            -- v_petroglyph = {
            --     text = {
            --         "{C:attention}-#1#{} Ante,",
            --         "{C:blue}-#1#{} hand",
            --         "each round",
            --     }
            -- },

            v_ri_magic_trick_2 = {
                name = "Magic Trick",
                text = {
                    "{C:attention}+1{} Booster slot",
                }
            },

            v_ri_illusion_2 = {
                name = "Illusion",
                text = {
                    "{C:attention}+1{} Voucher slot",
                }
            },
        }
    }
}