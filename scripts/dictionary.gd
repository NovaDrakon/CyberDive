extends Window

@onready var starMailTab: Button = $"../CanvasLayer/tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/tabs/dictionaryTab"

var dictionOpen := false

func _ready() -> void:
	loadDictionWindow()
	if dictionOpen == true:
		self.show()
		dictionaryTab.show()
		dictionaryTab.set_pressed(true)
	else:
		self.hide()
		dictionaryTab.hide()
		dictionaryTab.set_pressed(false)

func _on_close_requested() -> void:
	GameSounds.click.play()
	self.hide()
	dictionaryTab.hide()
	dictionOpen = false
	saveDictionWindow()

func _on_focus_entered() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(true)
	dictionOpen = true
	saveDictionWindow()

func saveDictionWindow():
	SaveSystem.set_var("diction", dictionOpen)
	SaveSystem.save(GlobalVars.filePath)

func loadDictionWindow():
	dictionOpen = SaveSystem.get_var("diction", dictionOpen)
