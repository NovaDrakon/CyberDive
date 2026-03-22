extends CharacterBody2D
class_name TrojanEnemy

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta):
	move_and_slide()
	
	if velocity.length() > 0:
		animatedSprite2D.play("Float")
	else:
		animatedSprite2D.play("Float")
	
	if velocity.x > 0:
		animatedSprite2D.flip_h = true
	else:
		animatedSprite2D.flip_h = false
	
