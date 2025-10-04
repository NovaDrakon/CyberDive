extends Window

@onready var starMailTab: Button = $"../CanvasLayer/Tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/Tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/Tabs/dictionaryTab"

func _on_close_requested() -> void:
	self.hide()
	cyberShopTab.hide()

func _on_focus_entered() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(true)
	dictionaryTab.set_pressed(false)
