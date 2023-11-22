/obj/item/mecha_parts/concealed_weapon_bay
	name = "concealed weapon bay"
	desc = "Отсек, который позволяет небоевому механизму экипировать одно оружие, скрывая его от посторонних глаз."
	icon = 'icons/mecha/mecha_equipment.dmi'
	icon_state = "mecha_weapon_bay"

/obj/item/mecha_parts/concealed_weapon_bay/try_attach_part(mob/user, obj/mecha/M)
	if(istype(M, /obj/mecha/combat))
		to_chat(user, "<span class='warning'>[M] уже может держать в себе вооружение!</span>")
		return
	if(locate(/obj/item/mecha_parts/concealed_weapon_bay) in M.contents)
		to_chat(user, "<span class='warning'>[M] уже имеет скрытый отсек для оружия!</span>")
		return
	..()
