extends Control

var menuOpen = false

@onready var desktop_menu_bg: TextureRect = $CanvasLayer/desktopMenuBG
@onready var desktop_menu_buttons: VBoxContainer = $CanvasLayer/desktopMenuButtons

#Start Menu
func _on_start_menu_button_pressed() -> void:
	menuOpen = !menuOpen
	
	if menuOpen == true:
		desktop_menu_bg.show()
		desktop_menu_buttons.show()
	else:
		desktop_menu_bg.hide()
		desktop_menu_buttons.hide()

func _on_settings_pressed() -> void:
	pass

func _on_shut_down_pressed() -> void:
	get_tree().quit()


#Apps
func _on_star_mail_pressed() -> void:
	pass

func _on_cyber_dive_pressed() -> void:
	pass

func _on_dictonary_pressed() -> void:
	pass


#App Tabs
func _on_star_mail_tab_pressed() -> void:
	pass

func _on_cyber_dive_tab_pressed() -> void:
	pass

func _on_dictionary_tab_pressed() -> void:
	pass
