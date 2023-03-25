extends Node

signal begin_tween(time: float, ease: Tween.EaseType)

@export var cooldown: float = 0.5
@onready var timer: Timer = $Timer
var ease_type = Tween.EASE_IN_OUT

func _ready():
	timer.start()

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
