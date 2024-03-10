//Пилот мехов солгова

/obj/structure/closet/secure_closet/security/solgov/pilot
	name = "pilot's locker"

/obj/structure/closet/secure_closet/security/solgov/pilot/PopulateContents()
	new /obj/item/clothing/under/solgov/formal(src)
	new /obj/item/clothing/under/solgov/dress(src)
	new /obj/item/clothing/under/solgov(src)
	new /obj/item/clothing/shoes/workboots(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/radio/headset/solgov/alt(src)
	new /obj/item/radio{icon_state = "sec_radio"}(src)
	new /obj/item/clothing/head/beret/solgov (src)
	new /obj/item/clothing/accessory/holster (src)
