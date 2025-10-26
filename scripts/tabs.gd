extends HBoxContainer

@onready var menuBox: Panel = $"../taskbar/menuBox"
@onready var startButton: Button = $startButton

@onready var starMailTab: Button = $starMailTab
@onready var cyberShopTab: Button = $cyberShopTab
@onready var cyberDiveTab: Button = $cyberDiveTab
@onready var dictionaryTab: Button = $dictionaryTab

@onready var starMail: Window = $"../../starMail"
@onready var cyberShop: Window = $"../../cyberShop"
@onready var cyberDive: Window = $"../../cyberDive"
@onready var dictionary: Window = $"../../dictionary"

#Start Menu
func _on_start_button_toggled(toggled_on: bool) -> void:
	var tabs = [starMailTab, cyberShopTab, cyberDiveTab, dictionaryTab]
	
	if toggled_on:
		menuBox.show()
		
		for tab in tabs:
			tab.set_pressed(false)
	else:
		menuBox.hide()

#Tabs
func _on_star_mail_tab_pressed() -> void:
	starMail.grab_focus()
	closeMenu()
	
func _on_cyber_shop_tab_pressed() -> void:
	cyberShop.grab_focus()
	closeMenu()

func _on_cyber_dive_tab_pressed() -> void:
	cyberDive.grab_focus()
	closeMenu()

func _on_dictionary_tab_pressed() -> void:
	dictionary.grab_focus()
	closeMenu()

#Other Functions
func closeMenu():
	startButton.set_pressed(false)
	menuBox.hide()
