extends Node3D
class_name Bullet
@onready var direction = Vector3(0,0,1)
var speed = -60

func _ready():
	visible = false
	
func _physics_process(delta):
	look_at(direction+global_position)
	look_at(direction+global_position)
	global_position += direction * speed * delta
	visible = true


func _on_bullet_collision_body_entered(body):
	queue_free()
