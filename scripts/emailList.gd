extends VBoxContainer

@export var emailButtons : ButtonGroup
@onready var topButtons: HBoxContainer = $"../topBarPanel/topButtons"
@onready var msgPanel: Panel = $"../emailPanel/msgPanel"

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
	
	var messages = [emailMsg1, emailMsg2, emailMsg3, emailMsg4, emailMsg5]
	
	for msg in messages:
		msg.hide()

	match button.name:
		"email_0":
			emailMsg1.show()
		"email_1":
			emailMsg2.show()
		"email_2":
			emailMsg3.show()
		"email_3":
			emailMsg4.show()
		"email_4":
			emailMsg5.show()
