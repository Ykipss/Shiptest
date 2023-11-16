/* Kitchen tools
 * Contains:
 *		Fork
 *		Kitchen knives
 *		Ritual Knife
 *		Butcher's cleaver
 *		Combat Knife
 *		Rolling Pins
 *		Plastic Utensils
 */

/obj/item/kitchen
	icon = 'icons/obj/kitchen.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'

/obj/item/kitchen/fork
	name = "fork"
	desc = "Остренькое."
	icon_state = "fork"
	force = 5
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	throw_speed = 3
	throw_range = 5
	custom_materials = list(/datum/material/iron=80)
	flags_1 = CONDUCT_1
	attack_verb = list("attacked", "stabbed", "poked")
	hitsound = 'sound/weapons/bladeslice.ogg'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)
	item_flags = EYE_STAB
	var/datum/reagent/forkload //used to eat omelette

/obj/item/kitchen/fork/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(!istype(M))
		return ..()

	if(forkload)
		if(M == user)
			M.visible_message("<span class='notice'>[user] eats a delicious forkful of omelette!</span>")
			M.reagents.add_reagent(forkload.type, 1)
		else
			M.visible_message("<span class='notice'>[user] feeds [M] a delicious forkful of omelette!</span>")
			M.reagents.add_reagent(forkload.type, 1)
		icon_state = "fork"
		forkload = null
	else
		return ..()

/obj/item/kitchen/fork/plastic
	name = "plastic fork"
	desc = "Возвращет тебя в школьные годы.."
	icon_state = "plastic_fork"
	force = 0
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	custom_materials = list(/datum/material/plastic=80)
	custom_price = 50
	var/break_chance = 25

/obj/item/kitchen/fork/plastic/afterattack(mob/living/carbon/user)
	.=..()
	if(prob(break_chance))
		user.visible_message("<span class='danger'>[user]'s fork snaps into tiny pieces in their hand.</span>")
		qdel(src)

/obj/item/kitchen/knife
	name = "kitchen knife"
	icon_state = "knife"
	item_state = "knife"
	desc = "Универсальный поварской нож производства SpaceCook Incorporated. Гарантированно останется острым долгие годы."
	pickup_sound =  'sound/items/handling/knife1_pickup.ogg'
	drop_sound = 'sound/items/handling/knife3_drop.ogg'
	flags_1 = CONDUCT_1
	force = 10
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 10
	hitsound = 'sound/weapons/bladeslice.ogg'
	throw_speed = 3
	throw_range = 6
	custom_materials = list(/datum/material/iron=12000)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	sharpness = IS_SHARP_ACCURATE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	item_flags = EYE_STAB
	var/bayonet = FALSE	//Can this be attached to a gun?
	custom_price = 250

/obj/item/kitchen/knife/ComponentInitialize()
	. = ..()
	set_butchering()

///Adds the butchering component, used to override stats for special cases
/obj/item/kitchen/knife/proc/set_butchering()
	AddComponent(/datum/component/butchering, 80 - force, 100, force - 10) //bonus chance increases depending on force

/obj/item/kitchen/knife/plastic
	name = "plastic knife"
	icon_state = "plastic_knife"
	item_state = "knife"
	desc = "Очень безопасный, едва заточенный нож из пластика. Хорош для нарезки продуктов и не более того."
	force = 0
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	throw_range = 5
	custom_materials = list(/datum/material/plastic = 100)
	attack_verb = list("prodded", "whiffed","scratched", "poked")
	sharpness = IS_SHARP
	custom_price = 50
	var/break_chance = 25

/obj/item/kitchen/knife/plastic/afterattack(mob/living/carbon/user)
	.=..()
	if(prob(break_chance))
		user.visible_message("<span class='danger'>[user]'s knife snaps into tiny pieces in their hand.</span>")
		qdel(src)

/obj/item/kitchen/knife/pizza_cutter
	name = "pizza cutter"
	icon_state = "pizza_cutter"
	desc = "Лезвие ножа изогнуто по кругу с использованием силы науки. Идеально подходит для безопасной нарезки пиццы."
	force = 1
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 1
	throw_range = 6
	custom_materials = list(/datum/material/iron=4000)
	attack_verb = list("prodded", "whiffed","rolled", "poked")
	sharpness = IS_SHARP

/obj/item/kitchen/knife/ritual
	name = "ritual knife"
	desc = "Неземные энергии, которые когда-то питали этот клинок, теперь дремлют."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/kitchen/knife/bloodletter
	name = "bloodletter"
	desc = "Кинжал оккультного вида, холодный на ощупь. Каким-то образом безупречный шар на рукояти полностью сделан из жидкой крови."
	icon = 'icons/obj/ice_moon/artifacts.dmi'
	icon_state = "bloodletter"
	w_class = WEIGHT_CLASS_NORMAL
	var/bleed_stacks_per_hit = 3

/obj/item/kitchen/knife/bloodletter/attack(mob/living/M, mob/living/carbon/user)
	. =..()
	if(istype(M) && (M.mob_biotypes & MOB_ORGANIC))
		var/datum/status_effect/stacking/saw_bleed/bloodletting/B = M.has_status_effect(/datum/status_effect/stacking/saw_bleed/bloodletting)
		if(!B)
			M.apply_status_effect(/datum/status_effect/stacking/saw_bleed/bloodletting, bleed_stacks_per_hit)
		else
			B.add_stacks(bleed_stacks_per_hit)

/obj/item/kitchen/knife/butcher
	name = "butcher's cleaver"
	icon_state = "butch"
	item_state = "butch"
	desc = "Огромная штука, используемая для измельчения мяса. Включая клоунов и клоунские субпродукты."
	flags_1 = CONDUCT_1
	force = 15
	throwforce = 10
	custom_materials = list(/datum/material/iron=18000)
	attack_verb = list("cleaved", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	w_class = WEIGHT_CLASS_NORMAL
	custom_price = 600

/obj/item/kitchen/knife/hunting
	name = "hunting knife"
	desc = "Несмотря на свое название, он в основном используется для разделки мяса мертвой добычи, а не для настоящей охоты."
	item_state = "huntingknife"
	icon_state = "huntingknife"

/obj/item/kitchen/knife/hunting/set_butchering()
	AddComponent(/datum/component/butchering, 80 - force, 100, force + 10)

/obj/item/kitchen/knife/combat
	name = "combat knife"
	icon_state = "buckknife"
	desc = "Армейский нож для выживания."
	embedding = list("pain_mult" = 4, "embed_chance" = 65, "fall_chance" = 10, "ignore_throwspeed_threshold" = TRUE)
	force = 20
	throwforce = 20
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "cut")
	bayonet = TRUE

/obj/item/kitchen/knife/combat/survival
	name = "survival knife"
	icon_state = "survivalknife"
	embedding = list("pain_mult" = 4, "embed_chance" = 35, "fall_chance" = 10)
	desc = "Охотничий нож для выживания."
	force = 15
	throwforce = 15
	bayonet = TRUE

/obj/item/kitchen/knife/combat/bone
	name = "bone dagger"
	item_state = "bone_dagger"
	icon_state = "bone_dagger"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	desc = "Заостренная кость. Необходимый минимум для выживания."
	embedding = list("pain_mult" = 4, "embed_chance" = 35, "fall_chance" = 10)
	force = 15
	throwforce = 15
	custom_materials = null

/obj/item/kitchen/knife/combat/cyborg
	name = "cyborg knife"
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "knife_cyborg"
	desc = "Пластиковый нож, установленный киборгом. Чрезвычайно острый и прочный."

/obj/item/kitchen/knife/shiv
	name = "glass shiv"
	icon = 'icons/obj/shards.dmi'
	icon_state = "shiv"
	item_state = "shiv"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	desc = "Самодельная заточка из стекла."
	force = 8
	throwforce = 12
	attack_verb = list("shanked", "shivved")
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	custom_materials = list(/datum/material/glass=400)

/obj/item/kitchen/knife/shiv/carrot
	name = "carrot shiv"
	icon_state = "carrotshiv"
	item_state = "carrotshiv"
	icon = 'icons/obj/kitchen.dmi'
	desc = "В отличие от другой моркови, вам, вероятно, следует держать ее подальше от глаз."
	custom_materials = null

/obj/item/kitchen/rollingpin
	name = "rolling pin"
	desc = "Используеться чтобы вырубить бармена."
	icon_state = "rolling_pin"
	force = 8
	throwforce = 5
	throw_speed = 3
	throw_range = 7
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 1.5)
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "whacked")
	custom_price = 200

/* Trays  moved to /obj/item/storage/bag */

/obj/item/kitchen/spoon/plastic
	name = "plastic spoon"
	desc = "Только будьте осторожны, чтобы ваша еда не расплавила ложку первой."
	icon_state = "plastic_spoon"
	force = 0
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	custom_materials = list(/datum/material/plastic=120)
	custom_price = 50
	var/break_chance = 25

/obj/item/kitchen/knife/plastic/afterattack(mob/living/carbon/user)
	.=..()
	if(prob(break_chance))
		user.visible_message("<span class='danger'>[user]'s spoon snaps into tiny pieces in their hand.</span>")
		qdel(src)
