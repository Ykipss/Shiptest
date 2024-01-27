/datum/signal/subspace/vocal/New(
	obj/source,  // the originating radio
	frequency,  // the frequency the signal is taking place on
	atom/movable/virtualspeaker/speaker,  // representation of the method's speaker
	datum/language/language,  // the language of the message
	message,  // the text content of the message
	spans,  // the list of spans applied to the message
	list/message_mods // the list of modification applied to the message. Whispering, singing, ect
)
	src.source = source
	src.frequency = frequency
	src.language = language
	virt = speaker
	var/datum/language/lang_instance = GLOB.language_datum_instances[language]
	data = list(
		"name" = speaker.name,
		"job" = speaker.job,
		"message" = message,
		"compression" = rand(35, 65),
		"language" = lang_instance.name,
		"spans" = spans,
		"mods" = message_mods
	)
	var/turf/T = get_turf(source)
	var/datum/map_zone/mapzone = T.get_map_zone()
	map_zones = list(mapzone)


/datum/signal/subspace/vocal/broadcast()
	set waitfor = FALSE

	// Perform final composition steps on the message.
	var/message = copytext_char(data["message"], 1, MAX_BROADCAST_LEN)
	if(!message)
		return
	var/compression = data["compression"]
	if(compression > 0)
		message = Gibberish(message, compression >= 30)

	// Assemble the list of radios
	var/list/radios = list()
	switch (transmission_method)
		if (TRANSMISSION_SUBSPACE)
			// Reaches any radios on the virtual levels
			for(var/obj/item/radio/R in GLOB.all_radios["[frequency]"])
				if(R.can_receive(frequency, map_zones))
					radios += R

			// Syndicate radios can hear all well-known radio channels
			if (num2text(frequency) in GLOB.reverseradiochannels)
				for(var/obj/item/radio/R in GLOB.all_radios["[FREQ_SYNDICATE]"])
					if(R.can_receive(FREQ_SYNDICATE, map_zones))
						radios |= R

		if (TRANSMISSION_RADIO)
			// Only radios not currently in subspace mode
			for(var/obj/item/radio/R in GLOB.all_radios["[frequency]"])
				if(!R.subspace_transmission && R.can_receive(frequency, map_zones))
					radios += R

		if (TRANSMISSION_SUPERSPACE)
			// Only radios which are independent
			for(var/obj/item/radio/R in GLOB.all_radios["[frequency]"])
				if(R.independent && R.can_receive(frequency, map_zones))
					radios += R

	//WS edit begin - Radio chatter #434
	// Next, we'll have each radio play a small sound effect except for the one that broadcasted it.
	for(var/obj/item/radio/radio in radios)
		if(radio.last_chatter_time + 1 SECONDS < world.time && source != radio)
			playsound(radio, "sound/effects/radio_chatter.ogg", 20, FALSE)
			radio.last_chatter_time = world.time
		if(radio.log)
			var/name = data["name"]
			var/list/log_details = list()
			log_details["name"] = "[name]▸"
			log_details["message"] = "\"[html_decode(message)]\""
			log_details["time"] = station_time_timestamp()
			radio.loglist.Insert(1, list(log_details))
			radio.log_trim()

	// From the list of radios, find all mobs who can hear those.
	var/list/receive = get_mobs_in_radio_ranges(radios)

	// Cut out mobs with clients who are admins and have radio chatter disabled.
	for(var/mob/R in receive)
		if (R.client && R.client.holder && !(R.client.prefs.chat_toggles & CHAT_RADIO))
			receive -= R

	// Add observers who have ghost radio enabled.
	for(var/mob/dead/observer/M in GLOB.player_list)
		if(M.client.prefs.chat_toggles & CHAT_GHOSTRADIO)
			receive |= M

	// Render the message and have everybody hear it.
	// Always call this on the virtualspeaker to avoid issues.
	var/spans = data["spans"]
	var/list/message_mods = data["mods"]
	var/rendered

	///
	///Celadon-change - проверка на TRANSMISSION_SUBSPACE, если true, compose_message будет работать с "Job"
	///
	if(transmission_method == TRANSMISSION_SUBSPACE)
		rendered = virt.compose_message(virt, language, message, frequency, spans, needJob = TRUE)
	else
		rendered = virt.compose_message(virt, language, message, frequency, spans)
	message_mods[MODE_MSG_COMPOSED] = TRUE

	for(var/atom/movable/hearer in receive)
		hearer.Hear(rendered, virt, language, message, frequency, spans, message_mods)
