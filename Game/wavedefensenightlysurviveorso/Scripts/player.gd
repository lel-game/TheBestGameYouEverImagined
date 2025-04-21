extends CharacterBody3D

#L == lelgame
#D == DiDCool
#J == Jim

#S ===== VARIABLES =====
@export var move_speed: float = 5.0
@export var jump_velocity: float = 6.0
@export var gravity: float = 9.8
@export var mouse_sensitivity: float = 0.002
var camera_x_rotation: float = 0.0
var esc_cooldown: float = 0.3 
var esc_timer: float = 0.0

@onready var head = $Head
#S ===== END OF VARIABLES =====

#S self explanatory
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if get_tree().paused == false:
		if event is InputEventMouseMotion:
			rotate_y(-event.relative.x * mouse_sensitivity)
			camera_x_rotation = clamp(camera_x_rotation - event.relative.y * mouse_sensitivity, deg_to_rad(-90), deg_to_rad(90))
			head.rotation.x = camera_x_rotation
		
	if event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
		if get_tree().paused:
			get_tree().paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			get_tree().paused = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta):
	if get_tree().paused == false:
		var input_dir = Vector3.ZERO
		
		if Input.is_action_pressed("move_forward"):
			input_dir.z -= 1
		if Input.is_action_pressed("move_backward"):
			input_dir.z += 1
		if Input.is_action_pressed("move_left"):
			input_dir.x -= 1
		if Input.is_action_pressed("move_right"):
			input_dir.x += 1
		
		input_dir = input_dir.normalized()
		var direction = (global_transform.basis * input_dir).normalized()
		
		velocity.x = direction.x * move_speed
		velocity.z = direction.z * move_speed
		
		if not is_on_floor():
			velocity.y -= gravity * delta
		else:
			if Input.is_action_just_pressed("jump"):
				velocity.y = jump_velocity

		move_and_slide()
