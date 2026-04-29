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

@onready var email0: Button = $email_0
@onready var email1: Button = $email_1
@onready var email2: Button = $email_2
@onready var email3: Button = $email_3
@onready var email4: Button = $email_4
@onready var email5: Button = $email_5

var currentEmail := 0
var shopAvailable := false
var gameIntroDone := false

func _ready():
	for button in emailButtons.get_buttons():
		button.pressed.connect(_on_email_button_pressed.bind(button))
	
	var emails1 = [email0, email1, email2, email3, email4, email5]
	
	for mail in emails1:
		mail.hide()

func _process(_delta: float) -> void:
	loadEmail()
	
	var emails2 = [email0, email1, email2, email3, email4, email5]
	
	match currentEmail:
		0:
			emails2[0].show()
		1:
			emails2[1].show()
		2:
			emails2[2].show()
		3:
			emails2[3].show()
		4:
			emails2[4].show()
		5:
			emails2[5].show()
	
func _on_email_button_pressed(button):
	topButtons.show()
	msgPanel.show()
	
	var messages = [emailMsg0, emailMsg1, emailMsg2, emailMsg3, emailMsg4, emailMsg5]

	GameSounds.click.play()
	for msg in messages:
		msg.hide()

	match button.name:
		"email_0":
			messages[0].show()
			currentEmail = 1
			gameIntroDone = true
			finishIntro()
		"email_1":
			messages[1].show()
			currentEmail = 2
		"email_2":
			messages[2].show()
			currentEmail = 3
		"email_3":
			messages[3].show()
			currentEmail = 4
		"email_4":
			messages[4].show()
			currentEmail = 5
		"email_5":
			messages[5].show()
	saveEmail()

func _on_cyber_shop_download_pressed() -> void:
	shopAvailable = true
	saveShopStatus()

func finishIntro():
	SaveSystem.set_var("gameIntroDone", gameIntroDone)
	SaveSystem.save(GlobalVars.filePath)

func saveEmail():
	SaveSystem.set_var("currentEmail", currentEmail)
	SaveSystem.save(GlobalVars.filePath)

func loadEmail():
	currentEmail = SaveSystem.get_var("currentEmail", currentEmail)

func saveShopStatus():
	SaveSystem.set_var("shopAvailable", shopAvailable)
	SaveSystem.save(GlobalVars.filePath)
