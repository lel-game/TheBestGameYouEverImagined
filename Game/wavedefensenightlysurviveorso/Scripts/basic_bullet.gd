extends Node3D
class_name Bullet
@onready var direction = get_parent().get_parent().global_transform.basis.z
var speed = -100

func _ready():
	look_at(direction+global_position)
	
func _physics_process(delta):
	look_at(direction+global_position)
	global_position += direction * speed * delta
