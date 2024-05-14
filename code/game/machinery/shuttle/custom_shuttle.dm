/obj/machinery/power/shuttle
	name = "shuttle component"
	desc = "Something for shuttles."
	density = TRUE
	obj_integrity = 250
	max_integrity = 250
	// [CELADON-EDIT] - CELADON_BALANCE
	// icon = 'icons/obj/shuttle.dmi' // CELADON-EDIT - ORIGINAL
	icon = 'mod_celadon/balance/icons/shuttle.dmi'
	// [/CELADON-EDIT]
	icon_state = "burst_plasma"
	circuit = /obj/item/circuitboard/machine/shuttle/engine
	var/icon_state_closed = "burst_plasma"
	var/icon_state_open = "burst_plasma_open"
	var/icon_state_off = "burst_plasma_off"

/obj/machinery/power/shuttle/attackby(obj/item/I, mob/living/user, params)
	if(default_deconstruction_screwdriver(user, icon_state_open, icon_state_closed, I))
		return
	if(default_pry_open(I))
		return
	if(panel_open)
		if(default_change_direction_wrench(user, I))
			return
	if(default_deconstruction_crowbar(I))
		return
	return ..()
