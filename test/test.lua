-- Yellow Deck
SMODS.Back {
    key = "yellow",
    pos = { x = 1, y = 2 },
    config = { dollars = 500000 },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.dollars } }
    end,
    -- The config field already handles the functionality so it doesn't need to be implemented
    -- The following is how the implementation would be
    --[[
    apply = function(self, back)
        G.GAME.starting_params.dollars = G.GAME.starting_params.dollars + self.config.dollars
    end,
    ]]
    locked_loc_vars = function(self, info_queue, back)
        return { vars = { 50 } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'discover_amount' and args.amount >= 50
    end
}