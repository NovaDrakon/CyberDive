extends Window

@onready var starMailTab: Button = $"../CanvasLayer/tabs/starMailTab"
@onready var cyberShopTab: Button = $"../CanvasLayer/tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../CanvasLayer/tabs/dictionaryTab"

@export var window: WindowData

func _ready() -> void:
	if window:
		window.mailOpen = false

func _on_close_requested() -> void:
	GameSounds.click.play()
	self.hide()
	starMailTab.hide()
	window.mailOpen = false

func _on_focus_entered() -> void:
	starMailTab.set_pressed(true)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(false)


func _on_debug_button_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file("res://scenes/debug1.tscn")

func _on_debug_button_2_pressed() -> void:
	GameSounds.click.play()
	get_tree().change_scene_to_file("res://scenes/debug2.tscn")
