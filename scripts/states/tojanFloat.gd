extends State
class_name Float

@export var enemy: CharacterBody2D
@export var moveSpeed := 60.0
@onready var sideRay: RayCast2D = $"../../sideRay"

var moveDirection = -1
var wanderTime: float

func walk():
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
		if sideRay.is_colliding():
			if moveDirection == 1:
				moveDirection = -1
				sideRay.set_rotation_degrees(90)
			else:
				moveDirection = 1
				sideRay.set_rotation_degrees(270)
		
		enemy.velocity.x = moveSpeed * moveDirection * 0
