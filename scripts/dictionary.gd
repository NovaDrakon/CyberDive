extends Window

@onready var starMailTab: Button = $"../CanvasLayer/tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/tabs/dictionaryTab"


func _on_close_requested() -> void:
	GameSounds.click.play()
	self.hide()
	dictionaryTab.hide()

func _on_focus_entered() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(true)
