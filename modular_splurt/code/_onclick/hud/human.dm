/datum/hud/human/New(mob/living/carbon/human/owner)
	. = ..()
	var/atom/movable/screen/using

	using = new/atom/movable/screen/navigate(null, src)
	using.icon = ui_style_splurt(ui_style)
	static_inventory += using

	if(owner.client?.prefs.arousable)
		using = new /atom/movable/screen/arousal(null, owner)
		infodisplay += using
