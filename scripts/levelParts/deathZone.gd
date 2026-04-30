extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body):
	Engine.time_scale = 0.5
	GameSounds.hurt.play()
	GlobalVars.health = 100
	updateHealth()
	body.get_node("characterBody").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()

func updateHealth():
	SaveSystem.set_var("health", GlobalVars.health)
	SaveSystem.save(GlobalVars.filePath)
