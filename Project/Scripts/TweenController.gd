extends Node

## This is the script for the autoload tween_controller
## It handles timers to sending the signals to start all tweens
## and holds global variables

signal begin_tween(time: float, ease: Tween.EaseType)

@export var cooldown: float = 0.5
@onready var timer: Timer = $Timer
@onready var reset_timer: Timer = $"Reset Timer"
var ease_type: Tween.EaseType = Tween.EASE_IN_OUT
var disabled_tweens: Array[bool]
var circ_panel_open: bool = false

func _ready():
	timer.start()
	disabled_tweens.resize(11)
	disabled_tweens.fill(false)

func _on_timer_timeout():
	begin_tween.emit(timer.wait_time, ease_type)
	await get_tree().create_timer(cooldown).timeout
	timer.start()

func set_time(value: float):
	timer.wait_time = value

func get_time():
	return timer.wait_time

func set_cooldown(value: float):
	cooldown = value

func get_cooldown():
	return cooldown

func set_ease(value: Tween.EaseType):
	ease_type = value

func get_ease():
	return ease_type

func reset():
	timer.stop()
	reset_timer.start()

func set_tween_disabled(disabled: bool, index: int):
	disabled_tweens[index] = disabled

func get_tween_disabled(index: int):
	return disabled_tweens[index]
