extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_body_entered(_body: Node2D) -> void:
	GameSounds.mainLevelMusic.stop()
	GameSounds.bossMusic.play()
