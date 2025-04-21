extends Node
class_name ShotComponent

var cooldown = 0.0
@export_enum("Single","Auto") var firing_type
@export var weapon_manager:BaseWeaponManager
@export var reload_manager:ReloadComponent
var bullet = preload("res://basic_bullet.tscn")
@export var muzzle_position:Marker3D

func shoot():
	weapon_manager.gun_data.current_ammo -= 1
	weapon_manager.gun_data.current_ammo = clamp(weapon_manager.gun_data.current_ammo,0,weapon_manager.gun_data.magazine_size)
	var new_bullet = (bullet.instantiate() as Bullet)
	add_child(new_bullet)
	new_bullet.global_position = muzzle_position.global_position
	new_bullet.direction = muzzle_position.transform.basis.z
	print(weapon_manager.gun_data.current_ammo)


func attempt_shot():
	if weapon_manager.gun_data.current_ammo > 0 and not reload_manager.reloading:
		shoot()
	else:
		print("Out of ammo or reloading")
