extends Panel

@onready var musicVolumeSlider: HSlider = $musicVolumeSlider
@onready var sfxVolumeSlider: HSlider = $sfxVolumeSlider


func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, value)

func _on_music_mute_button_toggled(toggled_on: bool) -> void:
	GameSounds.click.play()
	
	if toggled_on:
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false)

func _on_sfx_mute_button_toggled(toggled_on: bool) -> void:
	GameSounds.click.play()
	
	if toggled_on:
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false)
