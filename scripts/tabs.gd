extends HBoxContainer

var menuOpen = false

@onready var menuBox: Panel = $"../taskbar/menuBox"
@onready var startButton: Button = $startButton
@onready var starMailTab: Button = $starMailTab
@onready var cyberShopTab: Button = $cyberShopTab
@onready var dictionaryTab: Button = $dictionaryTab


func _on_start_button_pressed() -> void:
	menuOpen = true
	
	if menuOpen:
		menuBox.show()
	else:
		menuBox.hide()
	
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(false)


#Apps
func _on_star_mail_app_pressed() -> void:
	starMailTab.set_pressed(true)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(false)
	
	closeMenu()

func _on_cyber_dive_app_pressed() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(true)
	dictionaryTab.set_pressed(false)
	
	closeMenu()

func _on_dictionary_app_pressed() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(true)
	
	closeMenu()


#Tabs
func _on_star_mail_tab_pressed() -> void:
	starMailTab.set_pressed(true)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(false)
	
	closeMenu()

func _on_cyber_dive_tab_pressed() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(true)
	dictionaryTab.set_pressed(false)
	
	closeMenu()

func _on_dictionary_tab_pressed() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(true)
	
	closeMenu()


func closeMenu():
	startButton.set_pressed(false)
	menuBox.hide()
	menuOpen = false
