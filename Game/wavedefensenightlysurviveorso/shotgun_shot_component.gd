extends ShotComponent
class_name ShotgunShotComponent


func shoot():
	weapon_manager.gun_data.current_ammo -= 1
	weapon_manager.gun_data.current_ammo = clamp(weapon_manager.gun_data.current_ammo,0,weapon_manager.gun_data.magazine_size)
	#SPAWN IN BULLET
	var first_bullet = (bullet.instantiate() as Bullet)
	add_child(first_bullet)
	first_bullet.global_position = muzzle_position.global_position
	first_bullet.direction = muzzle_position.global_transform.basis.z
	for i in range(weapon_manager.gun_data.pellets):
		var new_bullet = (bullet.instantiate() as Bullet)
		add_child(new_bullet)
		new_bullet.global_position = muzzle_position.global_position
		var spread = deg_to_rad(weapon_manager.gun_data.spread)
		var pellets = weapon_manager.gun_data.pellets
		var facing_direction = muzzle_position.global_transform.basis.z
		var bullet_direction_spread = facing_direction.rotated(Vector3.UP,spread)
		var bullet_direction_final = bullet_direction_spread.rotated(facing_direction.normalized(),2*PI/pellets*i)
		print(bullet_direction_final)
		new_bullet.direction = bullet_direction_final
