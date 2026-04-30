extends Area2D

@onready var collisionShape2D: CollisionShape2D = $CollisionShape2D
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var animatedSprite2D: AnimatedSprite2D = $"../AnimatedSprite2D"

func _process(_delta: float) -> void:
	if self.is_visible():
		collisionShape2D.set_disabled(false)
		if animatedSprite2D.is_flipped_h():
			animationPlayer.play("SlashL")
		else:
			animationPlayer.play("SlashR")
	else:
		collisionShape2D.set_disabled(true)

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Enemy"):
		pass
