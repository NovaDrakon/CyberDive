extends Node2D

@onready var desktop_menu_bg: TextureRect = $CanvasLayer/desktopMenuBG
@onready var desktop_menu_buttons: VBoxContainer = $CanvasLayer/desktopMenuButtons
@onready var settings: TextureButton = $CanvasLayer/desktopMenuButtons/settings

@onready var start_menu_button: TextureButton = $CanvasLayer/appTabs/startMenuButton
@onready var star_mail_tab: TextureButton = $CanvasLayer/appTabs/starMailWindow
@onready var cyber_dive_tab: TextureButton = $CanvasLayer/appTabs/cyberDiveWindow
@onready var dictionary_tab: TextureButton = $CanvasLayer/appTabs/dictionaryWindow


#Start Menu
func _on_start_menu_button_pressed() -> void:
	if start_menu_button.button_pressed == true:
		desktop_menu_bg.show()
		desktop_menu_buttons.show()
	else:
		desktop_menu_bg.hide()
		desktop_menu_buttons.hide()
	
	star_mail_tab.set_pressed_no_signal(false)
	cyber_dive_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)

func _on_settings_pressed() -> void:
	pass

func _on_shut_down_pressed() -> void:
	get_tree().quit()


#Apps
func _on_star_mail_pressed() -> void:
	star_mail_tab.show()
	star_mail_tab.set_pressed(true)
	
	start_menu_button.set_pressed_no_signal(false)
	desktop_menu_bg.hide()
	desktop_menu_buttons.hide()
		
	cyber_dive_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)

func _on_cyber_dive_pressed() -> void:
	cyber_dive_tab.show()
	cyber_dive_tab.set_pressed(true)
	
	start_menu_button.set_pressed_no_signal(false)
	desktop_menu_bg.hide()
	desktop_menu_buttons.hide()
		
	star_mail_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)

func _on_dictonary_pressed() -> void:
	dictionary_tab.show()
	dictionary_tab.set_pressed(true)
	
	start_menu_button.set_pressed_no_signal(false)
	desktop_menu_bg.hide()
	desktop_menu_buttons.hide()
		
	cyber_dive_tab.set_pressed_no_signal(false)
	star_mail_tab.set_pressed_no_signal(false)


#App Tabs
func _on_star_mail_tab_pressed() -> void:
	start_menu_button.set_pressed_no_signal(false)
	desktop_menu_bg.hide()
	desktop_menu_buttons.hide()
		
	cyber_dive_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)

func _on_cyber_dive_tab_pressed() -> void:
	start_menu_button.set_pressed_no_signal(false)
	desktop_menu_bg.hide()
	desktop_menu_buttons.hide()
	
	star_mail_tab.set_pressed_no_signal(false)
	dictionary_tab.set_pressed_no_signal(false)

func _on_dictionary_tab_pressed() -> void:
	start_menu_button.set_pressed_no_signal(false)
	desktop_menu_bg.hide()
	desktop_menu_buttons.hide()
	
	star_mail_tab.set_pressed_no_signal(false)
	cyber_dive_tab.set_pressed_no_signal(false)
