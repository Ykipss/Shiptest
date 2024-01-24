/atom/movable/proc/compose_message(atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, list/message_mods = list(), face_name = FALSE, needJob = FALSE)
	//This proc uses text() because it is faster than appending strings. Thanks BYOND.
	//Basic span
	var/spanpart1 = "<span [get_radio_span(radio_freq)]>"
	//Start name span.
	var/spanpart2 = "<span class='name'>"
	//Radio freq/name display
	var/freqpart = radio_freq ? "\[[get_radio_name(radio_freq)]\] " : ""
	//Speaker name
	var/namepart = "[speaker.GetVoice()][speaker.get_alt_name()]"
	if(face_name && ishuman(speaker))
		var/mob/living/carbon/human/H = speaker
		namepart = "[H.get_face_name()]" //So "fake" speaking like in hallucinations does not give the speaker away if disguised
	//End name span.
	var/endspanpart = "</span>"

	//Message
	var/messagepart
	var/languageicon = ""
	if (message_mods[MODE_CUSTOM_SAY_ERASE_INPUT])
		messagepart = message_mods[MODE_CUSTOM_SAY_EMOTE]
	else
		messagepart = lang_treat(speaker, message_language, raw_message, spans, message_mods)

		var/datum/language/D = GLOB.language_datum_instances[message_language]
		if(istype(D) && D.display_icon(src))
			languageicon = "[D.get_icon()] "

	messagepart = " <span class='message'>[say_emphasis(messagepart)]</span></span>"

	///
	///Celadon-change - проверка на needJob, если true - возвращает значение с данными "job"
	///
	if(needJob)
		return "[spanpart1][spanpart2][freqpart][languageicon][compose_track_href(speaker, namepart)][namepart][compose_job(speaker, message_language, raw_message, radio_freq)][endspanpart][messagepart]"
	return "[spanpart1][spanpart2][freqpart][languageicon][compose_track_href(speaker, namepart)][namepart][endspanpart][messagepart]"


/atom/movable/virtualspeaker
	var/job

/atom/movable/virtualspeaker/Initialize(mapload, atom/movable/M, radio)
	. = ..()
	radio = radio
	source = M
	if (istype(M))
		name = M.GetVoice()
		verb_say = M.verb_say
		verb_ask = M.verb_ask
		verb_exclaim = M.verb_exclaim
		verb_yell = M.verb_yell

	// The mob's job identity
	if(ishuman(M))
		// Humans use their job as seen on the crew manifest if they don't have an ID with a job assigned. This is so the AI
		// and other crewmembers can know their job even if they don't carry an ID or aren't assigned to anything.
		var/datum/data/record/findjob = find_record("name", name, GLOB.data_core.general)
		var/mob/living/carbon/human/H = M
		if(H.get_assignment(FALSE, FALSE))
			job = H.get_assignment()
		else if(findjob)
			job = findjob.fields["rank"]
		else
			job = "Unknown"
	else if(iscarbon(M))  // Carbon nonhuman
		job = "No ID"
	else if(isAI(M))  // AI
		job = "AI"
	else if(iscyborg(M))  // Cyborg
		var/mob/living/silicon/robot/B = M
		job = "[B.designation] Cyborg"
	else if(istype(M, /mob/living/silicon/pai))  // Personal AI (pAI)
		job = "Personal AI"
	else if(isobj(M))  // Cold, emotionless machines
		job = "Machine"
	else  // Unidentifiable mob
		job = "Unknown"

/atom/movable/virtualspeaker/GetJob()
	return job
