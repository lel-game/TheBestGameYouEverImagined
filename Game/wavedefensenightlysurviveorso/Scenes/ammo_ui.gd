extends Control

@export var ammo_lbl: Label
@export var weapon_holder: WeaponHolder

#S Made some stuff more clear for better code interpretation

#S == lelgame
#D == DiDCool
#J == Jim

func _process(delta):
	#S Check if there are any children in weapon_holder
	if weapon_holder.get_child_count() > 0:
		#S Access the first child, which is expected to be the gun
		var gun = weapon_holder.get_child(0) as BaseWeaponManager
		
		if gun != null:
			#S Update the ammo label if a gun is found
			ammo_lbl.text = str(gun.gun_data.current_ammo) + "/" + str(gun.gun_data.magazine_size)
			ammo_lbl.visible = true
		else:
			#S If the gun is null (unexpected), display no gun selected message
			ammo_lbl.text = "No gun selected"
			ammo_lbl.visible = true
	else:
		#S If no children exist in weapon_holder, show no gun selected message
		ammo_lbl.text = "No gun selected"
		ammo_lbl.visible = true
