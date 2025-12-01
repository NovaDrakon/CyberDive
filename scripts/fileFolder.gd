extends Area2D

@onready var folder: AnimatedSprite2D = $folder

func _on_body_entered(_body: Node2D) -> void:
	await get_tree().create_timer(0.3).timeout
	pass

func travel(xAxis, yAxis):
	pass
