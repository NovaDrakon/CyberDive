class_name SaveGame
extends Resource

const savePath = "res://saveLoadSystem/saveGame.tres"

@export var bytes := 0

func write_savegame() -> void:
	ResourceSaver.save(self, savePath)

static func save_exists() -> bool:
	return ResourceLoader.exists(savePath)

static func load_savegame() -> SaveGame:
	return ResourceLoader.load(savePath, "", ResourceLoader.CACHE_MODE_IGNORE)
