#define SINGULAR_SHOT 1
#define MAGIC_BOX 2
#define PANDORA_TELEPORT 3
#define AOE_SQUARES 4

/**
 * # Pandora
 *
 * A box with a similar design to the Hierophant which trades large, single attacks for more frequent smaller ones.
 * As it's health gets lower, the time between it's attacks decrease.
 * It's attacks are as follows:
 * - Fires hierophant blasts in a straight line.  Can only fire in a straight line in 8 directions, being the diagonals and cardinals.
 * - Creates a box of hierophant blasts around the target.  If they try to run away to avoid it, they'll very likely get hit.
 * - Teleports the pandora from one location to another, almost identical to Hierophant.
 * - Spawns a 5x5 AOE at the location of choice, spreading out from the center.
 * Pandora's fight mirrors Hierophant's closely, but has stark differences in attack effects.  Instead of long-winded dodge times and long cooldowns, Pandora constantly attacks the opponent, but leaves itself open for attack.
 */

/mob/living/simple_animal/hostile/asteroid/elite/pandora
	name = "pandora"
	desc = "A large magic box with similar power and design to the Hierophant. Once it opens, it's not easy to close it."
	icon_state = "pandora"
	icon_living = "pandora"
	icon_aggro = "pandora"
	icon_dead = "pandora_dead"
	icon_gib = "syndicate_gib"
	health_doll_icon = "pandora"
	faction = list("elitefauna", "pandora")
	armor = list("melee" = 20, "bullet" = 30, "laser" = 20, "energy" = 30, "bomb" = 50, "bio" = 40, "rad" = 20, "fire" = 20, "acid" = 20)
	melee_damage_lower = 0
	melee_damage_upper = 0
	attack_verb_continuous = "smashes into the side of"
	attack_verb_simple = "smash into the side of"
	friendly_verb_continuous = "wails at"
	friendly_verb_simple = "wails at"
	attack_sound = 'sound/weapons/sonic_jackhammer.ogg'
	throw_message = "merely dinks off of the"
	speed = 3
	move_to_delay = 10
	retreat_distance = 4
	minimum_distance = 3
	mouse_opacity = MOUSE_OPACITY_ICON
	deathsound = 'sound/magic/repulse.ogg'
	deathmessage = "'s lights flicker, before its top part falls down."
	loot_drop = /obj/item/clothing/accessory/pandora_hope

	attack_action_types = list(/datum/action/innate/elite_attack/singular_shot,
								/datum/action/innate/elite_attack/magic_box,
								/datum/action/innate/elite_attack/pandora_teleport,
								/datum/action/innate/elite_attack/aoe_squares)

	var/sing_shot_length = 8
	var/cooldown_time = 20
	var/dungeon = FALSE		//if true then will open gates on death
	var/turf/startingloc	// Saves the turf the mob was created at
	var/rage_check = FALSE
	var/blast_charges = 0
	var/magicconstructs = list(/mob/living/simple_animal/hostile/construct/juggernaut/wizard/hostile,
								/mob/living/simple_animal/hostile/construct/wraith/wizard/hostile)
	var/conjurecount = 0
	var/hp_high = 0
	var/hp_mid = 0
	var/hp_low = 0
	var/hp_dead = 0

/mob/living/simple_animal/hostile/asteroid/elite/pandora/dungeon
	dungeon = TRUE

/datum/action/innate/elite_attack/singular_shot
	name = "Singular Shot"
	button_icon_state = "singular_shot"
	chosen_message = "<span class='boldwarning'>You are now creating a single linear magic square.</span>"
	chosen_attack_num = SINGULAR_SHOT

/datum/action/innate/elite_attack/magic_box
	name = "Magic Box"
	button_icon_state = "magic_box"
	chosen_message = "<span class='boldwarning'>You are now attacking with a box of magic squares.</span>"
	chosen_attack_num = MAGIC_BOX

/datum/action/innate/elite_attack/pandora_teleport
	name = "Line Teleport"
	button_icon_state = "pandora_teleport"
	chosen_message = "<span class='boldwarning'>You will now teleport to your target.</span>"
	chosen_attack_num = PANDORA_TELEPORT

/datum/action/innate/elite_attack/aoe_squares
	name = "AOE Blast"
	button_icon_state = "aoe_squares"
	chosen_message = "<span class='boldwarning'>Your attacks will spawn an AOE blast at your target location.</span>"
	chosen_attack_num = AOE_SQUARES

/mob/living/simple_animal/hostile/asteroid/elite/pandora/OpenFire()
	if(client)
		switch(chosen_attack)
			if(SINGULAR_SHOT)
				singular_shot(target)
			if(MAGIC_BOX)
				magic_box(target)
			if(PANDORA_TELEPORT)
				pandora_teleport(target)
			if(AOE_SQUARES)
				aoe_squares(target)
		return
	var/aiattack = rand(1,4)
	switch(aiattack)
		if(SINGULAR_SHOT)
			singular_shot(target)
		if(MAGIC_BOX)
			magic_box(target)
		if(PANDORA_TELEPORT)
			pandora_teleport(target)
		if(AOE_SQUARES)
			aoe_squares(target)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/Initialize()
	. = ..()
	startingloc = get_turf(src)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/Life()
	. = ..()
	if(health >= maxHealth * 0.75)
		cooldown_time = 20
	if(health < maxHealth * 0.75 && health >= maxHealth * 0.25)
		cooldown_time = 15
	if(health < maxHealth * 0.25 && health >= 1)
		cooldown_time = 10
	if(!client)
		if(get_dist(src, startingloc) > 9)
			pandora_teleport(startingloc)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/AttackingTarget()
	var/aiattack = rand(1,2)
	if(target && isliving(target))
		switch(aiattack)
			if(1)
				singular_shot(target)
			if(2)
				aoe_squares(target)
	return ..()

/mob/living/simple_animal/hostile/asteroid/elite/pandora/update_stat()
	. = ..()
	if(hp_high != 1 && health < maxHealth * 0.75 && health >= maxHealth * 0.5)
		aoe_squares(loc)
		hp_high = 1
	if(hp_mid != 1 && health < maxHealth * 0.50 && health >= maxHealth * 0.25)
		aoe_squares(loc)
		pandoras_secrets()
		hp_mid = 1
	if(hp_low != 1 && health < maxHealth * 0.25 && health >= 1)
		aoe_squares(loc)
		hp_low = 1
	if(hp_dead != 1 && stat == DEAD)
		aoe_squares(loc)
		hp_dead = 1

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/singular_shot(target)
	ranged_cooldown = world.time + (cooldown_time * 0.5)
	var/dir_to_target = get_dir(get_turf(src), get_turf(target))
	var/turf/T = get_step(get_turf(src), dir_to_target)
	singular_shot_line(sing_shot_length, dir_to_target, T)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/singular_shot_line(procsleft, angleused, turf/T)
	if(procsleft <= 0)
		return
	new /obj/effect/temp_visual/hierophant/blast/pandora(T, src)
	T = get_step(T, angleused)
	procsleft = procsleft - 1
	addtimer(CALLBACK(src, PROC_REF(singular_shot_line), procsleft, angleused, T), 2)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/magic_box(target)
	ranged_cooldown = world.time + cooldown_time
	var/turf/T = get_turf(target)
	for(var/t in spiral_range_turfs(3, T))
		if(get_dist(t, T) > 1)
			new /obj/effect/temp_visual/hierophant/blast/pandora(t, src)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/pandora_teleport(target)
	var/turf/T = get_turf(target)
	var/turf/source = get_turf(src)
	if(get_dist(T, source) > 2)
		ranged_cooldown = world.time + cooldown_time
		new /obj/effect/temp_visual/hierophant/telegraph(T, src)
		new /obj/effect/temp_visual/hierophant/telegraph(source, src)
		playsound(source,'sound/machines/airlockopen.ogg', 200, 1)
		addtimer(CALLBACK(src, PROC_REF(pandora_teleport_2), T, source), 2)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/pandora_teleport_2(turf/T, turf/source)
	new /obj/effect/temp_visual/hierophant/telegraph/teleport(T, src)
	new /obj/effect/temp_visual/hierophant/telegraph/teleport(source, src)
	for(var/t in RANGE_TURFS(1, T))
		new /obj/effect/temp_visual/hierophant/blast/pandora(t, src)
	for(var/t in RANGE_TURFS(1, source))
		new /obj/effect/temp_visual/hierophant/blast/pandora(t, src)
	animate(src, alpha = 0, time = 2, easing = EASE_OUT) //fade out
	visible_message("<span class='hierophant_warning'>[src] fades out!</span>")
	density = FALSE
	addtimer(CALLBACK(src, PROC_REF(pandora_teleport_3), T), 2)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/pandora_teleport_3(turf/T)
	forceMove(T)
	animate(src, alpha = 255, time = 2, easing = EASE_IN) //fade IN
	density = TRUE
	visible_message("<span class='hierophant_warning'>[src] fades in!</span>")

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/aoe_squares(target)
	ranged_cooldown = world.time + cooldown_time
	var/turf/T = get_turf(target)
	new /obj/effect/temp_visual/hierophant/blast/pandora(T, src)
	var/max_size = 2
	addtimer(CALLBACK(src, PROC_REF(aoe_squares_2), T, 0, max_size), 2)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/aoe_squares_2(turf/T, ring, max_size)
	if(ring > max_size)
		return
	for(var/t in spiral_range_turfs(ring, T))
		if(get_dist(t, T) == ring)
			new /obj/effect/temp_visual/hierophant/blast/pandora(t, src)
	addtimer(CALLBACK(src, PROC_REF(aoe_squares_2), T, (ring + 1), max_size), 2)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/blast_spam()
	if(stat != DEAD)
		if(blast_charges >= 1)
			blast_charges -= 1
			var/list/turf/blast_turfs = RANGE_TURFS(10, startingloc)
			var/list/turf/blast_picked_turfs = list()
			for(var/i in 1 to 50)
				var/turf/T = pick_n_take(blast_turfs)
				blast_picked_turfs += T
				new /obj/effect/temp_visual/hierophant/blast/pandora(T, src)
			addtimer(CALLBACK(src, PROC_REF(blast_spam)), 3 SECONDS)
			return blast_picked_turfs
		else
			return blast_charges
	else
		return stat

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/conjure_hostiles(switchdirs)
	var/carboncount = 0
	if(stat != DEAD)
		for(var/mob/living/carbon/C in range(10, src))
			if(carboncount < 4)
				carboncount += 1
		if(carboncount >= 4)
			conjurecount -= 4
			switch(switchdirs)
				if(1)
					conjure_hostile(NORTH)
					conjure_hostile(SOUTH)
					conjure_hostile(WEST)
					conjure_hostile(EAST)
					if(conjurecount != 0)
						addtimer(CALLBACK(src, PROC_REF(conjure_hostiles), 2), 25 SECONDS)
					return switchdirs
				if(2)
					conjure_hostile(NORTHEAST)
					conjure_hostile(NORTHWEST)
					conjure_hostile(SOUTHEAST)
					conjure_hostile(SOUTHWEST)
					if(conjurecount != 0)
						addtimer(CALLBACK(src, PROC_REF(conjure_hostiles), 2), 25 SECONDS)
					return
		else if(carboncount == 3)
			conjurecount -= 3
			conjure_hostile(NORTH)
			conjure_hostile(SOUTHEAST)
			conjure_hostile(SOUTHWEST)
			if(conjurecount != 0)
				addtimer(CALLBACK(src, PROC_REF(conjure_hostiles), 2), 25 SECONDS)
			return
		else if(carboncount == 2)
			conjurecount -= 2
			switch(rand(1, 2))
				if(1)
					conjure_hostile(NORTH)
					conjure_hostile(EAST)
				if(2)
					conjure_hostile(SOUTH)
					conjure_hostile(WEST)
			if(conjurecount != 0)
				addtimer(CALLBACK(src, PROC_REF(conjure_hostiles), 2), 25 SECONDS)
			return
		else
			conjure_hostile(rand(1, 8))
			conjurecount -= 1
			if(conjurecount != 0)
				addtimer(CALLBACK(src, PROC_REF(conjure_hostiles), 2), 25 SECONDS)
			return
	else
		return

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/conjure_hostile(dir)
	var/turf/stepturf = get_turf(src)
	var/turf/startingturf = get_turf(src)
	var/pickconstruct = pick(magicconstructs)
	for(var/T in 1 to 5)
		stepturf = get_open_turf_in_dir(stepturf, dir)
		sleep(2)
		if(get_dist(startingturf, stepturf) > 4)
			new /obj/effect/temp_visual/hierophant/blast/pandora(stepturf)
			sleep(7)
			new pickconstruct(stepturf)
		else
			if(get_open_turf_in_dir_null(stepturf, dir) == null)
				new /obj/effect/temp_visual/hierophant/blast/pandora(stepturf)
				sleep(7)
				new pickconstruct(stepturf)
			else
				new /obj/effect/temp_visual/revenant(stepturf)

/mob/living/simple_animal/hostile/asteroid/elite/pandora/Move(atom/newloc, dir, step_x , step_y)
	if(rage_check == TRUE)
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/reinforce()
	armor = list("melee" = 200, "bullet" = 200, "laser" = 200, "energy" = 200, "bomb" = 200, "bio" = 200, "rad" = 200, "fire" = 200, "acid" = 200)
	armor = getArmor(arglist(armor)) // so it actually be real armor and not simple list
	ranged = FALSE
	rage_check = TRUE

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/reinforce_end()
	armor = list("melee" = 20, "bullet" = 30, "laser" = 20, "energy" = 30, "bomb" = 50, "bio" = 40, "rad" = 20, "fire" = 20, "acid" = 20)
	armor = getArmor(arglist(armor))
	ranged = TRUE
	rage_check = FALSE

/mob/living/simple_animal/hostile/asteroid/elite/pandora/proc/pandoras_secrets()
	if(isturf(startingloc))
		pandora_teleport(startingloc)
		reinforce()
		addtimer(CALLBACK(src, PROC_REF(reinforce_end)), 55 SECONDS)
		blast_charges += 20
		conjurecount = 8
		addtimer(CALLBACK(src, PROC_REF(blast_spam)), 1 SECONDS)
		addtimer(CALLBACK(src, PROC_REF(conjure_hostiles), 1), 20 SECONDS)
		speed = 2.5

/mob/living/simple_animal/hostile/asteroid/elite/pandora/death()
	//open all pandora gates
	if(dungeon)
		for(var/obj/machinery/door/poddoor/D in GLOB.machines)
			if(D.id == "pandora_dead")
				D.open()
	..()

//The specific version of hiero's squares pandora uses
/obj/effect/temp_visual/hierophant/blast/pandora
	damage = 20
	monster_damage_boost = FALSE

//Pandora's loot: Hope
/obj/item/clothing/accessory/pandora_hope
	name = "Hope"
	desc = "Found at the bottom of Pandora. After all the evil was released, this was the only thing left inside."
	icon = 'icons/obj/lavaland/elite_trophies.dmi'
	icon_state = "hope"
	resistance_flags = FIRE_PROOF
	armor = list("melee" = 5, "bullet" = 5, "laser" = 5, "energy" = 5, "bomb" = 20, "bio" = 20, "rad" = 5, "fire" = 0, "acid" = 25)

/obj/item/clothing/accessory/pandora_hope/on_uniform_equip(obj/item/clothing/under/U, user)
	var/mob/living/L = user
	if(L && L.mind)
		SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "hope_lavaland", /datum/mood_event/hope_lavaland)

/obj/item/clothing/accessory/pandora_hope/on_uniform_dropped(obj/item/clothing/under/U, user)
	var/mob/living/L = user
	if(L && L.mind)
		SEND_SIGNAL(L, COMSIG_CLEAR_MOOD_EVENT, "hope_lavaland")
