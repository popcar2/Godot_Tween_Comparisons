extends Control

@onready var linear_sprite = %"Linear Sprite"
@onready var sine_sprite = %"Sine Sprite"
@onready var quad_sprite = %"Quad Sprite"
@onready var cubic_sprite = %"Cubic Sprite"
@onready var quart_sprite = %"Quart Sprite"
@onready var quint_sprite = %"Quint Sprite"
@onready var expo_sprite = %"Expo Sprite"
@onready var elastic_sprite = %"Elastic Sprite"
@onready var bounce_sprite = %"Bounce Sprite"
@onready var back_sprite = %"Back Sprite"

@onready var time_spinbox: SpinBox = %"Time Spinbox"
@onready var time_slider: Slider = %"Time Slider"
@onready var cooldown_spinbox: SpinBox = %"Cooldown Spinbox"
@onready var cooldown_slider: Slider = %"Cooldown Slider"
@onready var easetype_option: OptionButton = %"EaseType Option"

@export var tween_resources: Array[TweenResource]

var cycle = true

func _ready():
	tween_controller.begin_tween.connect(activate_tweens)
	tween_controller.reset()
	
	var panels = get_tree().get_nodes_in_group("panel")
	for i in range(10):
		if tween_controller.get_tween_disabled(i):
			panels[i].toggle_disabled()
	
	# update settings
	time_spinbox.value = tween_controller.get_time()
	time_slider.value = tween_controller.get_time()
	cooldown_spinbox.value = tween_controller.get_cooldown()
	cooldown_slider.value = tween_controller.get_cooldown()
	
	var current_ease: Tween.EaseType = tween_controller.get_ease()
	match current_ease:
		Tween.EASE_IN: easetype_option.select(0)
		Tween.EASE_OUT: easetype_option.select(1)
		Tween.EASE_IN_OUT: easetype_option.select(2)
		Tween.EASE_OUT_IN: easetype_option.select(3)
	
func activate_tweens(time: float, ease_type: Tween.EaseType):
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.set_ease(ease_type)
	
	for tween_info in tween_resources:
		if cycle:
			tween.tween_property(linear_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_LINEAR)
			tween.tween_property(sine_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_SINE)
			tween.tween_property(quad_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_QUAD)
			tween.tween_property(cubic_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_CUBIC)
			tween.tween_property(quart_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_QUART)
			tween.tween_property(quint_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_QUINT)
			tween.tween_property(expo_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_EXPO)
			tween.tween_property(elastic_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_ELASTIC)
			tween.tween_property(bounce_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_BOUNCE)
			tween.tween_property(back_sprite, tween_info.tweened_property, tween_info.tween_to, time).set_trans(Tween.TRANS_BACK)
		else:
			tween.tween_property(linear_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_LINEAR)
			tween.tween_property(sine_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_SINE)
			tween.tween_property(quad_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_QUAD)
			tween.tween_property(cubic_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_CUBIC)
			tween.tween_property(quart_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_QUART)
			tween.tween_property(quint_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_QUINT)
			tween.tween_property(expo_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_EXPO)
			tween.tween_property(elastic_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_ELASTIC)
			tween.tween_property(bounce_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_BOUNCE)
			tween.tween_property(back_sprite, tween_info.tweened_property, tween_info.tween_from, time).set_trans(Tween.TRANS_BACK)
	cycle = !cycle


func _on_time_changed(value: float):
	tween_controller.set_time(value)
	time_slider.value = value
	time_spinbox.value = value

func _on_cooldown_changed(value: float):
	tween_controller.set_cooldown(value)
	cooldown_slider.value = value
	cooldown_spinbox.value = value


func _on_ease_type_option_item_selected(index: int):
	match index:
		0: tween_controller.set_ease(Tween.EASE_IN)
		1: tween_controller.set_ease(Tween.EASE_OUT)
		2: tween_controller.set_ease(Tween.EASE_IN_OUT)
		3: tween_controller.set_ease(Tween.EASE_OUT_IN)
