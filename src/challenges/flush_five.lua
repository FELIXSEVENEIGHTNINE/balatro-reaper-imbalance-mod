SMODS.Challenge {
    key = "ri_ch_2",
    loc_txt = {
        name = "Flush Five",
    },
    rules = {
        custom = {
            { id = 'no_reward_specific', value = 'Small' },
            { id = 'no_reward_specific', value = 'Big' },
            { id = 'all_eternal' },
        },
    },
    jokers = {
        { id = 'j_duo', eternal = true, pinned = true},
        { id = 'j_tribe', eternal = true, pinned = true},
        { id = 'j_trio', eternal = true, pinned = true},
        { id = 'j_family', eternal = true, pinned = true},
    },
    deck = {
        type = 'Challenge Deck',
    },
    vouchers = {
        { id = 'v_planet_merchant' },
        { id = 'v_planet_tycoon' },
        { id = 'v_magic_trick' },
        { id = 'v_illusion' },
    },
    restrictions = {
        banned_other = {
            { id = 'bl_final_heart', type = 'blind' },
            { id = 'bl_final_leaf',  type = 'blind' },
            { id = 'bl_final_acorn', type = 'blind' },
        },
    }
}