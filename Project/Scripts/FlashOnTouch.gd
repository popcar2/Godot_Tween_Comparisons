extends Sprite2D

## Used in skeletons in the sword animation scene

@onready var area2d = $"Area2D"

func _ready():
	area2d.connect("area_entered", _on_area_entered)
	area2d.connect("area_exited", _on_area_exit)

func _on_area_entered(_area: Area2D):
	modulate = Color8(255, 128, 128)

func _on_area_exit(_area: Area2D):
	modulate = Color8(255, 255, 255)
