// Verb to toggle restart notifications
/*
/client/verb/notify_restart()
	set category = "OOC"
	set name = "Notify Restart"
	set desc = "Notifies you on Discord when the server restarts."

	// Safety checks
	if(!CONFIG_GET(flag/sql_enabled))
		to_chat(src, span_warning("This feature requires the SQL backend to be running."))
		return

	if(!SSdiscord) // SS is still starting
		to_chat(src, span_notice("The server is still starting up. Please wait before attempting to link your account "))
		return

	if(!SSdiscord.enabled)
		to_chat(src, span_warning("This feature requires the server is running on the TGS toolkit"))
		return

	var/stored_id = SSdiscord.lookup_id(usr.ckey)
	if(!stored_id) // Account is not linked
		to_chat(src, span_warning("This requires you to have your Discord account linked to your Ckey."))
		return

	else // Linked
		var/mention_index = SSdiscord.notify_members.Find("<@[stored_id]>")
		if(mention_index) // If they are in the list, take them out
			SSdiscord.notify_members -= SSdiscord.notify_members[mention_index] // The list uses strings because BYOND cannot handle a 17 digit integer
			to_chat(src, span_notice("You will no longer be notified when the server restarts"))
			return // This is necassary so it doesnt get added again, as it relies on the for loop being unsuccessful to tell us if they are in the list or not

		// If we got here, they arent in the list. Chuck 'em in!
		to_chat(src, span_notice("You will now be notified when the server restarts"))
		SSdiscord.notify_members += "<@[stored_id]>" // The list uses strings because BYOND cannot handle a 17 digit integer

*/
