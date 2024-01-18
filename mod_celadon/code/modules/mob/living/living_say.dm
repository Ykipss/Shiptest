/mob/living/Hear(message, atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, list/message_mods = list())
	SEND_SIGNAL(src, COMSIG_MOVABLE_HEAR, args)
	if(!client)
		return

	var/deaf_message
	var/deaf_type
	if(speaker != src)
		if(!radio_freq) //These checks have to be seperate, else people talking on the radio will make "You can't hear yourself!" appear when hearing people over the radio while deaf.
			deaf_message = "<span class='name'>[speaker]</span> [speaker.verb_say] something but you cannot hear [speaker.p_them()]."
			deaf_type = 1
	else
		deaf_message = "<span class='notice'>You can't hear yourself!</span>"
		deaf_type = 2 // Since you should be able to hear yourself without looking

	// Create map text prior to modifying message for goonchat
	if (client?.prefs.chat_on_map && !(stat == UNCONSCIOUS || stat == HARD_CRIT) && (client.prefs.see_chat_non_mob || ismob(speaker)) && can_hear())
		if(message_mods[MODE_CUSTOM_SAY_ERASE_INPUT])
			create_chat_message(speaker, null, message_mods[MODE_CUSTOM_SAY_EMOTE], spans, EMOTE_MESSAGE)
		else
			create_chat_message(speaker, message_language, raw_message, spans)

	///
	///Celadon-change - проверка на MODE_MSG_COMPOSED, если true - отправляет "сырое" сообщение в show_message()
	///
	if(!message_mods[MODE_MSG_COMPOSED])
		// Recompose message for AI hrefs, language incomprehension.
		message = compose_message(speaker, message_language, raw_message, radio_freq, spans, message_mods)


	show_message(message, MSG_AUDIBLE, deaf_message, deaf_type)
	return message
