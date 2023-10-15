/obj/item/gun/ballistic/automatic/assualt
	burst_size = 1
	actions_types = list()

/obj/item/gun/ballistic/automatic/assualt/ak47
	name = "\improper SVG-67"
	desc = "A frontier-built assault rifle descended from a pattern of unknown provenance. Its low cost and ease of maintenance make it a popular choice among a wide variety of outlaws."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/ak47.ogg'
	icon_state = "ak47"
	item_state = "ak47"
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/ak47

/obj/item/gun/ballistic/automatic/assualt/ak47/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

/obj/item/gun/ballistic/automatic/assualt/ak47/nt
	name = "\improper NT-SVG"
	desc = "An even cheaper version of the already-cheap SVG-67, rechambered for the lightweight 4.6x38mm PDW cartridge. The flimsy folding stock and light construction make for a highly portable rifle lacking in accuracy and stopping power."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/shot.ogg'
	icon_state = "ak47_nt"
	item_state = "ak47_nt"
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/aknt
	var/folded = FALSE
	var/unfolded_spread = 2
	var/unfolded_item_state = "ak47_nt"
	var/folded_spread = 20
	var/folded_item_state = "ak47_nt_stockless"

/obj/item/gun/ballistic/automatic/assualt/ak47/nt/CtrlClick(mob/user)
	. = ..()
	if((!ishuman(user) || user.stat))
		return
	to_chat(user, "<span class='notice'>You start to [folded ? "unfold" : "fold"] the stock on the [src].</span>")
	if(do_after(user, 10, target = src))
		fold(user)
		user.update_inv_back()
		user.update_inv_hands()
		user.update_inv_s_store()

/obj/item/gun/ballistic/automatic/assualt/ak47/nt/proc/fold(mob/user)
	if(folded)
		to_chat(user, "<span class='notice'>You unfold the stock on the [src].</span>")
		spread = unfolded_spread
		item_state = unfolded_item_state
		w_class = WEIGHT_CLASS_BULKY
	else
		to_chat(user, "<span class='notice'>You fold the stock on the [src].</span>")
		spread = folded_spread
		item_state = folded_item_state
		w_class = WEIGHT_CLASS_NORMAL

	folded = !folded
	playsound(src.loc, 'sound/weapons/empty.ogg', 100, 1)
	update_appearance()

/obj/item/gun/ballistic/automatic/assualt/ak47/nt/update_overlays()
	. = ..()
	var/mutable_appearance/stock
	if(!folded)
		stock = mutable_appearance(icon, "ak47_nt_stock")
	else
		stock = mutable_appearance(icon, null)
	. += stock

/obj/item/gun/ballistic/automatic/assualt/ak47/inteq
	name = "\improper SkM-24"
	desc = "An obsolete assault rifle seized from some frontier armory and extensively modified to IRMG standards. Chambered in 7.62x39mm."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/akm.ogg'
	icon_state = "akm"
	item_state = "akm"
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	mob_overlay_icon = 'icons/mob/clothing/back.dmi'
	mag_display = TRUE

/obj/item/gun/ballistic/automatic/assualt/p16
	name = "\improper P-16"
	desc = "A Night of Fire-era assault rifle pattern from Sol, chambered in 5.56mm. Rediscovered by the Colonial Minutemen and now frequently reproduced. A favorite of professional mercenaries and well-heeled pirates."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/m16.ogg'
	icon_state = "p16"
	item_state = "p16"
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/p16

/obj/item/gun/ballistic/automatic/assualt/p16/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

/obj/item/gun/ballistic/automatic/assualt/p16/minutemen
	name = "\improper CM-16"
	desc = "An extensive modification of the P-16, now the standard-issue rifle of the Colonial Minutemen. Chambered in 5.56mm."
	icon_state = "cm16"
	item_state = "cm16"

/obj/item/gun/ballistic/automatic/assualt/ar
	name = "\improper NT-ARG 'Boarder'"
	desc = "A burst-fire 5.56mm carbine occasionally found in the hands of Nanotrasen marines."
	fire_sound = 'sound/weapons/gun/rifle/shot_alt2.ogg'
	icon_state = "arg"
	item_state = "arg"
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m556
	can_suppress = FALSE
	burst_size = 3
	fire_delay = 1

/obj/item/gun/ballistic/automatic/assualt/ar/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

/obj/item/gun/ballistic/automatic/assualt/swiss_cheese
	name = "\improper Swiss Cheese"
	desc = "An ancient longarm famous for its boxy, modular design. The DMA on this unit is, sadly, broken. Uses 5.56mm ammunition for Matter mode."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/swiss.ogg'
	icon_state = "swiss"
	item_state = "swiss"
	mag_display = TRUE
	empty_indicator = TRUE
	spread = 8
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/swiss
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/assualt/swiss_cheese/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.65 SECONDS)

/obj/item/gun/ballistic/automatic/assualt/swiss_cheese/afterattack(atom/target, mob/living/user, flag, params)
	if(select == 2)
		to_chat(user, "<span class='danger'>You hear a strange sound from the DMA unit. It doesn't appear to be operational.</span>")
		return
	else
		return ..()

/obj/item/gun/ballistic/automatic/assualt/swiss_cheese/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(1)
			select = 2
			to_chat(user, "<span class='notice'>You switch to Hybrid.</span>")
		if(2)
			select = 1
			burst_size = initial(burst_size)
			fire_delay = initial(fire_delay)
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd Matter.</span>")

	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_appearance()
	for(var/datum/action/action as anything in actions)
		action.UpdateButtonIcon()

/obj/item/gun/ballistic/automatic/assualt/g36sh
	name = "\improper G36-SH"
	desc = "Наследие огненной эры Союза Человечества , укороченная версия ,  калибра 5.56x45 . Технология производства восстановлена минитменами , но ввиду усложненной конструкции продана корпорации InteQ. Используется сотрудниками InteQ по сей день , как оружие для элитных наемников."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/g36sh.ogg'
	icon_state = "g36sh"
	item_state = "g36sh"
	mag_type = /obj/item/ammo_box/magazine/p16/g36sh
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	spread = 16
	actions_types = list()
	mag_display = TRUE
	special_mags = TRUE
	tac_reloads = TRUE
	var/obj/item/ammo_box/magazine/p16/g36sh/alternate_magazine
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/assualt/g36sh/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.15 SECONDS)

/obj/item/gun/ballistic/automatic/assualt/g36sh/Initialize()
	. = ..()
	if (!alternate_magazine)
		alternate_magazine = new mag_type(src)
		spawnwithmagazine = FALSE
		mag_type = /obj/item/ammo_box/magazine/p16

/obj/item/gun/ballistic/automatic/assualt/g36sh/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			burst_size = 1
			fire_delay = 0
			spread = 16
			to_chat(user, "<span class='notice'>You switch to full automatic.</span>")
			SEND_SIGNAL(src,COMSIG_GUN_ENABLE_AUTOFIRE)
		if(1)
			select = 2
			spread = 4
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
			SEND_SIGNAL(src, COMSIG_GUN_DISABLE_AUTOFIRE)
		if(2)
			select = 0
			burst_size = 3
			fire_delay = 2
			spread = 8
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd Matter.</span>")
			SEND_SIGNAL(src, COMSIG_GUN_DISABLE_AUTOFIRE)
	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/assualt/g36sh/inteq
	name = "\improper Moded G36-SH"
	desc = "Обширная модификация G36-SH, которая входит в стандартную комплектацию вооружения InteQ. Калибр 5,56x45 мм."
	icon_state = "g36shinteq"
	item_state = "g36shinteq"
	empty_indicator = TRUE
	empty_alarm = TRUE

/obj/item/gun/ballistic/automatic/assualt/g36
	name = "\improper G36"
	desc = "Наследие огненной эры Союза Человечества , калибра 5.56x45 . Технология производства восстановлена минитменами , но ввиду усложненной конструкции продана корпорации InteQ. Используется сотрудниками InteQ по сей день , как оружие для элитных наемников. "
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/g36.ogg'
	icon_state = "g36"
	item_state = "g36"
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	spread = 12
	mag_type = /obj/item/ammo_box/magazine/p16/g36
	actions_types = list()
	mag_display = TRUE
	special_mags = TRUE
	tac_reloads = TRUE
	var/obj/item/ammo_box/magazine/p16/g36/alternate_magazine
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/assualt/g36/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.15 SECONDS)

/obj/item/gun/ballistic/automatic/assualt/g36/Initialize()
	. = ..()
	if (!alternate_magazine)
		alternate_magazine = new mag_type(src)
		spawnwithmagazine = FALSE
		mag_type = /obj/item/ammo_box/magazine/p16

/obj/item/gun/ballistic/automatic/assualt/g36/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			burst_size = 1
			fire_delay = 0
			spread = 12
			to_chat(user, "<span class='notice'>You switch to full automatic.</span>")
			SEND_SIGNAL(src,COMSIG_GUN_ENABLE_AUTOFIRE)
		if(1)
			select = 2
			spread = 4
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
			SEND_SIGNAL(src, COMSIG_GUN_DISABLE_AUTOFIRE)
		if(2)
			select = 0
			burst_size = 3
			fire_delay = 2
			spread = 6
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd Matter.</span>")
			SEND_SIGNAL(src, COMSIG_GUN_DISABLE_AUTOFIRE)
	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/assualt/g36/inteq
	name = "\improper Moded G36"
	desc = "Обширная модификация G36, которая входит в стандартную комплектацию вооружения InteQ. Калибр 5,56x45 мм."
	icon_state = "g36inteq"
	item_state = "g36inteq"
	empty_indicator = TRUE
	empty_alarm = TRUE

/obj/item/gun/ballistic/automatic/assualt/morita1
	name = "\improper Morita MK.I"
	desc = "Стандартная пехотная автоматическая винтовка под калибр .308. Широко применяется армейскими корпусами в Союзе Человечества. Популярность в гражданских кругах заслужила после сьемок в фильме Starboat Troopes."
	icon = 'icons/obj/guns/48x32guns.dmi'
	fire_sound = 'sound/weapons/gun/rifle/morita1.ogg'
	icon_state = "morita1"
	item_state = "morita1"
	actions_types = list()
	special_mags = TRUE
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	spread = 9
	mag_type = /obj/item/ammo_box/magazine/morita1
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/assualt/morita1/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.20 SECONDS)

/obj/item/gun/ballistic/automatic/assualt/morita1/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			burst_size = 1
			fire_delay = 0
			spread = 9
			to_chat(user, "<span class='notice'>You switch to full automatic.</span>")
			SEND_SIGNAL(src,COMSIG_GUN_ENABLE_AUTOFIRE)
		if(1)
			select = 2
			spread = 4
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
			SEND_SIGNAL(src, COMSIG_GUN_DISABLE_AUTOFIRE)
		if(2)
			select = 0
			burst_size = 3
			fire_delay = 2
			spread = 4
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd Matter.</span>")
			SEND_SIGNAL(src, COMSIG_GUN_DISABLE_AUTOFIRE)
	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_icon()
	return

/obj/item/gun/ballistic/automatic/assualt/morita1/desert
	name = "\improper Morita MK.I(desert)"
	desc = "Стандартная пехотная автоматическая винтовка под калибр .308. Широко применяется армейскими корпусами в Союзе Человечества. Популярность в гражданских кругах заслужила после сьемок в фильме Starboat Troopes./Модификация с пустынным камуфляжем"
	icon_state = "morita1_desert"
	item_state = "morita1_desert"

/obj/item/gun/ballistic/automatic/assualt/morita1/forest
	name = "\improper Morita MK.I(forest)"
	desc = "Стандартная пехотная автоматическая винтовка под калибр .308. Широко применяется армейскими корпусами в Союзе Человечества. Популярность в гражданских кругах заслужила после сьемок в фильме Starboat Troopes./Модификация с лесным камуфляжем"
	icon_state = "morita1_forest"
	item_state = "morita1_forest"

/obj/item/gun/ballistic/automatic/assualt/morita1/swamp
	name = "\improper Morita MK.I(swamp)"
	desc = "Стандартная пехотная автоматическая винтовка под калибр .308. Широко применяется армейскими корпусами в Союзе Человечества. Популярность в гражданских кругах заслужила после сьемок в фильме Starboat Troopes./Модификация с болотным камуфляжем"
	icon_state = "morita1_swamp"
	item_state = "morita1_swamp"
