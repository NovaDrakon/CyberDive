class_name SaveGame
extends Resource

const savePath = "res://saveLoadSystem/saveGame.tres"

@export var time: Resource
@export var windows: Resource

func write_savegame() -> void:
	ResourceSaver.save(self, savePath)

static func load_savegame() -> SaveGame:
	if ResourceLoader.exists(savePath):
		return load(savePath)
	return null
