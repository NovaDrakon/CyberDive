extends State
class_name Float

@export var enemy: CharacterBody2D
@export var moveSpeed := 50.0

@onready var sideRay: RayCast2D = $"../../sideRay"

var moveDirection = -1
var floatTime: float

func walk():
	floatTime = 1

func Enter():
	walk()

func Update(delta: float):
	if floatTime > 0:
		floatTime -= delta
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
		
		enemy.velocity.x = moveSpeed * moveDirection
