extends HBoxContainer

@onready var menuBox: Panel = $"../taskbar/menuBox"
@onready var starMail: Window = $"../../starMail"
@onready var cyberShop: Window = $"../../cyberShop"
@onready var cyberDive: Window = $"../../cyberDive"
@onready var dictionary: Window = $"../../dictionary"
@onready var startButton: Button = $startButton
@onready var starMailTab: Button = $starMailTab
@onready var cyberShopTab: Button = $cyberShopTab
@onready var cyberDiveTab: Button = $cyberDiveTab
@onready var dictionaryTab: Button = $dictionaryTab

#Start Menu
func _on_start_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		menuBox.show()
	else:
		menuBox.hide()

#Tabs
func _on_star_mail_tab_pressed() -> void:
	cyberShopTab.set_pressed(false)
	cyberDiveTab.set_pressed(false)
	dictionaryTab.set_pressed(false)
	closeMenu()
	
func _on_cyber_shop_tab_pressed() -> void:
	starMailTab.set_pressed(false)
	cyberDiveTab.set_pressed(false)
	dictionaryTab.set_pressed(false)
	closeMenu()

func _on_cyber_dive_tab_pressed() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(false)
	closeMenu()

func _on_dictionary_tab_pressed() -> void:
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(false)
	cyberDiveTab.set_pressed(false)
	closeMenu()

#Other Functions
func closeMenu():
	startButton.set_pressed(false)
	menuBox.hide()
