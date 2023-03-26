extends Label

## Used in HP bar labels
func _on_value_changed(value: float):
	text = str(value)
