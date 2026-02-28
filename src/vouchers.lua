SMODS.Voucher:take_ownership(
    'hieroglyph', 
    {
        config = {
            extra = 1
        },
        redeem = function(self, card)
            ease_ante(-card.ability.extra)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra
            
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra
            ease_discard(-card.ability.extra)
        end
    }
)

SMODS.Voucher:take_ownership(
    'petroglyph', 
    {
        config = {
            extra = 1
        },
        redeem = function(self, card)
            ease_ante(-card.ability.extra)
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra
            
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra
            ease_hands_played(-card.ability.extra)
        end
    }
)



SMODS.Voucher:take_ownership('magic_trick', {no_collection = true, in_pool = function() return false end})
SMODS.Voucher:take_ownership('illusion', {no_collection = true, in_pool = function() return false end})

SMODS.Voucher {
    key = 'magic_trick_2',
    order = 25,
    cost = 10,
    set = "Voucher",
    pos = { x = 4, y = 2 },
    redeem = function(self, card)
        SMODS.change_booster_limit(1)
    end
}

SMODS.Voucher {
    key = 'illusion_2',
    order = 26,
    cost = 10,
    set = "Voucher",
    pos = { x = 4, y = 3 },
    requires = { 'v_ri_magic_trick_2' },

    redeem = function(self, card)
        SMODS.change_voucher_limit(1)
    end,

    locked_loc_vars = function(self, info_queue, card)
        return { vars = { 20, G.PROFILES[G.SETTINGS.profile].career_stats.c_playing_cards_bought } }
    end,

    check_for_unlock = function(self, args)
        return args.type == 'c_playing_cards_bought' and G.PROFILES[G.SETTINGS.profile].career_stats.c_playing_cards_bought >= 20
    end
}