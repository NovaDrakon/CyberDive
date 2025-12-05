extends Panel

@onready var settingBox: Panel = $"../settingBox"

func _on_setting_button_toggled(toggled_on: bool) -> void:
	GameSounds.click.play()
	if toggled_on:
		settingBox.show()
	else:
		settingBox.hide()

func _on_quit_button_pressed() -> void:
	GameSounds.click.play()
	await get_tree().create_timer(0.04).timeout
	get_tree().quit()
