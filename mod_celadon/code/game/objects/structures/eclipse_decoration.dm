/obj/structure/radioactive/ammo
	icon = 'icons/obj/hazard_ammo.dmi'
	anchored = TRUE

/obj/structure/radioactive/ammo/lead_ammo
	name = "Heavy lead shell"
	desc = "It wasn't uncommon for early vessels to simply dump their waste like this out the airlock. However this proved to be a terrible long-term solution."
	icon_state = "lead_shell"
	rad_power = 5
	rad_range = 0.8
	rad_prob = 5

/obj/structure/radioactive/ammo/uranium_ammo
	name = "Depleted uranium shell"
	desc = "Uranium shell, dense and armor-penetrating, raises health and environmental concerns."
	icon_state = "uranium_shell"
	rad_power = 15
	rad_range = 0.8
	rad_prob = 25

/obj/structure/radioactive/ammo/uranium_ammo_lay
	name = "Depleted uranium shell"
	desc = "Uranium shell, dense and armor-penetrating, raises health and environmental concerns.This uranium shell has been laid down."
	icon_state = "uranium_shell_lay"
	rad_power = 30
	rad_range = 0.8
	rad_prob = 50

/obj/structure/radioactive/ammo/uranium_ammo_broken
	name = "Leaking depleted uranium shell"
	desc = "Leaking depleted uranium shells can pose a risk due to potential release of uranium dust or fragments."
	icon_state = "uranium_shell_broken"
	rad_power = 300
	rad_prob = 50
	rad_range = 0.8

/obj/structure/radioactive/ammo/plasma_ammo
	name = "Explosive plasma shell"
	desc = "Plasma shell, dense and armor-piercing, is likely explosive."
	icon_state = "plasma_shell"
	max_integrity = 50

/obj/structure/radioactive/ammo/plasma_ammo/lay
	name = "Explosive plasma shell"
	desc = "Plasma shell, dense and armor-piercing, is likely explosive. This Plasma shell has been laid down."
	icon_state = "plasma_shell_lay"

/obj/structure/radioactive/ammo/plasma_ammo/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	. = ..()
	if(. && obj_integrity > 0)
		if(damage_flag == "bullet" || damage_flag == "laser")
			boom()

/obj/structure/radioactive/ammo/plasma_ammo/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(!disassembled)
			boom()
	else
		qdel(src)

/obj/structure/radioactive/ammo/plasma_ammo/Initialize()
	. = ..()

/obj/structure/radioactive/ammo/plasma_ammo/attackby(obj/item/W, mob/user, params)
	if(W.is_refillable())
		return 0 //so we can refill them via their afterattack.
	else
		return ..()

/obj/structure/radioactive/ammo/plasma_ammo/proc/boom()
	visible_message("<span class='danger'>\The [src] ruptures!</span>")
	qdel(src)

/obj/structure/radioactive/ammo/plasma_ammo/boom()
	explosion(get_turf(src), 0, 1, 5, flame_range = 5)
	qdel(src)

/obj/structure/radioactive/ammo/plasma_ammo/blob_act(obj/structure/blob/B)
	boom()

/obj/structure/radioactive/ammo/plasma_ammo/ex_act()
	boom()

/obj/structure/radioactive/ammo/plasma_ammo/fire_act(exposed_temperature, exposed_volume)
	boom()

/obj/structure/radioactive/ammo/plasma_ammo/zap_act(zap_flags)
	..() //extend the zap
	if(ZAP_OBJ_DAMAGE & zap_flags)
		boom()

/obj/structure/radioactive/ammo/plasma_ammo/bullet_act(obj/projectile/P)
	. = ..()
	if(!QDELETED(src)) //wasn't deleted by the projectile's effects.
		if(!P.nodamage && ((P.damage_type == BURN) || (P.damage_type == BRUTE)))
			log_bomber(P.firer, "detonated a", src, "via projectile")
			boom()
