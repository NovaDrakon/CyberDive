extends Panel

var menuOpen = false

@onready var menuBox: Panel = $menuBox

func _on_start_button_pressed() -> void:
	menuOpen = !menuOpen
	
	if menuOpen:
		menuBox.show()
	else:
		menuBox.hide()
