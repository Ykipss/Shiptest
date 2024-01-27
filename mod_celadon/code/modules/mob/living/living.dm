/// Special key down handling of /living mobs, currently only used for typing indicator
///Celadon-change - new param in set_typing_indicator, which helps with say/me bubble
/mob/living/key_down(_key, client/user)
	if(!typing_indicator && stat == CONSCIOUS)
		for(var/kb_name in user.prefs.key_bindings[_key])
			switch(kb_name)
				if("Say")
					set_typing_indicator(TRUE, isSay = TRUE)
					break
				if("Me")
					set_typing_indicator(TRUE, isMe = TRUE)
					break
	return ..()

/// Used for setting typing indicator on/off. Checking the state should be done not on the proc to avoid overhead.
///Celadon-change - new para, which helps with say/me bubble
/mob/living/set_typing_indicator(state, isMe = null, isSay = null)
	typing_indicator = state
	var/state_of_bubble
	if(isMe)
		state_of_bubble = "emotetyping"
	if(isSay)
		state_of_bubble = bubble_icon? "[bubble_icon]0" : "default0"
	if(!state_of_bubble)
		state_of_bubble = last_state_of_bubble
	else
		last_state_of_bubble = state_of_bubble
	var/mutable_appearance/bubble_overlay = mutable_appearance('mod_celadon/icons/mob/talk.dmi', state_of_bubble, plane = RUNECHAT_PLANE)
	bubble_overlay.appearance_flags = RESET_COLOR | RESET_TRANSFORM | TILE_BOUND | PIXEL_SCALE
	if(typing_indicator)
		add_overlay(bubble_overlay)
	else
		cut_overlay(bubble_overlay)
