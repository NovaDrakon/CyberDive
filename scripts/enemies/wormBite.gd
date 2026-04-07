extends Area2D

@onready var collisionShape2D: CollisionShape2D = $CollisionShape2D
@onready var animatedSprite2D: AnimatedSprite2D = $"../AnimatedSprite2D"

func _process(_delta: float) -> void:
	if self.is_visible():
		collisionShape2D.set_disabled(false)
		animatedSprite2D.play("Bite")
	else:
		collisionShape2D.set_disabled(true)

func _on_body_entered(_body: Node2D) -> void:
	if GlobalVars.health > 0:
		GlobalVars.health -= 10
		updateHealth()

func updateHealth():
	SaveSystem.set_var("health", GlobalVars.health)
	SaveSystem.save(GlobalVars.filePath)
