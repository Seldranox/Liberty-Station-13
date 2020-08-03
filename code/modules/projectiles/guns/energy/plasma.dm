/obj/item/weapon/gun/energy/plasma
	name = "\"Dominion\" plasma rifle"
	desc = "A weapon that uses advanced plasma generation technology to emit powerful blasts of energized matter. Due to its complexity and cost, it is rarely seen in use, except by specialists."
	icon = 'icons/obj/guns/energy/pulse.dmi'
	icon_state = "pulse"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 7, MATERIAL_URANIUM = 8)
	price_tag = 4500
	fire_sound = 'sound/weapons/Laser.ogg'
	projectile_type = /obj/item/projectile/beam
	cell_type = /obj/item/weapon/cell/medium
	sel_mode = 2
	charge_cost = 20 //Gives us 40 shots per high medium-sized cell
	recoil_buildup = 1 //pulse weapons have a bit more recoil
	one_hand_penalty = 10
	twohanded = TRUE

	firemodes = list(
		list(mode_name="burn", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/Taser.ogg', fire_delay=8, charge_cost=null, icon="stun", projectile_color = "#0000FF"),
		list(mode_name="melt", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/Laser.ogg', fire_delay=12, charge_cost=25, icon="kill", projectile_color = "#FF0000"),
		list(mode_name="INCINERATE", projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/pulse.ogg', fire_delay=14, charge_cost=30, icon="destroy", projectile_color = "#FFFFFF"),
	)

/obj/item/weapon/gun/energy/plasma/mounted
	self_recharge = TRUE
	use_external_power = TRUE
	safety = FALSE
	twohanded = FALSE
	one_hand_penalty = 0


/obj/item/weapon/gun/energy/plasma/mounted/blitz
	name = "SDF PR \"Sprengen\""
	desc = "A miniaturized plasma rifle, remounted for robotic use only."
	icon_state = "plasma_turret"
	charge_meter = FALSE

/obj/item/weapon/gun/energy/plasma/destroyer
	name = "\"Purger\" plasma rifle"
	desc = "A more recent \"Old Testament\" brand plasma rifle, developed in direct response to compete against the highly successful \"Cassad\" design."
	icon = 'icons/obj/guns/energy/destroyer.dmi'
	fire_sound = 'sound/weapons/pulse.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 10, MATERIAL_URANIUM = 5)
	sel_mode = 1
	projectile_type = /obj/item/projectile/beam/pulse
	fire_delay = 15

	firemodes = list(
		list(mode_name="INCINERATE", projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/pulse.ogg', fire_delay=null, charge_cost=30, icon="kill", projectile_color = "#FFFF00"),
		list(mode_name="VAPORIZE", projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/pulse.ogg', fire_delay=5, charge_cost=70, icon="destroy", projectile_color = "#FF0000", recoil_buildup=3),
	)

/obj/item/weapon/gun/energy/pulse/cassad
	name = "\"Cassad\" energy rifle"
	desc = "\"Holland & Sullivan\" brand energy assault rifle, capable of prolonged combat. When surrender is not an option."
	icon = 'icons/obj/guns/energy/cassad.dmi'
	icon_state = "cassad"
	item_state = "cassad"
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 6)
	fire_sound = 'sound/weapons/pulse.ogg'
	projectile_type = /obj/item/projectile/beam/pulse
	sel_mode = 1
	charge_cost = 20 //40 shots per high medium-sized cell
	fire_delay = 12
	price_tag = 3000
	zoom_factor = null

	firemodes = list(
		list(mode_name="burn", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/Taser.ogg', fire_delay=8, charge_cost=15, icon="stun", projectile_color = "#00FFFF"),
		list(mode_name="melt", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/Laser.ogg', fire_delay=null, charge_cost=null, icon="kill", projectile_color = "#00AAFF"),
	)

/obj/item/weapon/gun/energy/plasma/cassad/update_icon()
	..()
	set_item_state(null, back = TRUE)

/obj/item/weapon/gun/energy/plasma/auretian
	name = "\"Auretian\" energy pistol"
	desc = "\"Soteria\" brand energy pistol, for personal overprotection. It can change between laser and plasma, with the former penetrating armor better and the latter dealing more raw damage."
	icon = 'icons/obj/guns/energy/brigador.dmi'
	icon_state = "brigador"
	charge_meter = FALSE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	twohanded = FALSE
	can_dual = 1
	sel_mode = 1
	suitable_cell = /obj/item/weapon/cell/small
	charge_cost = 20

	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 8, MATERIAL_PLASMA = 2, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 3)

	firemodes = list(
		list(mode_name="plasma", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/Taser4.ogg', fire_delay=1, icon="destroy", projectile_color = "#00FFFF"),
		list(mode_name="laser", projectile_type=/obj/item/projectile/beam/xray, fire_sound='sound/weapons/Taser3.ogg', fire_delay=1, icon="kill", projectile_color = "#00AAFF"),
	)

/obj/item/weapon/gun/energy/plasma/auretian/update_icon()
	overlays.Cut()
	..()
	if(cell)
		overlays += image(icon, "cell_guild")