extends Panel

@onready var settingBox: Panel = $"../settingBox"

func _on_setting_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		settingBox.show()
	else:
		settingBox.hide()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
