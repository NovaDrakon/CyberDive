extends Control

var musicVolume := 6.0
var sfxVolume := 6.0

func _ready() -> void:
	loadAudio()
	
	AudioServer.set_bus_volume_db(1, musicVolume)
	AudioServer.set_bus_volume_db(2, sfxVolume)
	
	GameSounds.menuMusic.play()

func _on_start_button_pressed() -> void:
	GameSounds.click.play()
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://scenes/desktop/loadingScreen.tscn")

func loadAudio():
	musicVolume = SaveSystem.get_var("musicVolume", musicVolume)
	sfxVolume = SaveSystem.get_var("sfxVolume", sfxVolume)
