SMODS.Joker:take_ownership (
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

SMODS.Joker:take_ownership (
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