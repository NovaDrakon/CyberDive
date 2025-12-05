extends Control

func _ready() -> void:
	GameSounds.mainLevelMusic.stop()
	GameSounds.menuMusic.play()
	await get_tree().create_timer(2.3).timeout
	get_tree().change_scene_to_file("res://scenes/desktop.tscn")
