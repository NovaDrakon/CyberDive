extends Panel

var menuOpen = false

@onready var menu_box: Panel = $menuBox
@onready var start_button: Button = $"../Tabs/startButton"
@onready var star_mail_tab: Button = $"../Tabs/starMailTab"
@onready var cyber_dive_tab: Button = $"../Tabs/cyberDiveTab"
@onready var dictionary_tab: Button = $"../Tabs/dictionaryTab"

func _on_start_button_pressed() -> void:
	menuOpen = !menuOpen
	
	if menuOpen:
		menu_box.show()
	else:
		menu_box.hide()
		
	star_mail_tab.set_pressed_no_signal(false)
	cyber_dive_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)

func _on_star_mail_tab_pressed() -> void:
	menu_box.hide()
	start_button.set_pressed_no_signal(false)
	cyber_dive_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)

func _on_cyber_dive_tab_pressed() -> void:
	menu_box.hide()
	start_button.set_pressed_no_signal(false)
	star_mail_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)

func _on_dictionary_tab_pressed() -> void:
	menu_box.hide()
	start_button.set_pressed_no_signal(false)
	star_mail_tab.set_pressed_no_signal(false)
	cyber_dive_tab.set_pressed_no_signal(false)
