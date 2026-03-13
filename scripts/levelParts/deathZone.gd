extends Area2D

@onready var timer: Timer = $Timer
@onready var destination: Marker2D = $Destination

func _on_body_entered(body):
	Engine.time_scale = 0.6
	GameSounds.hurt.play()
	body.get_node("characterBody").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
