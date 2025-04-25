extends Node
class_name ShotComponent

#S == lelgame
#D == DiDCool
#J == Jim

var cooldown = 0.0
@export_enum("Single", "Auto") var firing_type
@export var weapon_manager: BaseWeaponManager
@export var reload_manager: ReloadComponent
var bullet = preload("res://Scenes/luger/basic_bullet.tscn")
@export var muzzle_position: Marker3D

func shoot():
	#S Decrease ammo and clamp it to be within valid range
	weapon_manager.gun_data.current_ammo -= 1
	weapon_manager.gun_data.current_ammo = clamp(weapon_manager.gun_data.current_ammo, 0, weapon_manager.gun_data.magazine_size)

	#S Apply weapon sway
	var sway_amount = deg_to_rad(weapon_manager.gun_data.spread)
	weapon_manager.rotate_x(randf_range(-sway_amount, sway_amount))
	weapon_manager.rotate_y(randf_range(-sway_amount, sway_amount))

	#S Spawn bullet and set its position and direction
	var new_bullet = bullet.instantiate() as Bullet
	add_child(new_bullet)
	new_bullet.global_position = muzzle_position.global_position
	new_bullet.direction = muzzle_position.global_transform.basis.z

func attempt_shot():
	#S Check if there is ammo and the weapon is not reloading
	if weapon_manager.gun_data.current_ammo > 0 and not reload_manager.reloading:
		shoot()
	else:
		print("Out of ammo or reloading")
