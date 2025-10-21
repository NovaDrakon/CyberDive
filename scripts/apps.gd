extends VBoxContainer

@onready var starMail: Window = $"../../starMail"
@onready var cyberShop: Window = $"../../cyberShop"
@onready var dictionary: Window = $"../../dictionary"
@onready var starMailTab: Button = $"../tabs/starMailTab"
@onready var cyberShopTab: Button = $"../tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../tabs/dictionaryTab"

func _on_star_mail_app_pressed() -> void:
	starMail.show()
	starMailTab.show()
	
	starMailTab.set_pressed(true)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(false)

func _on_cyber_shop_app_pressed() -> void:
	cyberShop.show()
	cyberShopTab.show()
	
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(true)
	dictionaryTab.set_pressed(false)
	
func _on_dictionary_app_pressed() -> void:
	dictionary.show()
	dictionaryTab.show()
	
	starMailTab.set_pressed(false)
	cyberShopTab.set_pressed(false)
	dictionaryTab.set_pressed(true)
