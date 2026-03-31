extends State
class_name Float

@export var enemy: CharacterBody2D
@export var moveSpeed := 50.0

var moveDirection: Vector2
var floatTime: float

func walk():
	moveDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	floatTime = randf_range(0, 1.5)

func Enter():
	walk()

func Update(delta: float):
	if floatTime > 0:
		floatTime -= delta
	else:
		walk()

func PhysicsUpdate(_delta: float):
	if enemy:
		enemy.velocity = moveSpeed * moveDirection
