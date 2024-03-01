/obj/structure/closet/secure_closet/quartermaster
	name = "\proper quartermaster's locker"
	req_access = list(ACCESS_QM)
	icon_state = "qm"

/obj/structure/closet/secure_closet/quartermaster/PopulateContents()
	..()
	new /obj/item/storage/bag/garment/quartermaster(src)
	new /obj/item/stack/tape(src) //WS Edit - Tape
	new /obj/item/storage/lockbox/medal/cargo(src)
	new /obj/item/radio/headset/headset_cargo(src)
	new /obj/item/megaphone/cargo(src)
	new /obj/item/tank/internals/emergency_oxygen(src)
	new /obj/item/export_scanner(src)
	new /obj/item/door_remote/quartermaster(src)
	new /obj/item/circuitboard/machine/techfab/department/cargo(src)
	new /obj/item/storage/photo_album/QM(src)
	new /obj/item/circuitboard/machine/ore_silo(src)
	new /obj/item/clothing/head/safety_helmet(src)

/obj/structure/closet/secure_closet/quartermaster/solgov
	name = "\proper logistics deck officer's locker"

/obj/structure/closet/secure_closet/quartermaster/solgov/PopulateContents()
	new /obj/item/storage/bag/garment/quartermaster/solgov(src)
	new /obj/item/folder/solgov(src)
	new /obj/item/folder/solgov(src)
	new /obj/item/pen/solgov(src)
	new /obj/item/stamp/solgov(src)
	new /obj/item/storage/backpack/satchel(src)
	new /obj/item/kitchen/knife/letter_opener(src)

/obj/structure/closet/secure_closet/miner
	name = "miner's equipment"
	icon_state = "mining"
	req_access = list(ACCESS_MINING)

/obj/structure/closet/secure_closet/miner/unlocked
	locked = FALSE

/obj/structure/closet/secure_closet/miner/PopulateContents()
	..()
	new /obj/item/stack/sheet/mineral/sandbags(src, 5)
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/shovel(src)
	new /obj/item/pickaxe/mini(src)
	new /obj/item/radio/headset/headset_cargo/mining(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/storage/bag/plants(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/mining_scanner(src)
	new /obj/item/gun/energy/kinetic_accelerator(src)
	new /obj/item/clothing/glasses/meson/prescription(src)
	new /obj/item/clothing/glasses/meson(src)
	new /obj/item/survivalcapsule(src)
	new /obj/item/clothing/head/hardhat/mining(src)

/obj/structure/closet/secure_closet/miner/solgov
	name = "field engineer's locker"

/obj/structure/closet/secure_closet/miner/solgov/PopulateContents()
	new /obj/item/pickaxe/drill/jackhammer(src)
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/clothing/head/hardhat/solgov(src)
	new /obj/item/radio{icon_state = "sec_radio"}(src)
	new /obj/item/clothing/under/solgov/formal(src)
	new /obj/item/clothing/under/solgov/dress(src)
	new /obj/item/clothing/under/solgov(src)
	new /obj/item/clothing/suit/hazardvest/solgov(src)
	new /obj/item/clothing/accessory/armband/cargo(src)
	new /obj/item/clothing/shoes/workboots(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/storage/backpack(src)
	new /obj/item/clothing/glasses/meson/prescription(src)
	new /obj/item/clothing/glasses/meson(src)
	new /obj/item/storage/bag/ore(src)
