class_name WindowData
extends Resource

@export var mailOpen: bool
@export var shopOpen: bool
@export var dictionOpen: bool

func _init(mailOpen_s = null, shopOpen_s = null, dictionOpen_s = null) -> void:
	mailOpen = mailOpen_s
	shopOpen = shopOpen_s
	dictionOpen = dictionOpen_s
