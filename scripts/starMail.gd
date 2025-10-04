extends Window

@onready var starMailTab: Button = $"../CanvasLayer/Tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/Tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/Tabs/dictionaryTab"

func _on_close_requested() -> void:
	self.hide()
	starMailTab.hide()

func _on_focus_entered() -> void:
	starMailTab.set_pressed(true)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(false)
