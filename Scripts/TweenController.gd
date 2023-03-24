extends Node

signal begin_tween(time)

@export var cooldown: float = 0.5
@onready var timer: Timer = $Timer

func _ready():
	timer.start()

func _on_timer_timeout():
	begin_tween.emit(timer.wait_time)
	await get_tree().create_timer(cooldown).timeout
	timer.start()

func set_time(time: float):
	timer.wait_time = time
