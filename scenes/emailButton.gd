extends Button

@onready var topButtons: HBoxContainer = $"../../topBarPanel/topButtons"

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		topButtons.show()
	else:
		topButtons.hide()
