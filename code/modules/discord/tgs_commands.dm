// Notify
/datum/tgs_chat_command/notify
	name = "notify"
	help_text = "Pings the invoker when the round ends"

/datum/tgs_chat_command/notify/Run(datum/tgs_chat_user/sender, params)
	if(!CONFIG_GET(string/chat_announce_new_game))
		return new /datum/tgs_message_content("Оповещение о начале нового раунда отключены.")

	if(sender.mention in SSdiscord.notify_members) // If they are in the list, take them out
		SSdiscord.notify_members -= sender.mention
		return new /datum/tgs_message_content("Вы будете оповещены, когда раунд закончится.")

	// If we got here, they arent in the list. Chuck 'em in!
	SSdiscord.notify_members += sender.mention
	return new /datum/tgs_message_content("Вы будете оповещены, когда сервер будет перезагружен.")
