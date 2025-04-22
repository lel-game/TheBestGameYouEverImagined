extends Node
class_name ReloadComponent
@export var weapon_manager:BaseWeaponManager
@export_enum("Full","Partial") var reload_type

var reload_cooldown := 0.0
var reloading = false

func attempt_reload():
	if weapon_manager.gun_data.current_ammo >= weapon_manager.gun_data.magazine_size:
		print("Cant reload full ammo already")
	else:
		reload_cooldown = weapon_manager.gun_data.reload_speed
		reloading = true
		print("reloading")
		
func reload():
	match reload_type:
		0:
			weapon_manager.gun_data.current_ammo += weapon_manager.gun_data.magazine_size
			weapon_manager.gun_data.current_ammo = clamp(weapon_manager.gun_data.current_ammo,0,weapon_manager.gun_data.magazine_size)
			print('reloaded')
		1:
			weapon_manager.gun_data.current_ammo += weapon_manager.gun_data.custom_reload_size
			weapon_manager.gun_data.current_ammo = clamp(weapon_manager.gun_data.current_ammo,0,weapon_manager.gun_data.magazine_size)
			print('reloaded')

func _process(delta):
	if reloading and reloading == true:
		reload_cooldown -= delta
		
	if reload_cooldown <= 0 and reloading == true:
		reloading = false
		reload_cooldown = 0.0
		reload()
	if weapon_manager.gun_data.current_ammo <= 0 and reloading == false:
		attempt_reload()
