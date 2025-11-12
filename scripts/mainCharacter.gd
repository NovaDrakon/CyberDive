extends CharacterBody2D

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D

var speed = 200
var jump = -295

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("Left", "Right")
	
	if direction > 0:
		animatedSprite2D.flip_h = false
	elif  direction < 0:
		animatedSprite2D.flip_h = true
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		animatedSprite2D.play("Jump")
		velocity.y = jump
		await get_tree().create_timer(0.65).timeout
		animatedSprite2D.play("Idle")

	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()
