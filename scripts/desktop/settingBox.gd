extends Panel

@onready var musicVolumeSlider: HSlider = $musicVolumeSlider
@onready var sfxVolumeSlider: HSlider = $sfxVolumeSlider

var musicVal: float
var sfxVal: float

func _ready() -> void:
	loadAudio()

func _on_music_volume_slider_value_changed(value: float) -> void:
	musicVal = value
	AudioServer.set_bus_volume_db(1, musicVal)
	saveAudio()

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	sfxVal = value
	AudioServer.set_bus_volume_db(2, sfxVal)
	saveAudio()

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

func saveAudio():
	SaveSystem.set_var("music", musicVal)
	SaveSystem.set_var("sfx", sfxVal)
	SaveSystem.save(GlobalVars.filePath)

func loadAudio():
	musicVal = SaveSystem.get_var("music", musicVal)
	sfxVal = SaveSystem.get_var("sfx", sfxVal)
