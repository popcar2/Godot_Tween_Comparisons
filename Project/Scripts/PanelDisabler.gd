extends Panel

## This script handles the disabling of panels on left click

var disabled: bool = false
var disabled_label: PackedScene = preload("res://Nodes/disabled_label.tscn")

var panel_index: int = -1

func _ready():
	# This is definitely not optimized but it's only 12 panels so who cares lol
	for i in range(11):
		if get_parent().get_child(i) == self:
			panel_index = i
			break
	
	if tween_controller.get_tween_disabled(panel_index):
		toggle_disabled()
	
	gui_input.connect(_on_gui_input)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _unhandled_input(event):
	if event is InputEventKey and event.is_pressed() and event.keycode == KEY_UP:
		enable_panel()
		modulate = Color8(255, 255, 255)
		disabled = false
		tween_controller.set_tween_disabled(false, panel_index)
	elif event is InputEventKey and event.is_pressed() and event.keycode == KEY_DOWN:
		disable_panel()
		disabled = true
		tween_controller.set_tween_disabled(true, panel_index)

func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		toggle_disabled()

func _on_mouse_entered():
	if !disabled:
		modulate = Color8(300, 300, 300)

func _on_mouse_exited():
	if !disabled:
		modulate = Color8(255, 255, 255)

func toggle_disabled():
	if !disabled:
		disable_panel()
	else:
		enable_panel()
		modulate = Color8(300, 300, 300) # Since mouse is still over the panel
	
	disabled = !disabled
	tween_controller.set_tween_disabled(disabled, panel_index)

func disable_panel():
	modulate = Color8(200, 200, 200)
	if (not has_node("Disabled Label")):
		var label: Label = disabled_label.instantiate()
		add_child(label)
	for child in get_children():
		if not (child is Label or child is Button):
			child.visibility_layer = 0

func enable_panel():
	if (has_node("Disabled Label")):
		$"Disabled Label".queue_free()
	for child in get_children():
		if not child is Label:
			child.visibility_layer = 1
