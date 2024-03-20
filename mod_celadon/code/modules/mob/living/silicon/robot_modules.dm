/obj/item/robot_module/medical/be_transformed_to(obj/item/robot_module/old_module)
	if(!med_icons)
		med_icons = list(
		"Drake" = image(icon = 'mod_celadon/icons/mob/cyborg/drakemech.dmi', icon_state = "drakemedbox"),
		)
		med_icons = sortList(med_icons)
	switch(med_borg_icon)
		if("Drake") // Dergborg brought to you by Gardelin0 | Commissioned Artist: deviantart.com/mizartz
			cyborg_base_icon = "drakemed"
			cyborg_icon_override = 'mod_celadon/icons/mob/cyborg/drakemech.dmi'
			moduleselect_icon = "medihound"
			hasrest = TRUE
			R.pixel_y = -16
			R.pixel_x = -16

	return ..()

/obj/item/robot_module/engineering/be_transformed_to(obj/item/robot_module/old_module)
	if(!engi_icons)
		engi_icons = list(
		"Drake" = image(icon = 'mod_celadon/icons/mob/cyborg/drakemech.dmi', icon_state = "drakeengbox"),
		)
		engi_icons = sortList(engi_icons)
	switch(engi_borg_icon)
		if("Drake") // Dergborg brought to you by Gardelin0 | Commissioned Artist: deviantart.com/mizartz
			cyborg_base_icon = "drakeeng"
			cyborg_icon_override = 'mod_celadon/icons/mob/cyborg/drakemech.dmi'
			hasrest = TRUE
			R.pixel_y = -16
			R.pixel_x = -16

	return ..()

/obj/item/robot_module/security/be_transformed_to(obj/item/robot_module/old_module)
	if(!sec_icons)
		sec_icons = list(
		"Drake" = image(icon = 'mod_celadon/icons/mob/cyborg/drakemech.dmi', icon_state = "drakesecbox"),
		)
		sec_icons = sortList(sec_icons)
	switch(sec_borg_icon)
		if("Drake") // Dergborg brought to you by Gardelin0 | Commissioned Artist: deviantart.com/mizartz
			cyborg_base_icon = "drakesec"
			cyborg_icon_override = 'mod_celadon/icons/mob/cyborg/drakemech.dmi'
			hasrest = TRUE
			R.pixel_y = -16
			R.pixel_x = -16

	return ..()

/obj/item/robot_module/janitor/be_transformed_to(obj/item/robot_module/old_module)
	if(!jan_icons)
		jan_icons = list(
		"Drake" = image(icon = 'mod_celadon/icons/mob/cyborg/drakemech.dmi', icon_state = "drakejanitbox"),
		)
		jan_icons = sortList(jan_icons)
	switch(jan_borg_icon)
		if("Drake") // Dergborg brought to you by Gardelin0 | Commissioned Artist: deviantart.com/mizartz
			cyborg_base_icon = "drakejanit"
			cyborg_icon_override = 'mod_celadon/icons/mob/cyborg/drakemech.dmi'
			hasrest = TRUE
			R.pixel_y = -16
			R.pixel_x = -16

	return ..()

/obj/item/robot_module/miner/be_transformed_to(obj/item/robot_module/old_module)
	if(!mining_icons)
		mining_icons = list(
		"Drake" = image(icon = 'mod_celadon/icons/mob/cyborg/drakemech.dmi', icon_state = "drakeminebox"),
		)
		mining_icons = sortList(mining_icons)
	switch(mining_borg_icon)
		if("Drake") // Dergborg brought to you by Gardelin0 | Commissioned Artist: deviantart.com/mizartz
			cyborg_base_icon = "drakemine"
			cyborg_icon_override = 'mod_celadon/icons/mob/cyborg/drakemech.dmi'
			hasrest = TRUE
			R.pixel_y = -16
			R.pixel_x = -16

	return ..()
