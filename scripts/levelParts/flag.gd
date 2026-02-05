extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	await get_tree().create_timer(0.3).timeout
	GameSounds.mainLevelMusic.stop()
	GameSounds.menuMusic.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://scenes/loadingScreen.tscn")
