extends CharacterBody2D

@onready var bottomHalf: AnimatedSprite2D = $bottomHalf
@onready var topHalf: AnimatedSprite2D = $topHalf

var speed = 250
var jump = -300

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("Left", "Right")
	
	if direction < 0:
		bottomHalf.play("leftIdle")
		topHalf.play("leftIdle")
	elif direction > 0:
		bottomHalf.play("rightIdle")
		topHalf.play("rightIdle")
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump
		
	if Input.is_action_just_pressed("Dash") and is_on_floor():
		velocity.x = direction * speed * 1.5
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()
