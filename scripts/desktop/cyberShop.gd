extends Window

@onready var starMailTab: Button = $"../CanvasLayer/tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/tabs/dictionaryTab"
@onready var bytesAmount: Button = $bytesAmount

var shopOpen := false

func _ready() -> void:
	loadShopWindow()
	
	if shopOpen == true:
		self.show()
		cyberShopTab.show()
		cyberShopTab.set_pressed(true)
	else:
		self.hide()
		cyberShopTab.hide()
		cyberShopTab.set_pressed(false)

func _on_close_requested() -> void:
	GameSounds.click.play()
	self.hide()
	cyberShopTab.hide()
	shopOpen = false
	saveShopWindow()

func _on_focus_entered() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(true)
	dictionaryTab.set_pressed(false)
	shopOpen = true
	saveShopWindow()

func saveShopWindow():
	SaveSystem.set_var("shop", shopOpen)
	SaveSystem.save(GlobalVars.filePath)
	
func loadShopWindow():
	shopOpen = SaveSystem.get_var("shop", shopOpen)
