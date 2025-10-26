extends Window

@onready var starMailTab: Button = $"../CanvasLayer/tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/tabs/dictionaryTab"
@onready var cyberDiveTab: Button = $"../CanvasLayer/tabs/cyberDiveTab"

func _on_close_requested() -> void:
	self.hide()
	starMailTab.hide()

func _on_focus_entered() -> void:
	starMailTab.set_pressed(true)
	cyberShopTab.set_pressed(false)
	cyberDiveTab.set_pressed(false)
	dictionaryTab.set_pressed(false)
