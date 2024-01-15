// Syndicate melee kit
/obj/item/storage/backpack/messenger/event/syndicate/meleekit
	name = "syndicate messanger bag"
	desc = "A suspicious looking messanger bag."
	icon = 'icons/obj/storage.dmi'
	icon_state = "courierbagsec"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "satchel-sec"

/obj/item/storage/backpack/messenger/event/syndicate/meleekit/PopulateContents()
	new /obj/item/melee/transforming/energy/sword/saber(src)
	new /obj/item/melee/transforming/energy/sword/saber(src)
	new /obj/item/melee/transforming/energy/sword/saber(src)
	new /obj/item/shield/energy(src)
	new /obj/item/shield/energy(src)
	new /obj/item/shield/energy(src)

// Red weapon kit crate, AP
/obj/structure/closet/crate/syndicate/event/apkit
	name = "red weapon crate kit"
	desc = "A rectangular steel crate."
	icon = 'icons/obj/crates.dmi'
	icon_state = "weaponcrate"

/obj/structure/closet/crate/syndicate/event/apkit/PopulateContents()
	..()
	new /obj/item/gun/ballistic/automatic/ebr(src)
	new /obj/item/gun/ballistic/automatic/ebr(src)
	new /obj/item/ammo_box/magazine/ebr(src)
	new /obj/item/ammo_box/magazine/ebr(src)
	new /obj/item/ammo_box/a308 (src)
	new /obj/item/ammo_box/a308 (src)
	new /obj/item/gun/ballistic/automatic/pistol/tec9 (src)
	new /obj/item/gun/ballistic/automatic/pistol/tec9 (src)
	new /obj/item/gun/ballistic/automatic/pistol/tec9 (src)
	new /obj/item/ammo_box/magazine/tec9 (src)
	new /obj/item/ammo_box/magazine/tec9 (src)
	new /obj/item/ammo_box/magazine/tec9 (src)
	new /obj/item/ammo_box/c9mm/ap (src)
	new /obj/item/ammo_box/c9mm/ap (src)
	new /obj/item/ammo_box/c9mm/ap (src)

// Combat shotgun kit
/obj/item/storage/backpack/duffelbag/syndie/event/shotgunkit
	name = "suspicious looking duffel bag"
	desc = "A large duffel bag for holding extra tactical supplies. Items inside looked smaller until you took them out."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-syndieammo"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-syndieammo"

/obj/item/storage/backpack/duffelbag/syndie/event/shotgunkit/PopulateContents()
	..()
	new /obj/item/gun/ballistic/shotgun/automatic/combat(src)
	new /obj/item/gun/ballistic/shotgun/automatic/combat(src)
	new /obj/item/gun/ballistic/shotgun/automatic/combat(src)
	new /obj/item/ammo_box/a12g(src)
	new /obj/item/ammo_box/a12g(src)
	new /obj/item/ammo_box/a12g(src)

// Bulldog shotgun kit
/obj/structure/closet/crate/event/syndicate/ashotgunkit
	name = "advanced shotgun kit"
	desc = "A rectangular steel crate."
	icon = 'icons/obj/crates.dmi'
	icon_state = "weaponcrate"

/obj/structure/closet/crate/event/syndicate/ashotgunkit/PopulateContents()
	..()
	new /obj/item/gun/ballistic/shotgun/bulldog(src)
	new /obj/item/gun/ballistic/shotgun/bulldog(src)
	new /obj/item/ammo_box/magazine/m12g(src)
	new /obj/item/ammo_box/magazine/m12g(src)
	new /obj/item/ammo_box/a12g(src)
	new /obj/item/ammo_box/a12g(src)
	new /obj/item/ammo_box/a12g(src)
	new /obj/item/ammo_box/a12g(src)

// Syndiecate red rig
/obj/structure/closet/event/syndicate/rigkit
	name = "hardsuit storage"
	desc = "Why is this here?"
	icon_state = "syndicate"

/obj/structure/closet/event/syndicate/rigkit/PopulateContents()
	..()
	new /obj/item/clothing/suit/space/hardsuit/syndi(src)
	new /obj/item/clothing/suit/space/hardsuit/syndi(src)

// Syndicate elite red rig
/obj/structure/closet/event/syndicate/arigkit
	name = "elite hardsuit storage"
	desc = "Why is this here?"
	icon_state = "syndicate"

/obj/structure/closet/event/syndicate/arigkit/PopulateContents()
	..()
	new /obj/item/clothing/suit/space/hardsuit/syndi/elite/oldsst(src)

// Syndicate smg kit
/obj/structure/closet/crate/event/syndicate/smgkit
	name = "SMG crate kit"
	desc = "A rectangular steel crate."
	icon = 'icons/obj/crates.dmi'
	icon_state = "weaponcrate"

/obj/structure/closet/crate/event/syndicate/smgkit/PopulateContents()
	..()
	new /obj/item/gun/ballistic/automatic/smg/c20r(src)
	new /obj/item/gun/ballistic/automatic/smg/c20r(src)
	new /obj/item/ammo_box/magazine/smgm45(src)
	new /obj/item/ammo_box/magazine/smgm45(src)
	new /obj/item/ammo_box/c45(src)
	new /obj/item/ammo_box/c45(src)
	new /obj/item/gun/ballistic/automatic/smg/m90(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/a556_box (src)

// Syndicate assault kit
/obj/structure/closet/crate/event/syndicate/assaultkit
	name = "assault crate kit"
	desc = "A rectangular steel crate."
	icon = 'icons/obj/crates.dmi'
	icon_state = "weaponcrate"

/obj/structure/closet/crate/event/syndicate/assaultkit/PopulateContents()
	..()
	new /obj/item/gun/ballistic/automatic/smg/m90(src)
	new /obj/item/gun/ballistic/automatic/smg/m90(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/magazine/m556(src)
	new /obj/item/ammo_box/a556_box(src)
	new /obj/item/ammo_box/a556_box(src)
	new /obj/item/gun/ballistic/automatic/hmg/l6_saw(src)
	new /obj/item/ammo_box/magazine/mm712x82(src)

// Mech durant large crate
/obj/structure/closet/crate/large/event/durandcrate
	name = "Large mech crate"
	desc = "A hefty wooden crate with a strange red snake on it. You'll need a crowbar to get it open."
	icon = 'icons/obj/storage.dmi'
	icon_state = "giftdeliverypackage3"
	material_drop_amount = 0

/obj/structure/closet/crate/large/event/durandcrate/PopulateContents()
	..()
	new /obj/mecha/combat/durand(src)

// Ballistic mech equipment kit
/obj/item/storage/backpack/duffelbag/syndie/event/mechbulletkit
	name = "suspicious looking duffel bag"
	desc = "A large duffel bag for holding extra tactical supplies. Items inside looked smaller until you took them out."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-syndieammo"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-syndieammo"

/obj/item/storage/backpack/duffelbag/syndie/event/mechbulletkit/PopulateContents()
	..()
	new /obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster(src)
	new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay(src)
	new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/carbine(src)
	new /obj/item/mecha_ammo/incendiary(src)

// Laser mech equipment kit
/obj/item/storage/backpack/duffelbag/syndie/event/mechlaserkit
	name = "suspicious looking duffel bag"
	desc = "A large duffel bag for holding extra tactical supplies. Items inside looked smaller until you took them out."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-syndieammo"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-syndieammo"

/obj/item/storage/backpack/duffelbag/syndie/event/mechlaserkit/PopulateContents()
	..()
	new /obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster(src)
	new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay(src)
	new /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy(src)

// Grenade mech equipment kit
/obj/item/storage/backpack/duffelbag/syndie/event/event/mechgrenadekit
	name = "suspicious looking duffel bag"
	desc = "A large duffel bag for holding extra tactical supplies. Items inside looked smaller until you took them out."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-syndieammo"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-syndieammo"

/obj/item/storage/backpack/duffelbag/syndie/event/event/mechgrenadekit/PopulateContents()
	..()
	new /obj/item/mecha_parts/mecha_equipment/antiproj_armor_booster(src)
	new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay(src)
	new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/breaching(src)
	new /obj/item/mecha_ammo/missiles_br(src)
	new /obj/item/mecha_ammo/missiles_br(src)
	new /obj/item/mecha_ammo/missiles_br(src)

// Mech repair equipment kit
/obj/item/storage/backpack/duffelbag/syndie/event/mechrepairkit
	name = "suspicious looking industrial duffel bag"
	desc = "A large duffel bag for holding extra industrial supplies. There is still an orange paint on it."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-eng"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-eng"

/obj/item/storage/backpack/duffelbag/syndie/event/mechrepairkit/PopulateContents()
	..()
	new /obj/item/clothing/head/welding(src)
	new /obj/item/clothing/head/welding(src)
	new /obj/item/clothing/glasses/welding(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/mecha_parts/mecha_equipment/repair_droid(src)

// Building equipment kit
/obj/item/storage/backpack/duffelbag/syndie/event/buildkit
	name = "suspicious looking industrial duffel bag"
	desc = "A large duffel bag for holding extra industrial supplies. There is still an orange paint on it."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-eng"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-eng"

/obj/item/storage/backpack/duffelbag/syndie/event/buildkit/PopulateContents()
	..()
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/stack/sheet/mineral/wood/fifty(src)
	new /obj/item/construction/rcd/combat(src)
	new /obj/item/stack/sheet/glass/fifty(src)
	new /obj/item/stack/sheet/metal/fifty(src)

// Advanced Building equipment kit
/obj/structure/closet/crate/event/syndie/abuildkit
	name = "advanced building crate kit"
	desc = "An industrial crate with supplies for building defenses."
	icon = 'icons/obj/crates.dmi'
	icon_state = "engi_crate"

/obj/structure/closet/crate/event/syndie/abuildkit/PopulateContents()
	..()
	new /obj/item/storage/backpack/duffelbag/engineering(src)
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/construction/rcd/combat(src)
	new /obj/item/construction/rcd/combat(src)
	new /obj/item/stack/sheet/mineral/wood/fifty(src)
	new /obj/item/stack/sheet/mineral/wood/fifty(src)
	new /obj/item/stack/sheet/glass/fifty(src)
	new /obj/item/stack/sheet/glass/fifty(src)
	new /obj/item/stack/sheet/metal/fifty(src)
	new /obj/item/stack/sheet/metal/fifty(src)
	new /obj/item/deployable_turret_folded(src)

// Combat implants kit
/obj/item/storage/backpack/messenger/event/syndicate/implantskit
	name = "syndicate messanger bag"
	desc = "A suspicious looking messanger bag."
	icon = 'icons/obj/storage.dmi'
	icon_state = "courierbagsec"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "satchel-sec"

/obj/item/storage/backpack/messenger/event/syndicate/implantskit/PopulateContents()
	new /obj/item/storage/box/cyber_implants(src)
	new /obj/item/storage/box/cyber_implants(src)

// Surgery kit
/obj/item/storage/backpack/duffelbag/syndie/event/surgerykit
	name = "suspicious looking industrial duffel bag"
	desc = "A large duffel bag for holding extra industrial supplies. There is still an orange paint on it."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-syndiemed"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-syndiemed"

/obj/item/storage/backpack/duffelbag/syndie/event/surgerykit/PopulateContents()
	..()
	new /obj/item/scalpel(src)
	new /obj/item/hemostat(src)
	new /obj/item/retractor(src)
	new /obj/item/circular_saw(src)
	new /obj/item/surgicaldrill(src)
	new /obj/item/cautery(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/healthanalyzer(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/roller(src)

// Advanced Surgery kit
/obj/item/storage/backpack/duffelbag/syndie/event/asurgerykit
	name = "suspicious looking medical duffel bag"
	desc = "A large duffel bag for holding extra medical supplies."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-syndiemed"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-syndiemed"

/obj/item/stack/rods/two
	amount = 2

/obj/item/stack/sheet/mineral/silver/two
	amount = 2

/obj/item/storage/box/syndie_kit/event/silvertable
	name = "operating table building kit"

/obj/item/storage/box/syndie_kit/event/silvertable/PopulateContents()
	..()
	new /obj/item/stack/rods/two(src)
	new /obj/item/stack/sheet/mineral/silver/two(src)
	new /obj/item/wrench/syndie(src)

/obj/item/storage/backpack/duffelbag/syndie/event/asurgerykit/PopulateContents()
	..()
	new /obj/item/surgicaldrill/advanced(src)
	new /obj/item/scalpel/advanced(src)
	new /obj/item/retractor/advanced(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/roller(src)
	new /obj/item/healthanalyzer/advanced(src)
	new /obj/item/storage/box/syndie_kit/event/silvertable(src)

//Search and resque kit
/obj/item/storage/backpack/duffelbag/syndie/event/paramedkit
	name = "suspicious looking medical duffel bag"
	desc = "A large duffel bag for holding extra medical supplies."
	icon = 'icons/obj/storage.dmi'
	icon_state = "duffel-syndiemed"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	item_state = "duffel-syndiemed"

/obj/item/storage/backpack/duffelbag/syndie/event/paramedkit/PopulateContents()
	..()
	new /obj/item/clothing/gloves/color/latex/nitrile/evil(src)
	new /obj/item/clothing/glasses/hud/health/sunglasses(src)
	new /obj/item/gun/medbeam(src)
	new /obj/item/reagent_containers/hypospray/medipen/atropine(src)
	new /obj/item/storage/box/bodybags(src)
	new /obj/item/storage/box/syndie_kit/event/paramedpenkit(src)
	new /obj/item/storage/box/syndie_kit/event/stimkit(src)

//Medipens kit
/obj/item/storage/box/syndie_kit/event/paramedpenkit
	name = "emergency medipens"

/obj/item/storage/box/syndie_kit/event/paramedpenkit/PopulateContents()
	..()
	new /obj/item/reagent_containers/hypospray/medipen/salacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/salacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/oxandrolone(src)
	new /obj/item/reagent_containers/hypospray/medipen/oxandrolone(src)
	new /obj/item/reagent_containers/hypospray/medipen/survival(src)
	new /obj/item/reagent_containers/hypospray/medipen/bonefixingjuice(src)
	new /obj/item/reagent_containers/hypospray/medipen/atropine(src)

//Stimulants kit
/obj/item/storage/box/syndie_kit/event/stimkit
	name = "stimpacks kit"

/obj/item/storage/box/syndie_kit/event/stimkit/PopulateContents()
	..()
	new /obj/item/reagent_containers/hypospray/medipen/stimpack(src)
	new /obj/item/reagent_containers/hypospray/medipen/pumpup(src)

// Basic firsaid kit
/obj/structure/closet/crate/event/syndie/firsaidkit
	name = "first aid kit"
	desc = "An industrial crate with supplies for medical needs."
	icon = 'icons/obj/crates.dmi'
	icon_state = "medicalcrate"

/obj/structure/closet/crate/event/syndie/firsaidkit/PopulateContents()
	..()
	new /obj/item/storage/firstaid/brute(src)
	new /obj/item/storage/firstaid/brute(src)
	new /obj/item/storage/firstaid/fire(src)
	new /obj/item/storage/firstaid/fire(src)
	new /obj/item/storage/firstaid/o2(src)
