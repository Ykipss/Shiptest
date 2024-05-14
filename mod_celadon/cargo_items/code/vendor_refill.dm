/datum/supply_pack/vendor_refill/vend_circ
	name = "Vendor circuit board "
	desc = "Circuit board for building vendors."
	cost = 250
	contains = list(/obj/item/circuitboard/machine/vendor,
					/obj/item/screwdriver)
	crate_name = "vend circuit crate"

/datum/supply_pack/vendor_refill/shaft
	name = "Mining equipment vendor refill"
	desc = "Mining equipment vendor cartridge for replacing in Mining vendors."
	cost = 8000
	contains = list(/obj/item/vending_refill/mining_equipment)
	crate_name = "miner supply crate"

/datum/supply_pack/vendor_refill/sectech
	name = "SecTech vendor refill"
	desc = "SecTech vendor cartridge for replacing in SecTech vendors."
	cost = 4000
	contains = list(/obj/item/vending_refill/security)
	crate_name = "SecTech supply crate"

/datum/supply_pack/vendor_refill/secdrobe
	name = "SecDrobe vendor refill"
	desc = "SecTech vendor cartridge for replacing in SecTech vendors."
	cost = 2000
	contains = list(/obj/item/vending_refill/wardrobe/sec_wardrobe)
	crate_name = "SecDrobe supply crate"
