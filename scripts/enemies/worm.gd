extends CharacterBody2D
class_name WormEnemy

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
const gravity := 950

func handle_animation(direction: float) -> void:
	if direction:
		animatedSprite2D.flip_h = direction < 0
	
	if not is_on_floor():
		animatedSprite2D.play("Jump")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if velocity.length() > 0:
		animatedSprite2D.play("Walk")
	else:
		animatedSprite2D.play("Idle")

	move_and_slide()
