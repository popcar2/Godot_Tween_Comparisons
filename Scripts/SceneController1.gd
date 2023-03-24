extends Control

const START_X: int = 60
const END_X: int = 514

@onready var linear_sprite: Sprite2D = %"Linear Sprite"
@onready var sine_sprite: Sprite2D = %"Sine Sprite"
@onready var quad_sprite: Sprite2D = %"Quad Sprite"
@onready var cubic_sprite: Sprite2D = %"Cubic Sprite"
@onready var quart_sprite: Sprite2D = %"Quart Sprite"
@onready var quint_sprite: Sprite2D = %"Quint Sprite"
@onready var expo_sprite: Sprite2D = %"Expo Sprite"
@onready var elastic_sprite: Sprite2D = %"Elastic Sprite"
@onready var bounce_sprite: Sprite2D = %"Bounce Sprite"
@onready var back_sprite: Sprite2D = %"Back Sprite"

@onready var time_spinbox: SpinBox = %"Time Spinbox"
@onready var time_slider: Slider = %"Time Slider"
@onready var cooldown_spinbox: SpinBox = %"Cooldown Spinbox"
@onready var cooldown_slider: Slider = %"Cooldown Slider"

var cycle = true

func _ready():
	tween_controller.begin_tween.connect(activate_tweens)
	
func activate_tweens(time: float):
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	
	if cycle:
		tween.tween_property(linear_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_LINEAR)
		tween.tween_property(sine_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_SINE)
		tween.tween_property(quad_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_QUAD)
		tween.tween_property(cubic_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(quart_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_QUART)
		tween.tween_property(quint_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_QUINT)
		tween.tween_property(expo_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_EXPO)
		tween.tween_property(elastic_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_ELASTIC)
		tween.tween_property(bounce_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(back_sprite, "position", Vector2(END_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_BACK)
	else:
		tween.tween_property(linear_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_LINEAR)
		tween.tween_property(sine_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_SINE)
		tween.tween_property(quad_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_QUAD)
		tween.tween_property(cubic_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(quart_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_QUART)
		tween.tween_property(quint_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_QUINT)
		tween.tween_property(expo_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_EXPO)
		tween.tween_property(elastic_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_ELASTIC)
		tween.tween_property(bounce_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(back_sprite, "position", Vector2(START_X, linear_sprite.position.y), time).set_trans(Tween.TRANS_BACK)
	cycle = !cycle


func _on_time_changed(value: float):
	tween_controller.set_time(value)
	time_slider.value = value
	time_spinbox.value = value

func _on_cooldown_changed(value: float):
	tween_controller.set_cooldown(value)
	cooldown_slider.value = value
	cooldown_spinbox.value = value
