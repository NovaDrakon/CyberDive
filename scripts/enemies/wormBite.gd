extends Area2D

@onready var collisionShape2D: CollisionShape2D = $CollisionShape2D
@onready var animatedSprite2D: AnimatedSprite2D = $"../AnimatedSprite2D"

var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func _process(_delta: float) -> void:
	if self.global_position.x > player.global_position.x:
			self.position.x = -13
	elif self.global_position.x < player.global_position.x:
			self.position.x = 13
	
	if self.is_visible():
		collisionShape2D.set_disabled(false)
		if self.global_position.x > player.global_position.x:
			animatedSprite2D.flip_h = false
		elif self.global_position.x < player.global_position.x:
			animatedSprite2D.flip_h = true
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
