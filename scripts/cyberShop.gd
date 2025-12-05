extends Window

@onready var starMailTab: Button = $"../CanvasLayer/tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/tabs/dictionaryTab"
@onready var bytesAmount: Button = $bytesAmount

var bytes = 50

func _ready() -> void:
	bytesAmount.text = str(bytes)

func _on_close_requested() -> void:
	GameSounds.click.play()
	self.hide()
	cyberShopTab.hide()

func _on_focus_entered() -> void:
	starMailTab.set_pressed(true)
	cyberShopTab.set_pressed(true)
	dictionaryTab.set_pressed(false)
