extends VBoxContainer

@onready var menu_box: Panel = $"../taskbar/menuBox"
@onready var start_button: Button = $"../Tabs/startButton"
@onready var spacer: Label = $"../Tabs/spacer"
@onready var star_mail_tab: Button = $"../Tabs/starMailTab"
@onready var spacer_2: Label = $"../Tabs/spacer2"
@onready var cyber_dive_tab: Button = $"../Tabs/cyberDiveTab"
@onready var spacer_3: Label = $"../Tabs/spacer3"
@onready var dictionary_tab: Button = $"../Tabs/dictionaryTab"

@onready var star_mail: Window = $"../../starMail"
@onready var cyber_dive: Window = $"../../cyberDive"
@onready var dictionary: Window = $"../../dictionary"

func _on_star_mail_pressed() -> void:
	spacer.show()
	star_mail_tab.show()
	star_mail_tab.set_pressed_no_signal(true)
	
	menu_box.hide()
	start_button.set_pressed_no_signal(false)
	cyber_dive_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)
	
	star_mail.show()

func _on_cyber_dive_pressed() -> void:
	spacer_2.show()
	cyber_dive_tab.show()
	cyber_dive_tab.set_pressed_no_signal(true)
	
	menu_box.hide()
	start_button.set_pressed_no_signal(false)
	star_mail_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)
	
	cyber_dive.show()
	
func _on_dictionary_pressed() -> void:
	spacer_3.show()
	dictionary_tab.show()
	dictionary_tab.set_pressed_no_signal(true)
	
	menu_box.hide()
	start_button.set_pressed_no_signal(false)
	star_mail_tab.set_pressed_no_signal(false)
	cyber_dive_tab.set_pressed_no_signal(false)
	
	dictionary.show()
