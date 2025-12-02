extends HBoxContainer

@onready var menuBox: Panel = $"../taskbar/menuBox"
@onready var settingButton: Button = $"../taskbar/menuBox/settingButton"
@onready var startButton: Button = $startButton

@onready var starMailTab: Button = $starMailTab
@onready var cyberShopTab: Button = $cyberShopTab
@onready var dictionaryTab: Button = $dictionaryTab

@onready var starMail: Window = $"../../starMail"
@onready var cyberShop: Window = $"../../cyberShop"
@onready var dictionary: Window = $"../../dictionary"

#Start Menu
func _on_start_button_toggled(toggled_on: bool) -> void:
	var tabs = [starMailTab, cyberShopTab, dictionaryTab]
	
	if toggled_on:
		menuBox.show()
		
		for tab in tabs:
			tab.set_pressed(false)
	else:
		menuBox.hide()
		settingButton.set_pressed(false)

#Tabs
func _on_star_mail_tab_pressed() -> void:
	starMail.grab_focus()
	closeMenu()
	
func _on_cyber_shop_tab_pressed() -> void:
	cyberShop.grab_focus()
	closeMenu()

func _on_dictionary_tab_pressed() -> void:
	dictionary.grab_focus()
	closeMenu()

#Other Functions
func closeMenu():
	startButton.set_pressed(false)
	menuBox.hide()
