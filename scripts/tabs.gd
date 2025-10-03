extends HBoxContainer

var menuOpen = false

@onready var menu_box: Panel = $"../taskbar/menuBox"
@onready var start_button: Button = $startButton
@onready var star_mail_tab: Button = $starMailTab
@onready var cyber_dive_tab: Button = $cyberDiveTab
@onready var dictionary_tab: Button = $dictionaryTab

func _on_start_button_pressed() -> void:
	menuOpen = !menuOpen
	
	if menuOpen:
		menu_box.show()
	else:
		menu_box.hide()

func _on_star_mail_tab_pressed() -> void:
	pass

func _on_cyber_dive_tab_pressed() -> void:
	pass

func _on_dictionary_tab_pressed() -> void:
	pass
