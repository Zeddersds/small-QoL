/mob/living/carbon/is_muzzled()
	return ..() || istype(wear_mask, /obj/item/clothing/mask/gas/sechailer/slut)

/mob/living/carbon/cuff_resist(obj/item/I, breakouttime = 600, cuff_break = 0)
	if(istype(I, /obj/item/restraints/bondage_rope)) {
		var/obj/item/restraints/bondage_rope/rope = I
		cuff_break = rope.prepare_resist(src)
		if(cuff_break == -1)
			to_chat(src, "<span class='danger'>You are not able to reach the rope.</span>")
			return
	}
	..()

/mob/living/carbon/clear_cuffs(obj/item/I, cuff_break)
	if(istype(I, /obj/item/restraints/bondage_rope)) {
		var/obj/item/restraints/bondage_rope/rope = I
		if(rope.rope_strength > 1)
			visible_message("<span class='danger'>[src] manages to loosen up their rope!</span>")
			to_chat(src, "<span class='notice'>You successfully loosen up your rope.</span>")
			rope.rope_strength--

			// TODO: this will return the same color btw, maybe make a stack of what color the ropes are
			var/obj/item/restraints/bondage_rope/new_rope = new rope.type()
			new_rope.forceMove(rope.roped_mob.loc)
			return
	}
	..()
