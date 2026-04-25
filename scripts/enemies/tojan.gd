extends CharacterBody2D
class_name TrojanEnemy

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var interactSprite: AnimatedSprite2D = $interactSprite
@onready var folderRayL: RayCast2D = $folderRayL
@onready var folderRayR: RayCast2D = $folderRayR

func _ready() -> void:
	animatedSprite2D.play("Inactive")

func _process(_delta):
	if folderRayL.is_colliding() or folderRayR.is_colliding():
		interactSprite.show()
	else:
		interactSprite.hide()

func _physics_process(_delta):
	move_and_slide()
	
	if velocity.x > 0:
		animatedSprite2D.play("FloatR")
	elif velocity.x < 0:
		animatedSprite2D.play("FloatL")
	
	if velocity.x != 0:
		folderRayL.set_enabled(false)
		folderRayR.set_enabled(false)
