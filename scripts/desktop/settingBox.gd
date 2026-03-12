extends Panel

@onready var musicVolumeSlider: HSlider = $musicVolumeSlider
@onready var sfxVolumeSlider: HSlider = $sfxVolumeSlider

var musicVal: float
var sfxVal: float

func _ready() -> void:
	loadAudio()

func _on_music_volume_slider_value_changed(value: float) -> void:
	value = musicVal
	AudioServer.set_bus_volume_db(1, value)
	saveAudio()

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	value = sfxVal
	AudioServer.set_bus_volume_db(2, value)
	saveAudio()

func _on_music_mute_button_toggled(toggled_on: bool) -> void:
	GameSounds.click.play()
	
	if toggled_on:
		AudioServer.set_bus_mute(1, true)
		saveAudio()
	else:
		AudioServer.set_bus_mute(1, false)
		saveAudio()

func _on_sfx_mute_button_toggled(toggled_on: bool) -> void:
	GameSounds.click.play()
	
	if toggled_on:
		AudioServer.set_bus_mute(2, true)
		saveAudio()
	else:
		AudioServer.set_bus_mute(2, false)
		saveAudio()

func saveAudio():
	SaveSystem.set_var("music", musicVal)
	SaveSystem.set_var("sfx", sfxVal)
	SaveSystem.save(GlobalVars.filePath)

func loadAudio():
	musicVal = SaveSystem.get_var("music", musicVal)
	sfxVal = SaveSystem.get_var("sfx", sfxVal)
