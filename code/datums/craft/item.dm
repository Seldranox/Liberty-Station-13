/obj/item/craft
	icon = 'icons/obj/crafts.dmi'
	icon_state = "device"
	var/datum/craft_recipe/recipe
	var/step = 1


/obj/item/craft/New(loc, new_recipe)
	..(loc)
	recipe = new_recipe
	src.name = "crafting [recipe.name]"
	src.icon_state = recipe.icon_state
	update()

/obj/item/craft/Destroy()

	for (var/datum/craft_step/step in recipe.steps)
		for (var/obj/item/craft/build_target in step.craft_items)
			if (build_target == src)
				step.craft_items.Remove(build_target)

	. = ..()

/obj/item/craft/Destroy(force)
	for(var/datum/craft_step/CS in recipe.steps)
		CS.craft_items -= src
	recipe = null
	. = ..()

/obj/item/craft/proc/update()
	desc = recipe.get_description(step-1, src)

/obj/item/craft/proc/continue_crafting(obj/item/I, mob/living/user)
	if(user && istype(loc, /turf))
		user.face_atom(src) //Look at what you're doing please

	if(recipe.try_step(step, I, user, src)) //First step is
		if(recipe.is_compelete(step))
			recipe.spawn_result(src, user)
		else
			update()
		return TRUE //Returning true here will prevent afterattack effects for ingredients and tools used on us

	return FALSE

/obj/item/craft/attackby(obj/item/I, mob/living/user)
	return continue_crafting(I, user)

/obj/item/craft/MouseDrop_T(atom/A, mob/user, src_location, over_location, src_control, over_control, params)
	if(isturf(A))
		return
	return continue_crafting(A, user)
