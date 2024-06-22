/datum/gear/glove
	subtype_path = /datum/gear/glove
	slot = ITEM_SLOT_HANDS
	sort_category = "Gloves"

/datum/gear/glove/gloves
	subtype_path = /datum/gear/glove/gloves

/datum/gear/glove/gloves/gloves_maid
	display_name = "maid armcovers"
	description = "Cylindrical looking tubes that go over your arm, weird."
	path = /obj/item/clothing/gloves/maid

/datum/gear/glove/gloves/gloves_nitrile_red
	display_name = "Red nitrile gloves"
	description = "You sertainly will loose your medical license."
	path = /obj/item/clothing/gloves/color/latex/nitrile/evil

/datum/gear/glove/gloves/gloves_nitrile_blue
	display_name = "Blue nitrile gloves"
	description = "Is it somehow connected with Emesis?"
	path = /obj/item/clothing/gloves/color/latex/nitrile/evil/blue

/*
Я просто не знаю куда мне пихать эти перчатки,
потому-что из-за одного предмета как по мне делать отдельный модпак как минимум глупо.
*/

/obj/item/clothing/gloves/color/latex/nitrile/evil/blue
	name = "blue nitrile gloves"
	desc = "Thick sterile gloves that reach up to the elbows, in exactly the same color as fresh royal blue paint. Transfers combat medic knowledge into the user via nanochips."
	icon = './mod_celadon/loadout/icons/obj/nitrile_evil_blue.dmi'
	mob_overlay_icon = './mod_celadon/loadout/icons/mob/nitrile_evil_blue.dmi'
	icon_state = "nitrile_evil_blue"
	mob_overlay_state = "nitrile_evil_blue"
