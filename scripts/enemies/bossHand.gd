extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	if GlobalVars.health > 0:
		GlobalVars.health -= 30
		updateHealth()

func updateHealth():
	SaveSystem.set_var("health", GlobalVars.health)
	SaveSystem.save(GlobalVars.filePath)
