/obj/structure/radioactive/ammo
	icon = 'icons/obj/hazard_ammo.dmi'

/obj/structure/radioactive/ammo/lead_ammo
	name = "Heavy lead shell"
	desc = "It wasn't uncommon for early vessels to simply dump their waste like this out the airlock. However this proved to be a terrible long-term solution."
	icon_state = "barrel_tipped"
	anchored = TRUE
	rad_power = 5
	rad_range = 0.8
	rad_prob = 5

/obj/structure/radioactive/ammo/uranium_ammo
	name = "Depleted uranium shell"
	desc = "Uranium shell, dense and armor-penetrating, raises health and environmental concerns."
	icon_state = "uranium_shell"
	anchored = TRUE
	rad_power = 15
	rad_range = 0.8
	rad_prob = 25

/obj/structure/radioactive/ammo/uranium_ammo_lay
	name = "Depleted uranium shell"
	desc = "Uranium shell, dense and armor-penetrating, raises health and environmental concerns.This uranium shell has been laid down."
	icon_state = "uranium_shell_lay"
	anchored = TRUE
	rad_power = 30
	rad_range = 0.8
	rad_prob = 50

/obj/structure/radioactive/ammo/uranium_ammo_broken
	name = "Leaking depleted uranium shell"
	desc = "Leaking depleted uranium shells can pose a risk due to potential release of uranium dust or fragments."
	icon_state = "uranium_shell_broken"
	anchored = TRUE
	rad_power = 300
	rad_prob = 50
	rad_range = 0.8
