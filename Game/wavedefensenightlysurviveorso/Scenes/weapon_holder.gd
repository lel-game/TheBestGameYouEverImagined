extends Node3D
class_name WeaponHolder
var current_weapon = "UZI"

var uzi = preload("res://UZI.tscn")
var pistol = preload("res://Scenes/luger/pistol.tscn")
const shotgun = preload("res://shotgun.tscn")

func set_weapon():
	if current_weapon == "Pistol":
		remove_all_children()
		var new_weapon = pistol.instantiate()
		add_child(new_weapon)
	if current_weapon == "UZI":
		remove_all_children()
		var new_weapon = uzi.instantiate()
		add_child(new_weapon)
	if current_weapon == "Shotgun":
		remove_all_children()
		var new_weapon = shotgun.instantiate()
		add_child(new_weapon)

func _process(delta):
	if Input.is_action_just_pressed("1"):
		current_weapon = "Pistol"
		set_weapon()
	if Input.is_action_just_pressed("2"):
		current_weapon = "UZI"
		set_weapon()
	if Input.is_action_just_pressed("3"):
		current_weapon = "Shotgun"
		set_weapon()

func remove_all_children():
	for child in get_children():
		child.queue_free()
