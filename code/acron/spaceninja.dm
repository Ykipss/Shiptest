/datum/outfit/acron_ninja
	name = "Frontier Space Ninja"
	uniform = /obj/item/clothing/under/syndicate/ninja
	suit = /obj/item/clothing/suit/space/space_ninja
	glasses = /obj/item/clothing/glasses/night
	mask = /obj/item/clothing/mask/gas/space_ninja
	head = /obj/item/clothing/head/helmet/space/space_ninja
	ears = /obj/item/radio/headset/ninja
	shoes = /obj/item/clothing/shoes/space_ninja
	gloves = /obj/item/clothing/gloves/space_ninja
	back = /obj/item/storage/backpack/ninja
	l_pocket = /obj/item/grenade/c4/x4
	r_pocket = /obj/item/tank/internals/emergency_oxygen
	internals_slot = ITEM_SLOT_RPOCKET
	belt = /obj/item/energy_katana
	implants = list(/obj/item/implant/explosive)

/datum/outfit/acron_ninja/post_equip(mob/living/carbon/human/H)
	if(istype(H.wear_suit, suit))
		var/obj/item/clothing/suit/space/space_ninja/S = H.wear_suit
		if(istype(H.belt, belt))
			S.energyKatana = H.belt
		S.randomize_param()
	H.faction |= ROLE_NINJA
	H.mind.add_antag_datum(/datum/antagonist/ninja/acron_ninja)
	ADD_TRAIT(H, TRAIT_NOGUNS, SPACE_NINJA_TRAIT)
	return

/datum/antagonist/ninja/acron_ninja/addMemories()
	antag_memory += "<br><meta http-equiv='X-UA-Compatible' content='IE=edge' charset='UTF-8'/>Я являюсь элитным наемником-ассасином великого клана Паука.<br/>"
	antag_memory += "<br>Неожиданность - мое оружие. Тень - моя броня. Без них - я ничто. (//Активируйте костюм для использования способностей)!<br/>"
	antag_memory += "<br>Официально, я наемник, и только я решаю, кто будет моим нанимателем.<br/>"

/datum/antagonist/ninja/acron_ninja/greet()
	SEND_SOUND(owner.current, sound('sound/effects/ninja_greeting.ogg'))
	to_chat(owner.current, "Я являюсь элитным наемником-ассасином великого клана Паука!")
	to_chat(owner.current, "Неожиданность - мое оружие. Тень - моя броня. Без них - я ничто. (//Активируйте костюм для использования способностей)")
	to_chat(owner.current, "Официально, я наемник, и только я решаю, кто будет моим нанимателем.")
	owner.announce_objectives()
	return

/datum/antagonist/ninja/acron_ninja/addObjectives(quantity)
	var/datum/objective/survive/Objective_one = new /datum/objective/survive()
	Objective_one.owner = owner
	objectives += Objective_one
