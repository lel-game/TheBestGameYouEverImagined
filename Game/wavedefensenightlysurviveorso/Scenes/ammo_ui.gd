extends Control

@export var ammo_lbl:Label
@export var weapon_holder:WeaponHolder
var gun

func _process(delta):
	var gun = (weapon_holder.get_child(0) as BaseWeaponManager)
	if weapon_holder.get_child(0) != null:
		ammo_lbl.text = str(gun.gun_data.current_ammo) + "/" + str(gun.gun_data.magazine_size)
		ammo_lbl.visible = true
	else:
		ammo_lbl.text = "No gun selected"
