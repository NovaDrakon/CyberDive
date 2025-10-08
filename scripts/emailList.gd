extends VBoxContainer

@onready var tutorialEmailButton: Button = $tutorialEmailButton
@onready var easyEmailButton: Button = $easyEmailButton
@onready var mediumEmailButton: Button = $mediumEmailButton
@onready var hardEmailButton: Button = $hardEmailButton
@onready var topButtons: HBoxContainer = $"../topBarPanel/topButtons"


func _on_tutorial_email_button_pressed() -> void:
	topButtons.show()
	
	easyEmailButton.set_pressed(false)
	mediumEmailButton.set_pressed(false)
	hardEmailButton.set_pressed(false)

func _on_easy_email_button_pressed() -> void:
	topButtons.show()
	
	tutorialEmailButton.set_pressed(false)
	mediumEmailButton.set_pressed(false)
	hardEmailButton.set_pressed(false)

func _on_medium_email_button_pressed() -> void:
	topButtons.show()
	
	tutorialEmailButton.set_pressed(false)
	easyEmailButton.set_pressed(false)
	hardEmailButton.set_pressed(false)

func _on_hard_email_button_pressed() -> void:
	topButtons.show()
	
	tutorialEmailButton.set_pressed(false)
	easyEmailButton.set_pressed(false)
	mediumEmailButton.set_pressed(false)
