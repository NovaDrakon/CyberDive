extends VBoxContainer

@onready var starMail: Window = $"../../starMail"
@onready var cyberShop: Window = $"../../cyberShop"
@onready var dictionary: Window = $"../../dictionary"

@onready var starMailTab: Button = $"../Tabs/starMailTab"
@onready var cyberShopTab: Button = $"../Tabs/cyberShopTab"
@onready var dictionaryTab: Button = $"../Tabs/dictionaryTab"

func _on_star_mail_pressed() -> void:
	starMail.show()
	starMailTab.show()

func _on_cyber_dive_pressed() -> void:
	cyberShop.show()
	cyberShopTab.show()
	
func _on_dictionary_pressed() -> void:
	dictionary.show()
	dictionaryTab.show()
