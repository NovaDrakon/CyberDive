extends Control

@onready var cyberShopApp: TextureButton = $CanvasLayer/apps/cyberShopApp
@onready var emailNotif: Sprite2D = $CanvasLayer/emailNotif

var shopAvailable: bool
var gameIntroDone: bool

func _process(_delta: float) -> void:
	loadStatus()
	
	if shopAvailable:
		cyberShopApp.show()
	else:
		cyberShopApp.hide()
	
	if gameIntroDone:
		emailNotif.hide()

func loadStatus():
	shopAvailable = SaveSystem.get_var("shopAvailable", shopAvailable)
	gameIntroDone = SaveSystem.get_var("gameIntroDone", gameIntroDone)
