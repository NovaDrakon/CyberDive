extends State
class_name Float

@export var enemy: CharacterBody2D
@export var moveSpeed := 50.0

var player: CharacterBody2D

var moveDirection: Vector2
var floatTime: float

func walk():
	moveDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	floatTime = randf_range(0, 1.5)

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	walk()

func Update(delta: float):
	if floatTime > 0:
		floatTime -= delta
	else:
		walk()

func PhysicsUpdate(_delta: float):
	if enemy:
		enemy.velocity = moveSpeed * moveDirection
	
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < 90:
		Transitioned.emit(self, "Chase")
