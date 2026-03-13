extends CharacterBody2D

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D

const speed := 180
const jump := -300
const gravity := 950
const accelertation := 900
const friction := 1000

const coyoteTime := 0.1
var coyoteTimer := 0.0

func handle_animation(direction: float) -> void:
	if direction:
		animatedSprite2D.flip_h = direction < 0
	
	if not is_on_floor():
		animatedSprite2D.play("Jump")
	
	if is_on_floor():
		animatedSprite2D.play("Idle")

func _physics_process(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor():
		coyoteTimer = coyoteTime
	else:
		coyoteTimer -= delta

	if Input.is_action_just_pressed("Jump"):
		$jumpBuffer.start()
	
	if Input.is_action_just_pressed("Jump") and coyoteTimer > 0:
		velocity.y = jump
		coyoteTimer = 0
	
	if is_on_floor() and !$jumpBuffer.is_stopped():
		velocity.y = jump
	
	var direction := Input.get_axis("Left", "Right")

	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, accelertation * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	
	handle_animation(direction)
	move_and_slide()
