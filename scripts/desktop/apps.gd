extends Control

@onready var menuBox: Panel = $"../taskbar/menuBox"
@onready var startButton: Button = $"../tabs/startButton"

@onready var starMail: Window = $"../../starMail"
@onready var cyberShop: Window = $"../../cyberShop"

@onready var starMailTab: Button = $"../tabs/starMailTab"
@onready var cyberShopTab: Button = $"../tabs/cyberShopTab"


func _on_star_mail_app_pressed() -> void:
	GameSounds.click.play()
	starMail.show()
	starMail.grab_focus()
	starMailTab.set_pressed(true)
	starMailTab.show()
	closeMenu()

func _on_cyber_shop_app_pressed() -> void:
	GameSounds.click.play()
	cyberShop.show()
	cyberShop.grab_focus()
	cyberShopTab.set_pressed(true)
	cyberShopTab.show()
	closeMenu()

func closeMenu():
	startButton.set_pressed(false)
	menuBox.hide()
