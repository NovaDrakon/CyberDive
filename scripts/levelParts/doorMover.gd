extends AnimationPlayer

@onready var openCollision: CollisionShape2D = $"../doorOpener/openCollision"
@onready var closeCollision: CollisionShape2D = $"../doorCloser/closeCollision"

func _on_door_opener_body_entered(_body: Node2D) -> void:
	self.play("Open")
	await get_tree().create_timer(2).timeout
	openCollision.set_disabled(true)


func _on_door_closer_body_entered(_body: Node2D) -> void:
	self.play("Close")
	await get_tree().create_timer(2).timeout
	closeCollision.set_disabled(true)
