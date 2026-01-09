extends Node

var savePath = "user://gameData.save"
var file = FileAccess.open(savePath, FileAccess.WRITE)
var savedNodes = get_tree().get_nodes_in_group("Persist")

var health: int = 100
var speed: int = 200
var jump: int = 150

var timeNum: String = "X"
var timeLabel: String = "X"

var bytes: int = 50
var mailOpen: bool = false
var shopOpen: bool = false
var dictionOpen: bool = false

func saveData():
	#Character
	file.store_8(health)
	file.store_8(speed)
	file.store_8(jump)
	
	#Time
	file.store_line(timeNum)
	file.store_line(timeLabel)
	
	#Main Menu
	file.store_32(bytes)
	

func loadData():
	if not FileAccess.file_exists(savePath):
		return
