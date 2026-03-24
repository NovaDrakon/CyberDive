extends CharacterBody2D
class_name TrojanEnemy

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var animatedSprite2D2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var folderRayL: RayCast2D = $folderRayL
@onready var folderRayR: RayCast2D = $folderRayR

func _process(_delta):
	if folderRayL.is_colliding() or folderRayR.is_colliding():
		animatedSprite2D2.show()
	else:
		animatedSprite2D2.hide()

func _physics_process(_delta):
	move_and_slide()
	
	if velocity.length() > 0:
		animatedSprite2D.play("Float")
	else:
		animatedSprite2D.play("Inactive")
	
	if velocity.x > 0:
		animatedSprite2D.flip_h = true
	else:
		animatedSprite2D.flip_h = false
