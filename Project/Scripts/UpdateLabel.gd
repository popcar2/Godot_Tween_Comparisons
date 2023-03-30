extends Label

## Used to update text in HP bar labels
func _on_value_changed(value: float):
	text = str(value)
