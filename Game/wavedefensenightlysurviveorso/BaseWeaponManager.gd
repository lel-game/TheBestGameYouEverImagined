extends Node3D
class_name BaseWeaponManager

@export var gun_data:GunData
@export var shot_component:ShotComponent
@export var reload_component:ReloadComponent

func _process(delta):
	shot_component.cooldown -= delta
	shot_component.cooldown = max(shot_component.cooldown,0)
	
	#MAKE SURE GUN FIRES CORRECTLY BASED ON FIRETYPE EX:SEMI-AUTO OR FULL AUTO
	match shot_component.firing_type:
		0:
			if Input.is_action_just_pressed("Shoot") and shot_component.cooldown <= 0:
				shot_component.cooldown += gun_data.firerate
				shot_component.attempt_shot()
		1:
			if Input.is_action_pressed("Shoot") and shot_component.cooldown <= 0:
				shot_component.cooldown += gun_data.firerate
				shot_component.attempt_shot()
		_:
			print("NO FIRING TYPE SET")
			
	#RELOAD WHEN RELOAD
	if Input.is_action_just_pressed("Reload"):
		reload_component.attempt_reload()
