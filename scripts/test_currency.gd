extends Area2D

@onready var collisionShape2D: CollisionShape2D = $CollisionShape2D
@onready var sprite2D: Sprite2D = $Sprite2D

func _on_body_entered(_body: Node2D) -> void:
	GlobalVars.bytes += 5
	saveBytes()
	queue_free()
	
func saveBytes():
	SaveSystem.set_var("bytes", GlobalVars.bytes)
	SaveSystem.save(GlobalVars.filePath)
