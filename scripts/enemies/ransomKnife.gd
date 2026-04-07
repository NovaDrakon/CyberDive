extends Area2D

@onready var collisionShape2D: CollisionShape2D = $CollisionShape2D
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

func _process(_delta: float) -> void:
	if self.is_visible():
		collisionShape2D.set_disabled(false)
		animationPlayer.play("Slash")
	else:
		collisionShape2D.set_disabled(true)

func _on_body_entered(_body: Node2D) -> void:
	if GlobalVars.health > 0:
		GlobalVars.health -= 10
		updateHealth()

func updateHealth():
	SaveSystem.set_var("health", GlobalVars.health)
	SaveSystem.save(GlobalVars.filePath)
