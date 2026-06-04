extends Panel

@onready var musicVolumeSlider: HSlider = $musicVolumeSlider
@onready var sfxVolumeSlider: HSlider = $sfxVolumeSlider

var musicVolume := 6.0
var sfxVolume := 6.0

func _ready() -> void:
	loadAudio()

func _on_music_volume_slider_value_changed(value: float) -> void:
	musicVolume = value
	AudioServer.set_bus_volume_db(1, musicVolume)
	saveAudio()


func _on_sfx_volume_slider_value_changed(value: float) -> void:
	sfxVolume = value
	AudioServer.set_bus_volume_db(2, sfxVolume)
	saveAudio()

func saveAudio():
	SaveSystem.set_var("musicVolume", musicVolume)
	SaveSystem.set_var("sfxVolume", sfxVolume)
	SaveSystem.save(GlobalVars.filePath)

func loadAudio():
	musicVolumeSlider.value = SaveSystem.get_var("musicVolume", musicVolume)
	sfxVolumeSlider.value = SaveSystem.get_var("sfxVolume", sfxVolume)
