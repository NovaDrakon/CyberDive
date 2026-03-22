extends CharacterBody2D
class_name WormEnemy

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
const gravity := 950

func _physics_process(delta):
	move_and_slide()
	
	if velocity.length() > 0:
		animatedSprite2D.play("Slither")
	else:
		animatedSprite2D.play("Idle")
	
	if velocity.x > 0:
		animatedSprite2D.flip_h = true
	else:
		animatedSprite2D.flip_h = false
	
	if not is_on_floor():
		velocity.y += gravity * delta
