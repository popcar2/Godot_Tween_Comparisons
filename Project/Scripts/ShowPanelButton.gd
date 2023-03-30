extends Button

## This script is for showing/hiding the Circular panel

var enabled: bool = false
@onready var panel: Panel = $".."

func _ready():
	pressed.connect(_on_button_pressed)
	if tween_controller.circ_panel_open:
		panel.position.x = 0
		text = '<'
		enabled = true
	else:
		panel.position.x = -574
		text = '>'

func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and !enabled:
		toggle_show()
	elif Input.is_action_just_pressed("ui_down") and enabled:
		toggle_show()

func _on_button_pressed():
	toggle_show()

func toggle_show():
	var tween: Tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	if !enabled:
		tween.tween_property(panel, "position:x", 0, 0.4)
		text = '<'
	else:
		tween.tween_property(panel, "position:x", -574, 0.4)
		text = '>'
	
	enabled = !enabled
	tween_controller.circ_panel_open = enabled
