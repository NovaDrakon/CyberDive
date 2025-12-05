extends Node2D

func _ready() -> void:
	GameSounds.menuMusic.pause()
	GameSounds.mainLevelMusic.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
