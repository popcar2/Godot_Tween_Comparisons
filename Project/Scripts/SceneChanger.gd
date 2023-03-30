extends HBoxContainer

## This script handles changing to different scenes

@export var prev_scene: String
@export var next_scene: String

func _ready():
	if prev_scene.is_empty():
		$"PrevScene Button".disabled = true
	if next_scene.is_empty():
		$"NextScene Button".disabled = true

func _process(_delta):
	if Input.is_action_just_pressed("ui_left") and not prev_scene.is_empty():
		_on_prev_scene_button_pressed()
	elif Input.is_action_just_pressed("ui_right") and not next_scene.is_empty():
		_on_next_scene_button_pressed()

func _on_prev_scene_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/" + prev_scene + ".tscn")

func _on_next_scene_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/" + next_scene + ".tscn")
