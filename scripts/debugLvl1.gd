extends Node2D

func _ready() -> void:
	GameSounds.menuMusic.stop()
	GameSounds.mainLevelMusic.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
