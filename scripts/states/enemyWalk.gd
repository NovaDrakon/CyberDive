extends State
class_name Walk

@export var enemy: CharacterBody2D
@export var moveSpeed := 60.0
@onready var downRay: RayCast2D = $"../../AnimatedSprite2D/downRay"

var moveDirection: float
var wanderTime: float

func walk():
	moveDirection = randi_range(-1, 1)
	wanderTime = 1.5

func Enter():
	walk()

func Update(delta: float):
	if wanderTime > 0:
		wanderTime -= delta
	else:
		walk()

func PhysicsUpdate(_delta: float):
	if enemy:
		if not downRay.is_colliding():
			if moveDirection == 1:
				moveDirection = -1
			else:
				moveDirection = 1
			enemy.velocity.x = moveSpeed * moveDirection
