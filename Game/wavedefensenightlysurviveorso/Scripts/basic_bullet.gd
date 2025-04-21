extends Node3D
class_name Bullet
var direction = Vector3(0,0,1)
var speed = -100

func _physics_process(delta):
	global_position += direction * speed * delta
