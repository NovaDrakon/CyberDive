extends CharacterBody2D

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D

func handle_animation(direction: float) -> void:
	if direction:
		animatedSprite2D.flip_h = direction < 0
	
	if not is_on_floor():
		animatedSprite2D.play("Jump")

func _process(_delta: float) -> void:
	var direction := Input.get_axis("Left", "Right")
		
	handle_animation(direction)

func _physics_process(_delta: float):
	move_and_slide()
