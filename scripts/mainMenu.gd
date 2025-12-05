extends Control

func _ready() -> void:
	GameSounds.menuMusic.play()

func _on_start_button_pressed() -> void:
	GameSounds.click.play()
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://scenes/loadingScreen.tscn")
