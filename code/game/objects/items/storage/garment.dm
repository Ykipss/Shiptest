/obj/item/storage/bag/garment
	name = "garment bag"
	icon = 'icons/obj/storage_celadon.dmi'
	icon_state = "garment_bag"
	desc = "A bag for storing extra clothes and shoes."
	slot_flags = NONE
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/bag/garment/captain
	name = "captain's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the captain."

/obj/item/storage/bag/garment/inteq/vanguard
	name = "vanguard's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the venguard."

/obj/item/storage/bag/garment/solgov/captain
	name = "captain's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the captain."

/obj/item/storage/bag/garment/hop
	name = "head of personnel's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the head of personnel."

/obj/item/storage/bag/garment/hos
	name = "head of security's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the head of security."

/obj/item/storage/bag/garment/research_director
	name = "research director's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the research director."

/obj/item/storage/bag/garment/chief_medical
	name = "chief medical officer's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the chief medical officer."

/obj/item/storage/bag/garment/engineering_chief
	name = "chief engineer's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the chief engineer."

/obj/item/storage/bag/garment/quartermaster
	name = "quartermasters's garment bag"
	desc = "A bag for storing extra clothes and shoes. This one belongs to the quartermaster."

/obj/item/storage/bag/garment/quartermaster/solgov
	name = "logistics deck officer's locker"

/obj/item/storage/bag/garment/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_combined_w_class = 63
	STR.max_items = 15
	STR.set_holdable(list(/obj/item/clothing), list(/obj/item/clothing/suit/space))

// Contents

/obj/item/storage/bag/garment/captain/PopulateContents()
	new /obj/item/clothing/neck/cloak/cap(src)
	new /obj/item/clothing/head/caphat(src)
	new /obj/item/clothing/suit/hooded/wintercoat/captain(src)
	new /obj/item/clothing/under/rank/command/captain(src)
	new /obj/item/clothing/under/rank/command/captain/skirt(src)
	new /obj/item/clothing/suit/armor/vest/capcarapace(src)
	new /obj/item/clothing/under/rank/command/captain/parade(src)
	new /obj/item/clothing/head/caphat/parade(src)
	new /obj/item/clothing/suit/armor/vest/capcarapace/captunic(src)
	new /obj/item/clothing/suit/armor/vest/capcarapace/alt(src)
	new /obj/item/clothing/gloves/color/captain(src)
	new /obj/item/clothing/head/crown/fancy(src)
	new /obj/item/clothing/glasses/sunglasses/gar/supergar(src)
	new /obj/item/clothing/shoes/sneakers/brown(src)

/obj/item/storage/bag/garment/solgov/captain/PopulateContents()
	new /obj/item/clothing/under/solgov/formal/captain(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/head/solgov/captain(src)
	new /obj/item/clothing/under/solgov/formal(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/under/solgov/dress(src)
	new /obj/item/clothing/suit/armor/vest/bulletproof/solgov/captain(src)
	new /obj/item/clothing/suit/armor/solgov_trenchcoat(src)
	new /obj/item/clothing/neck/cloak/solgovcap(src)

/obj/item/storage/bag/garment/inteq/vanguard/PopulateContents()
	new /obj/item/clothing/glasses/hud/security/sunglasses/inteq(src)
	new /obj/item/clothing/gloves/tackler/combat/insulated(src)
	new /obj/item/clothing/head/beret/sec/hos/inteq(src)
	new /obj/item/clothing/head/inteq_peaked(src)
	new /obj/item/clothing/shoes/combat(src)
	new /obj/item/clothing/suit/armor/hos/inteq(src)
	new /obj/item/clothing/under/syndicate/inteq(src)
	new /obj/item/clothing/under/syndicate/inteq/skirt(src)

/obj/item/storage/bag/garment/hop/PopulateContents()
	new /obj/item/clothing/neck/cloak/head_of_personnel(src)
	new /obj/item/clothing/head/beret/hop(src) //WS edit - More Berets
	new /obj/item/clothing/under/rank/command/head_of_personnel(src) //WS Edit - Better Command Uniforms
	new /obj/item/clothing/under/rank/command/head_of_personnel/skirt(src) //WS Edit - Better Command Uniforms
	new /obj/item/clothing/head/hopcap(src)
	new /obj/item/clothing/suit/armor/vest/hop(src) //WS edit - Command Resprite 3
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/shoes/sneakers/brown(src)

/obj/item/storage/bag/garment/hop/solgov/PopulateContents()
	new /obj/item/clothing/suit/armor/solgov_trenchcoat(src)
	new /obj/item/clothing/neck/cloak/overseer(src)
	new /obj/item/clothing/suit/armor/vest/bulletproof/solgov/overseer(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/under/solgov/formal(src)
	new /obj/item/clothing/head/solgov(src)

/obj/item/storage/bag/garment/hos/PopulateContents()
	new /obj/item/clothing/neck/cloak/hos(src)
	new /obj/item/clothing/under/rank/command(src) //WS edit - better command uniforms
	new /obj/item/clothing/under/rank/security/head_of_security/parade/female(src)
	new /obj/item/clothing/under/rank/security/head_of_security/parade(src)
	new /obj/item/clothing/suit/armor/vest/leather(src)
	new /obj/item/clothing/suit/armor/hos/trenchcoat(src) //WS edit - Small QoL Brig additions
	new /obj/item/clothing/suit/armor/hos(src)
	new /obj/item/clothing/under/rank/security/head_of_security/skirt(src)
	new /obj/item/clothing/under/rank/security/head_of_security/alt(src)
	new /obj/item/clothing/under/rank/security/head_of_security/alt/skirt(src)
	new /obj/item/clothing/head/HoS(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/eyepatch(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/gars/supergars(src)
	new /obj/item/clothing/suit/armor/vest/security/hos(src) //WS Edit - Better security jumpsuit sprites
	new /obj/item/clothing/mask/gas/sechailer/swat(src)

/obj/item/storage/bag/garment/research_director/PopulateContents()
	new /obj/item/clothing/head/beret/rd(src) //WS edit - Berets
	new /obj/item/clothing/under/rank/command(src) //WS edit - better command uniforms
	new /obj/item/clothing/neck/cloak/rd(src)
	new /obj/item/clothing/suit/bio_suit/scientist(src)
	new /obj/item/clothing/head/bio_hood/scientist(src)
	new /obj/item/clothing/suit/toggle/labcoat(src)
	new /obj/item/clothing/under/rank/rnd/research_director(src)
	new /obj/item/clothing/under/rank/rnd/research_director/skirt(src)
	new /obj/item/clothing/under/rank/rnd/research_director/alt(src)
	new /obj/item/clothing/under/rank/rnd/research_director/alt/skirt(src)
	new /obj/item/clothing/under/rank/rnd/research_director/turtleneck(src)
	new /obj/item/clothing/under/rank/rnd/research_director/turtleneck/skirt(src)

/obj/item/storage/bag/garment/chief_medical/PopulateContents()
	new /obj/item/clothing/head/beret/cmo(src) //Berets
	new /obj/item/clothing/under/rank/command(src) //Better command uniforms
	new /obj/item/clothing/neck/cloak/cmo(src)
	new /obj/item/clothing/suit/longcoat/cmo(src)
	new /obj/item/clothing/suit/bio_suit/cmo(src)
	new /obj/item/clothing/head/bio_hood/cmo(src)
	new /obj/item/clothing/suit/toggle/labcoat/cmo(src)
	new /obj/item/clothing/under/rank/medical/chief_medical_officer(src)
	new /obj/item/clothing/under/rank/medical/chief_medical_officer/skirt(src)
	new /obj/item/clothing/shoes/sneakers/brown	(src)

/obj/item/storage/bag/garment/engineering_chief/PopulateContents()
	new /obj/item/clothing/head/beret/ce(src) //Berets
	new /obj/item/clothing/under/rank/command(src) //Better command uniforms
	new /obj/item/clothing/neck/cloak/ce(src)
	new /obj/item/clothing/under/rank/engineering/chief_engineer(src)
	new /obj/item/clothing/under/rank/engineering/chief_engineer/skirt(src)
	new /obj/item/clothing/head/hardhat/white(src)
	new /obj/item/clothing/head/hardhat/weldhat/white(src)
	new /obj/item/clothing/gloves/color/yellow(src)
	new /obj/item/clothing/shoes/sneakers/brown(src)

/obj/item/storage/bag/garment/quartermaster/PopulateContents()
	new /obj/item/clothing/neck/cloak/qm(src)
	new /obj/item/clothing/under/rank/cargo/qm(src)
	new /obj/item/clothing/under/rank/cargo/qm/skirt(src)
	new /obj/item/clothing/shoes/sneakers/brown(src)
	new /obj/item/clothing/suit/fire/firefighter(src)
	new /obj/item/clothing/gloves/fingerless(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/head/soft(src)

/obj/item/storage/bag/garment/quartermaster/solgov/PopulateContents()
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/under/solgov/formal(src)
	new /obj/item/clothing/under/solgov/dress(src)
	new /obj/item/clothing/suit/armor/solgov_trenchcoat(src)
	new /obj/item/clothing/suit/solgov/overcoat(src)
	new /obj/item/clothing/head/flatcap/solgov(src)
	new /obj/item/clothing/glasses/sunglasses(src)
