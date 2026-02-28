-- Yellow Deck
SMODS.Back {
    key = "yellow",
    pos = { x = 1, y = 2 },
    config = { dollars = 500000 },
    unlocked = false,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.dollars } }
    end,
}