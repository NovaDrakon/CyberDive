extends CharacterBody2D

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D

func handle_animation(direction: float) -> void:
	if direction:
		animatedSprite2D.flip_h = direction < 0
	
	

func _process(_delta: float) -> void:
	var direction := Input.get_axis("Left", "Right")
	
	if not is_on_floor():
		animatedSprite2D.play("Jump")
	
	if velocity.x == 0:
		animatedSprite2D.play("Idle")
	
	handle_animation(direction)

func _physics_process(_delta: float):
	move_and_slide()
