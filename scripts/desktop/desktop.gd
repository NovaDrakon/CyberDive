extends Control

@onready var cyberShopApp: TextureButton = $CanvasLayer/apps/cyberShopApp

var shopAvailable: bool

func _process(_delta: float) -> void:
	loadShopStatus()
		
	if shopAvailable:
		cyberShopApp.show()
	else:
		cyberShopApp.hide()

func loadShopStatus():
	shopAvailable = SaveSystem.get_var("shopAvailable", shopAvailable)
