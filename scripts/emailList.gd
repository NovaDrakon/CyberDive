extends VBoxContainer

@export var emailButtons : ButtonGroup
@onready var topButtons: HBoxContainer = $"../topBarPanel/topButtons"
@onready var msgPanel: Panel = $"../emailPanel/msgPanel"

@onready var emailMsg0: Label = $"../emailPanel/msgPanel/emailMsg0"
@onready var emailMsg1: Label = $"../emailPanel/msgPanel/emailMsg1"
@onready var emailMsg2: Label = $"../emailPanel/msgPanel/emailMsg2"
@onready var emailMsg3: Label = $"../emailPanel/msgPanel/emailMsg3"
@onready var emailMsg4: Label = $"../emailPanel/msgPanel/emailMsg4"
@onready var emailMsg5: Label = $"../emailPanel/msgPanel/emailMsg5"

func _ready():
	for button in emailButtons.get_buttons():
		button.pressed.connect(_on_email_button_pressed.bind(button))

func _on_email_button_pressed(button):
	topButtons.show()
	msgPanel.show()
	
	var messages = [emailMsg0, emailMsg1, emailMsg2, emailMsg3, emailMsg4, emailMsg5]
	
	for msg in messages:
		msg.hide()

	match button.name:
		"email_0":
			messages[0].show()
		"email_1":
			messages[1].show()
		"email_2":
			messages[2].show()
		"email_3":
			messages[3].show()
		"email_4":
			messages[4].show()
		"email_5":
			messages[5].show()
