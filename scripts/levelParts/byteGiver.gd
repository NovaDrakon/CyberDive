extends Area2D

@export var bytesGained: int
@onready var collisionShape2D: CollisionShape2D = $CollisionShape2D
var bytes: int

func _on_body_entered(_body: Node2D) -> void:
	bytes += bytesGained
	saveBytes()
	collisionShape2D.set_disabled(true)

func saveBytes():
	SaveSystem.set_var("bytes", bytes)
	SaveSystem.save(GlobalVars.filePath)
