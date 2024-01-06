//The code execution of the emote datum is located at code/datums/emotes.dm
/mob/proc/emote(act, m_type = null, message = null, intentional = FALSE)
	act = lowertext(act)
	var/param = message
	var/custom_param = findchar(act, " ")
	if(custom_param)
		param = copytext(act, custom_param + length(act[custom_param]))
		act = copytext(act, 1, custom_param)

	var/list/key_emotes = GLOB.emote_list[act]

	if(!length(key_emotes))
		if(intentional)
			to_chat(src, "<span class='notice'>'[act]' emote does not exist. Say *help for a list.</span>")
		return FALSE
	var/silenced = FALSE
	for(var/datum/emote/P in key_emotes)
		if(!P.check_cooldown(src, intentional))
			silenced = TRUE
			continue
		if(P.run_emote(src, param, m_type, intentional))
			SEND_SIGNAL(src, COMSIG_MOB_EMOTE, P, act, m_type, message, intentional)
			return TRUE
	if(intentional && !silenced)
		to_chat(src, "<span class='notice'>Unusable emote '[act]'. Say *help for a list.</span>")
	return FALSE

/datum/emote/flip
	key = "flip"
	key_third_person = "flips"
	message = "делает кувырок!"
	hands_use_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer)

/datum/emote/flip/run_emote(mob/user, params , type_override, intentional)
	. = ..()
	if(.)
		user.SpinAnimation(7,1)

/datum/emote/flip/check_cooldown(mob/user, intentional)
	. = ..()
	if(.)
		return
	if(!can_run_emote(user, intentional=intentional))
		return
	if(isliving(user))
		var/mob/living/flippy_mcgee = user
		if(prob(20))
			flippy_mcgee.Knockdown(1 SECONDS)
			flippy_mcgee.visible_message(
				"<span class='notice'>[flippy_mcgee] пытается сделать сальто и падает. Какая неудача!</span>",
				"<span class='notice'>Вы пытаетесь сделать сальто, однако теряете своё равновесие и падаете!</span>"
			)
			if(prob(50))
				flippy_mcgee.adjustBruteLoss(1)
		else
			flippy_mcgee.visible_message(
				"<span class='notice'>[flippy_mcgee] немного спотыкается после такого сальто.</span>",
				"<span class='notice'>Вы немного спотыкаетесь из-за того, что теряете равновесие после последнего переворота..</span>"
			)

/datum/emote/spin
	key = "spin"
	key_third_person = "spins"
	hands_use_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer)

/datum/emote/spin/run_emote(mob/user, params ,  type_override, intentional)
	. = ..()
	if(!.)
		return
	if(HAS_TRAIT(user, ORBITED_TRAIT))
		user.spin(40, 2)
	else
		user.spin(20, 1)

		if((iscyborg(user) || isanimal(user)) && user.has_buckled_mobs())
			var/mob/living/L = user
			var/datum/component/riding/riding_datum = L.GetComponent(/datum/component/riding)
			if(riding_datum)
				if(L.a_intent == INTENT_HELP)
					for(var/mob/M in L.buckled_mobs)
						riding_datum.force_dismount(M, TRUE)
				else
					for(var/mob/M in L.buckled_mobs)
						riding_datum.force_dismount(M)
			else
				L.unbuckle_all_mobs()

/datum/emote/speen
	key = "speen"
	key_third_person = "speeeens"
	hands_use_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer)

/datum/emote/speen/run_emote(mob/user, params,  type_override, intentional)
	. = ..()
	if(.)
		user.spin(20, 1)
		if(isobserver(user) && prob(90)) //Speening in their grave
			user.playsound_local(get_turf(user), 'sound/voice/speen.ogg', 50, TRUE)
			return
		playsound(user, 'sound/voice/speen.ogg', 50, 1, -1)
		if((iscyborg(user) || isanimal(user)) && user.has_buckled_mobs())
			var/mob/living/L = user
			var/datum/component/riding/riding_datum = L.GetComponent(/datum/component/riding)
			if(riding_datum)
				if(L.a_intent == INTENT_HELP)
					for(var/mob/M in L.buckled_mobs)
						riding_datum.force_dismount(M, TRUE)
				else
					for(var/mob/M in L.buckled_mobs)
						riding_datum.force_dismount(M)
			else
				L.unbuckle_all_mobs()
