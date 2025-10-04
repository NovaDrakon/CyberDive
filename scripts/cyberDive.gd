extends Window

@onready var cyberDiveTab: Button = $CanvasLayer/Tabs/cyberDiveTab

func _on_close_requested() -> void:
	self.hide()
	cyberDiveTab.hide()

func _on_focus_entered() -> void:
	pass
