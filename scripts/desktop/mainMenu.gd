extends Control

func _ready() -> void:
	AudioServer.set_bus_volume_db(1, 6)
	AudioServer.set_bus_volume_db(2, 0)
	GameSounds.menuMusic.play()

func _on_start_button_pressed() -> void:
	GameSounds.click.play()
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://scenes/loadingScreen.tscn")
