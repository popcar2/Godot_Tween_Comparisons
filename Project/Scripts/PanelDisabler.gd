extends Panel

var disabled: bool = false
var disabled_label: PackedScene = preload("res://Nodes/disabled_label.tscn")
var panel_index: int

func _enter_tree():
	add_to_group("panel")

func _ready():
	# This is definitely not optimized but it's only 10 panels so who cares lol
	for i in range(10):
		if get_parent().get_child(i) == self:
			panel_index = i
			break
	
	gui_input.connect(_on_gui_input)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

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
		modulate = Color8(200, 200, 200)
		var label: Label = disabled_label.instantiate()
		add_child(label)
		for child in get_children():
			if not child is Label:
				child.modulate.a = 0
	else:
		modulate = Color8(300, 300, 300)
		$"Disabled Label".queue_free()
		for child in get_children():
			if not child is Label:
				child.modulate.a = 1
	
	disabled = !disabled
	tween_controller.set_tween_disabled(disabled, panel_index)
