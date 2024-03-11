
//Hydraulic clamp, Kill clamp, Extinguisher, RCD, Cable layer.


/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp
	name = "hydraulic clamp"
	desc = "Оборудование для инженерных экзоскелетов. Поднимает большие предметы и загружает их в грузовой отсек.."
	icon_state = "mecha_clamp"
	equip_cooldown = 15
	energy_drain = 10
	tool_behaviour = TOOL_RETRACTOR
	toolspeed = 0.8
	var/dam_force = 20
	var/obj/mecha/working/ripley/cargo_holder
	harmful = TRUE

/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/can_attach(obj/mecha/working/ripley/M as obj)
	if(..())
		if(istype(M))
			return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/attach(obj/mecha/M as obj)
	..()
	cargo_holder = M
	return

/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/detach(atom/moveto = null)
	..()
	cargo_holder = null

/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/action(atom/target)
	if(!action_checks(target))
		return
	if(!cargo_holder)
		return
	if(ismecha(target))
		var/obj/mecha/M = target
		var/have_ammo
		for(var/obj/item/mecha_ammo/box in cargo_holder.cargo)
			if(istype(box, /obj/item/mecha_ammo) && box.rounds)
				have_ammo = TRUE
				if(M.ammo_resupply(box, chassis.occupant, TRUE))
					return
		if(have_ammo)
			to_chat(chassis.occupant, "В грузовом отсеке [M] больше нет места для припасов.")
		else
			to_chat(chassis.occupant, "В грузовом отсеке не обнаружено никаких припасов")
		return
	if(isobj(target))
		var/obj/O = target
		if(istype(O, /obj/machinery/door/firedoor))
			var/obj/machinery/door/firedoor/D = O
			D.try_to_crowbar(src,chassis.occupant)
			return
		if(istype(O, /obj/machinery/door/airlock/))
			var/obj/machinery/door/airlock/D = O
			D.try_to_crowbar(src,chassis.occupant)
			return
		if(!O.anchored)
			if(cargo_holder.cargo.len < cargo_holder.cargo_capacity)
				chassis.visible_message("<span class='notice'>[chassis] поднимает [target] и начинает загужать в грузовой отсек.</span>")
				O.set_anchored(TRUE)
				if(do_after_cooldown(target))
					cargo_holder.cargo += O
					O.forceMove(chassis)
					O.set_anchored(FALSE)
					occupant_message("<span class='notice'>[target] успешно загружен.</span>")
					log_message("Загружен [O]. Вместимость грузового отсека: [cargo_holder.cargo_capacity - cargo_holder.cargo.len]", LOG_MECHA)
				else
					O.set_anchored(initial(O.anchored))
			else
				occupant_message("<span class='warning'>Недосттаочно места в грузовом отсеке!</span>")
		else
			occupant_message("<span class='warning'>[target] надежно закреплен!</span>")

	else if(isliving(target))
		var/mob/living/M = target
		if(M.stat == DEAD)
			return
		if(chassis.occupant.a_intent == INTENT_HARM)
			M.take_overall_damage(dam_force)
			if(!M)
				return
			M.adjustOxyLoss(round(dam_force/2))
			M.updatehealth()
			target.visible_message("<span class='danger'>[chassis] сжимает [target]!</span>", \
								"<span class='userdanger'>[chassis] сжимает тебя!</span>",\
								"<span class='hear'>Ты слышишь как что-то хрустит..</span>")
			log_combat(chassis.occupant, M, "attacked", "[name]", "(INTENT: [uppertext(chassis.occupant.a_intent)]) (DAMTYPE: [uppertext(damtype)])")
		else
			step_away(M,chassis)
			occupant_message("<span class='notice'>Ты толкаешь [target] со своего пути.</span>")
			chassis.visible_message("<span class='notice'>[chassis] толкает [target] со своего пути.</span>")
		return 1



//This is pretty much just for the death-ripley
/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/kill
	name = "\improper KILL CLAMP"
	desc = "Они не поймут что их раздовило!"
	energy_drain = 0
	dam_force = 0
	var/real_clamp = FALSE

/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/kill/real
	desc = "Они не поймут что их раздовило! На этот раз взаправду!"
	energy_drain = 10
	dam_force = 20
	real_clamp = TRUE

/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp/kill/action(atom/target)
	if(!action_checks(target))
		return
	if(!cargo_holder)
		return
	if(isobj(target))
		var/obj/O = target
		if(!O.anchored)
			if(cargo_holder.cargo.len < cargo_holder.cargo_capacity)
				chassis.visible_message("<span class='notice'>[chassis] поднимает [target] и начинает ззагружать в грузовой отсек.</span>")
				O.set_anchored(TRUE)
				if(do_after_cooldown(target))
					cargo_holder.cargo += O
					O.forceMove(chassis)
					O.set_anchored(FALSE)
					occupant_message("<span class='notice'>[target] успешно загружен.</span>")
					log_message("Загружен [O]. Вместимость грузового отсека: [cargo_holder.cargo_capacity - cargo_holder.cargo.len]", LOG_MECHA)
				else
					O.set_anchored(initial(O.anchored))
			else
				occupant_message("<span class='warning'>Не достаточно места в грузовом отсеке!</span>")
		else
			occupant_message("<span class='warning'>[target] надежно закреплен!</span>")

	else if(isliving(target))
		var/mob/living/M = target
		if(M.stat == DEAD)
			return
		if(chassis.occupant.a_intent == INTENT_HARM)
			if(real_clamp)
				M.take_overall_damage(dam_force)
				if(!M)
					return
				M.adjustOxyLoss(round(dam_force/2))
				M.updatehealth()
				target.visible_message("<span class='danger'>[chassis] уничтожает [target] с неимоверной жестокостью!</span>", \
									"<span class='userdanger'>[chassis] уничтожает тебя с неимоверной жестокостью!</span>")
				log_combat(chassis.occupant, M, "attacked", "[name]", "(INTENT: [uppertext(chassis.occupant.a_intent)]) (DAMTYPE: [uppertext(damtype)])")
			else
				target.visible_message("<span class='danger'>[chassis] уничтожает [target] с неимоверной жестокостью!</span>", \
									"<span class='userdanger'>[chassis] уничтожает тебя с неимоверной жестокостью!</span>")
		else if(chassis.occupant.a_intent == INTENT_DISARM)
			if(real_clamp)
				var/mob/living/carbon/C = target
				var/play_sound = FALSE
				var/limbs_gone = ""
				var/obj/item/bodypart/affected = C.get_bodypart(BODY_ZONE_L_ARM)
				if(affected != null)
					affected.dismember(damtype)
					play_sound = TRUE
					limbs_gone = ", [affected]"
				affected = C.get_bodypart(BODY_ZONE_R_ARM)
				if(affected != null)
					affected.dismember(damtype)
					play_sound = TRUE
					limbs_gone = "[limbs_gone], [affected]"
				if(play_sound)
					playsound(src, get_dismember_sound(), 80, TRUE)
					target.visible_message(
						"<span class='danger'>[chassis] отрывает руки [target]!</span>",
						"<span class='userdanger'>[chassis] отрывает твои руки!</span>"
					)
					log_combat(chassis.occupant, M, "dismembered of[limbs_gone],", "[name]", "(INTENT: [uppertext(chassis.occupant.a_intent)]) (DAMTYPE: [uppertext(damtype)])")
			else
				target.visible_message(
					"<span class='danger'>[chassis] отрывает руки [target]!</span>",
					"<span class='userdanger'>[chassis] отрывает твои руки!</span>"
				)
		else
			step_away(M,chassis)
			target.visible_message(
				"<span class='danger'>[chassis] швыряет [target] как комок бумаги!</span>",
				"<span class='userdanger'>[chassis] швыряет тебя как комок бумаги!</span>"
			)
		return 1



/obj/item/mecha_parts/mecha_equipment/extinguisher
	name = "exosuit extinguisher"
	desc = "Оборудование для инженерных экзоскелетов. Быстродействующий огнетушитель большой мощности."
	icon_state = "mecha_exting"
	equip_cooldown = 5
	energy_drain = 0
	range = MECHA_MELEE|MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/extinguisher/Initialize()
	. = ..()
	create_reagents(1000)
	reagents.add_reagent(/datum/reagent/water, 1000)

/obj/item/mecha_parts/mecha_equipment/extinguisher/action(atom/target) //copypasted from extinguisher. TODO: Rewrite from scratch.
	if(!action_checks(target) || get_dist(chassis, target)>3)
		return

	if(istype(target, /obj/structure/reagent_dispensers/watertank) && get_dist(chassis,target) <= 1)
		var/obj/structure/reagent_dispensers/watertank/WT = target
		WT.reagents.trans_to(src, 1000)
		occupant_message("<span class='notice'>Огнетушитель перезаряжен.</span>")
		playsound(chassis, 'sound/effects/refill.ogg', 50, TRUE, -6)
	else
		if(reagents.total_volume > 0)
			playsound(chassis, 'sound/effects/extinguish.ogg', 75, TRUE, -3)
			var/direction = get_dir(chassis,target)
			var/turf/T = get_turf(target)
			var/turf/T1 = get_step(T,turn(direction, 90))
			var/turf/T2 = get_step(T,turn(direction, -90))

			var/list/the_targets = list(T,T1,T2)
			spawn(0)
				for(var/a=0, a<5, a++)
					var/obj/effect/particle_effect/water/W = new /obj/effect/particle_effect/water(get_turf(chassis))
					if(!W)
						return
					var/turf/my_target = pick(the_targets)
					var/datum/reagents/R = new/datum/reagents(5)
					W.reagents = R
					R.my_atom = W
					reagents.trans_to(W,1, transfered_by = chassis.occupant)
					for(var/b=0, b<4, b++)
						if(!W)
							return
						step_towards(W,my_target)
						if(!W)
							return
						var/turf/W_turf = get_turf(W)
						W.reagents.expose(W_turf)
						for(var/atom/atm in W_turf)
							W.reagents.expose(atm)
						if(W.loc == my_target)
							break
						sleep(2)
		return 1

/obj/item/mecha_parts/mecha_equipment/extinguisher/get_equip_info()
	return "[..()] \[[src.reagents.total_volume]\]"

/obj/item/mecha_parts/mecha_equipment/extinguisher/can_attach(obj/mecha/working/M as obj)
	if(..())
		if(istype(M))
			return 1
	return 0



/obj/item/mecha_parts/mecha_equipment/rcd
	name = "mounted RCD"
	desc = "Устройство быстрого конструирования, устанавливаемое на экзоскелет."
	icon_state = "mecha_rcd"
	equip_cooldown = 10
	energy_drain = 250
	range = MECHA_MELEE|MECHA_RANGED
	item_flags = NO_MAT_REDEMPTION
	var/mode = 0 //0 - deconstruct, 1 - wall or floor, 2 - airlock.

/obj/item/mecha_parts/mecha_equipment/rcd/Initialize()
	. = ..()
	GLOB.rcd_list += src

/obj/item/mecha_parts/mecha_equipment/rcd/Destroy()
	GLOB.rcd_list -= src
	return ..()

/obj/item/mecha_parts/mecha_equipment/rcd/action(atom/target)
	if(istype(target, /turf/open/space/transit))//>implying these are ever made -Sieve
		return

	if(!isturf(target) && !istype(target, /obj/machinery/door/airlock))
		target = get_turf(target)
	if(!action_checks(target) || get_dist(chassis, target)>3)
		return
	playsound(chassis, 'sound/machines/click.ogg', 50, TRUE)

	switch(mode)
		if(0)
			if(iswallturf(target))
				var/turf/closed/wall/W = target
				occupant_message("<span class='notice'>Разбираем [W]...</span>")
				if(do_after_cooldown(W))
					chassis.spark_system.start()
					W.ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
					playsound(W, 'sound/items/deconstruct.ogg', 50, TRUE)
			else if(isfloorturf(target))
				var/turf/open/floor/F = target
				occupant_message("<span class='notice'>Разбираем [F]...</span>")
				if(do_after_cooldown(target))
					chassis.spark_system.start()
					F.ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
					playsound(F, 'sound/items/deconstruct.ogg', 50, TRUE)
			else if (istype(target, /obj/machinery/door/airlock))
				occupant_message("<span class='notice'>Разбираем [target]...</span>")
				if(do_after_cooldown(target))
					chassis.spark_system.start()
					qdel(target)
					playsound(target, 'sound/items/deconstruct.ogg', 50, TRUE)
		if(1)
			if(isspaceturf(target))
				var/turf/open/space/S = target
				occupant_message("<span class='notice'>Строим пол...</span>")
				if(do_after_cooldown(S))
					S.PlaceOnTop(/turf/open/floor/plating, flags = CHANGETURF_INHERIT_AIR)
					playsound(S, 'sound/items/deconstruct.ogg', 50, TRUE)
					chassis.spark_system.start()
			else if(isfloorturf(target))
				var/turf/open/floor/F = target
				occupant_message("<span class='notice'>Строим стену...</span>")
				if(do_after_cooldown(F))
					F.PlaceOnTop(/turf/closed/wall)
					playsound(F, 'sound/items/deconstruct.ogg', 50, TRUE)
					chassis.spark_system.start()
		if(2)
			if(isfloorturf(target))
				occupant_message("<span class='notice'>Строим шлюз...</span>")
				if(do_after_cooldown(target))
					chassis.spark_system.start()
					var/obj/machinery/door/airlock/T = new /obj/machinery/door/airlock(target)
					T.autoclose = TRUE
					playsound(target, 'sound/items/deconstruct.ogg', 50, TRUE)
					playsound(target, 'sound/effects/sparks2.ogg', 50, TRUE)



/obj/item/mecha_parts/mecha_equipment/rcd/do_after_cooldown(atom/target)
	. = ..()

/obj/item/mecha_parts/mecha_equipment/rcd/Topic(href,href_list)
	..()
	if(href_list["mode"])
		mode = text2num(href_list["mode"])
		switch(mode)
			if(0)
				occupant_message("<span class='notice'>RCD переключен в режим разбора.</span>")
				energy_drain = initial(energy_drain)
			if(1)
				occupant_message("<span class='notice'>RCD переключен в режим постройки.</span>")
				energy_drain = 2*initial(energy_drain)
			if(2)
				occupant_message("<span class='notice'>RCD переключен в режим пострйоки шлюза.</span>")
				energy_drain = 2*initial(energy_drain)
	return

/obj/item/mecha_parts/mecha_equipment/rcd/get_equip_info()
	return "[..()] \[<a href='?src=[REF(src)];mode=0'>D</a>|<a href='?src=[REF(src)];mode=1'>C</a>|<a href='?src=[REF(src)];mode=2'>A</a>\]"

//WS Edit Begin - Readded from Smartwire Revert
/obj/item/mecha_parts/mecha_equipment/cable_layer
	name = "cable layer"
	desc = "Оборудование для проектирования экзоскелетов. Прокладывает кабель вдоль траектории движения экзоскелета."
	icon_state = "mecha_wire"
	var/datum/callback/event
	var/turf/old_turf
	var/obj/structure/cable/last_piece
	var/obj/item/stack/cable_coil/cable
	var/max_cable = 1000

/obj/item/mecha_parts/mecha_equipment/cable_layer/Initialize()
	. = ..()
	cable = new(src, 0)

/obj/item/mecha_parts/mecha_equipment/cable_layer/can_attach(obj/mecha/working/M)
	if(..())
		if(istype(M))
			return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/cable_layer/attach()
	..()
	event = chassis.events.addEvent("onMove", CALLBACK(src, PROC_REF(layCable)))
	return

/obj/item/mecha_parts/mecha_equipment/cable_layer/detach()
	chassis.events.clearEvent("onMove",event)
	return ..()

/obj/item/mecha_parts/mecha_equipment/cable_layer/Destroy()
	if(chassis)
		chassis.events.clearEvent("onMove",event)
	return ..()

/obj/item/mecha_parts/mecha_equipment/cable_layer/action(obj/item/stack/cable_coil/target)
	if(!action_checks(target))
		return
	if(istype(target) && target.amount)
		var/cur_amount = cable? cable.amount : 0
		var/to_load = max(max_cable - cur_amount,0)
		if(to_load)
			to_load = min(target.amount, to_load)
			if(!cable)
				cable = new(src, 0)
			cable.amount += to_load
			target.use(to_load)
			occupant_message("<span class='notice'>[to_load] метров проводов успешно загружено.</span>")
			send_byjax(chassis.occupant,"exosuit.browser","[REF(src)]",src.get_equip_info())
		else
			occupant_message("<span class='warning'>Катушка заполнена.</span>")
	else
		occupant_message("<span class='warning'>Невозможно загрузить [target] - не найдено проводов.</span>")


/obj/item/mecha_parts/mecha_equipment/cable_layer/Topic(href,href_list)
	..()
	if(href_list["toggle"])
		set_ready_state(!equip_ready)
		occupant_message("[src] [equip_ready?"Выключен":"Включен"].")
		log_message("[equip_ready?"Выключен":"Включен"].", LOG_MECHA)
		return
	if(href_list["cut"])
		if(cable && cable.amount)
			var/m = round(input(chassis.occupant,"Пожалуйста, укажите длину провода, который нужно отрезать","Отрезать провод",min(cable.amount,30)) as num, 1)
			m = min(m, cable.amount)
			if(m)
				use_cable(m)
				new /obj/item/stack/cable_coil(get_turf(chassis), m)
		else
			occupant_message("В катушке больше нет проводов.")
	return

/obj/item/mecha_parts/mecha_equipment/cable_layer/get_equip_info()
	var/output = ..()
	if(output)
		return "[output] \[Провод: [cable ? cable.amount : 0] m\][(cable && cable.amount) ? "- <a href='?src=[REF(src)];toggle=1'>[!equip_ready?"Выключен":"Включен"]</a>|<a href='?src=[REF(src)];cut=1'>Cut</a>" : null]"
	return

/obj/item/mecha_parts/mecha_equipment/cable_layer/proc/use_cable(amount)
	if(!cable || cable.amount<1)
		set_ready_state(1)
		occupant_message("Провода исчерпаны, [src] выключен.")
		log_message("Провода исчерпаны, [src] выключен.", LOG_MECHA)
		return
	if(cable.amount < amount)
		occupant_message("не хватает проводов чтобы завершить задачу.")
		return
	cable.use(amount)
	update_equip_info()
	return 1

/obj/item/mecha_parts/mecha_equipment/cable_layer/proc/reset()
	last_piece = null

/obj/item/mecha_parts/mecha_equipment/cable_layer/proc/dismantleFloor(turf/new_turf)
	if(isfloorturf(new_turf))
		var/turf/open/floor/T = new_turf
		if(!isplatingturf(T))
			if(!T.broken && !T.burnt)
				new T.floor_tile(T)
			T.make_plating()
	return !new_turf.intact

/obj/item/mecha_parts/mecha_equipment/cable_layer/proc/layCable(turf/new_turf)
	if(equip_ready || !istype(new_turf) || !dismantleFloor(new_turf))
		return reset()
	var/fdirn = turn(chassis.dir,180)
	for(var/obj/structure/cable/LC in new_turf)		// check to make sure there's not a cable there already
		if(LC.d1 == fdirn || LC.d2 == fdirn)
			return reset()
	if(!use_cable(1))
		return reset()
	var/obj/structure/cable/NC = new(new_turf, "red")
	NC.d1 = 0
	NC.d2 = fdirn
	NC.update_appearance()

	var/datum/powernet/PN
	if(last_piece && last_piece.d2 != chassis.dir)
		last_piece.d1 = min(last_piece.d2, chassis.dir)
		last_piece.d2 = max(last_piece.d2, chassis.dir)
		last_piece.update_appearance()
		PN = last_piece.powernet

	if(!PN)
		PN = new()
		GLOB.powernets += PN
	NC.powernet = PN
	PN.cables += NC
	NC.mergeConnectedNetworks(NC.d2)

	//NC.mergeConnectedNetworksOnTurf()
	last_piece = NC
	return 1
//WS Edit End - Readded from Smartwire Revert

//Dunno where else to put this so shrug
/obj/item/mecha_parts/mecha_equipment/conversion_kit
	name = "Mecha Conversion Kit"
	desc = "Совершенно универсальный комплект для переоборудования совершенно обычного меха. Как ты вообще это раздобыл?"
	icon_state = "ripleyupgrade"
	var/source_mech = list(null) //must be a list due to the mining ripley existing
	var/result_mech = null

/obj/item/mecha_parts/mecha_equipment/conversion_kit/can_attach(obj/mecha/M)
	if (!(M.type in source_mech))
		to_chat(loc, "<span class='warning'>Данный комплект для переоборудования не может быть применен к данной модели.</span>")
		return FALSE
	if(M.type == /obj/mecha/working/ripley)
		var/obj/mecha/working/ripley/R = M
		if(R.cargo.len)
			to_chat(loc, "<span class='warning'>Грузовой отсек  [R] должен быть пуст, прежде чем можно будет использовать этот комплект для переоборудования.</span>")
			return FALSE
	if(!M.maint_access) //non-removable upgrade, so lets make sure the pilot or owner has their say.
		to_chat(loc, "<span class='warning'>Для использования этого комплекта преобразования у [M] должны быть активны протоколы технического обслуживания.</span>")
		return FALSE
	if(M.occupant) //We're actually making a new mech and swapping things over, it might get weird if players are involved
		to_chat(loc, "<span class='warning'>Перед применением этого комплекта для переоборудования [M] должен быть свободен.</span>")
		return FALSE
	if(!M.cell) //Turns out things break if the cell is missing
		to_chat(loc, "<span class='warning'>Для процесса преобразования требуется установленная энергоячейка.</span>")
		return FALSE
	return TRUE

/obj/item/mecha_parts/mecha_equipment/conversion_kit/attach(obj/mecha/M)
	var/obj/mecha/N = new result_mech(get_turf(M),1)
	if(!N)
		return
	QDEL_NULL(N.cell)
	if (M.cell)
		N.cell = M.cell
		M.cell.forceMove(N)
		M.cell = null
	QDEL_NULL(N.scanmod)
	if (M.scanmod)
		N.scanmod = M.scanmod
		M.scanmod.forceMove(N)
		M.scanmod = null
	QDEL_NULL(N.capacitor)
	if (M.capacitor)
		N.capacitor = M.capacitor
		M.capacitor.forceMove(N)
		M.capacitor = null
	N.update_part_values()
	for(var/obj/item/mecha_parts/E in M.contents)
		if(istype(E, /obj/item/mecha_parts/concealed_weapon_bay)) //why is the bay not just a variable change who did this
			E.forceMove(N)
	for(var/obj/item/mecha_parts/mecha_equipment/E in M.equipment) //Move the equipment over...
		E.detach()
		E.attach(N)
		M.equipment -= E
	N.dna_lock = M.dna_lock
	N.maint_access = M.maint_access
	N.strafe = M.strafe
	N.obj_integrity = M.obj_integrity //This is not a repair tool
	M.wreckage = 0
	qdel(M)
	playsound(get_turf(N),'sound/items/ratchet.ogg',50,TRUE)
	return

/obj/item/mecha_parts/mecha_equipment/conversion_kit/ripley
	name = "Ripley MK-II Conversion Kit"
	desc = "Комплект крепления навесного оборудования для автономного силового погрузчика 'Рипли' MK-I, позволяющий преобразовать его в более медленную, но компактную конструкцию MK-II. Этот набор нельзя снять после его применения."
	icon_state = "ripleyupgrade"
	source_mech = list(/obj/mecha/working/ripley, /obj/mecha/working/ripley/mining)
	result_mech = /obj/mecha/working/ripley/mkii

/obj/item/mecha_parts/mecha_equipment/conversion_kit/ripley/clip
	name = "CLIP Ripley MK-IV Conversion Kit"
	desc = "Изготовленный на заказ легкий навесной комплект CMM для автономного силового погрузчика 'Рипли' MK-I, позволяющий преобразовать его в мобильную и вместительную конструкцию Mk-IV. Этот набор нельзя снять после его применения."
	icon_state = "clipupgrade"
	source_mech = list(/obj/mecha/working/ripley, /obj/mecha/working/ripley/mining)
	result_mech = /obj/mecha/working/ripley/clip

/obj/item/mecha_parts/mecha_equipment/conversion_kit/paladin
	name = "CLIP Paladin Conversion Kit"
	desc = "Изготовленный на заказ комплект для переоборудования боевого экзоскелета Дюранда в специализированный экзоскелет Паладина против ксенофауны."
	icon_state = "clipupgrade"
	source_mech = list(/obj/mecha/combat/durand)
	result_mech = /obj/mecha/combat/durand/clip
