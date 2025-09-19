extends Control

@onready var click: AudioStreamPlayer2D = $click

func _on_start_button_pressed() -> void:
	click.play()
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://scenes/loadingScreen.tscn")

func _on_settings_button_pressed() -> void:
	click.play()
