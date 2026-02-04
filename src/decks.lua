SMODS.Back:take_ownership (
    'green',
    {
        config = { 
            extra_hand_bonus = 2, 
            extra_discard_bonus = 3, 
            no_interest = true 
        },
        loc_vars = function(self, info_queue, back)
            return { vars = { self.config.extra_hand_bonus, self.config.extra_discard_bonus } }
        end,
        locked_loc_vars = function(self, info_queue, back)
            return { vars = { 75 } }
        end,
        check_for_unlock = function(self, args)
            return args.type == 'discover_amount' and args.amount >= 75
        end
    }
)