extends CharacterBody2D
class_name BossEnemy

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
const gravity := 950

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if velocity.length() > 0:
		if velocity.x > 0:
			animationPlayer.play("WalkR")
		else:
			animationPlayer.play("WalkL")
	
	if velocity.x == 0:
		animationPlayer.play("Idle")

	move_and_slide()
