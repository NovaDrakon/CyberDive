extends State
class_name BossMove

@export var enemy: CharacterBody2D
@export var moveSpeed: int
@export var chaseDistance: Vector2

@onready var sideRay: RayCast2D = $"../../sideRay"
@onready var downRay: RayCast2D = $"../../downRay"

var player: CharacterBody2D
var xDirection = -1
var moveTime: float

func move():
	moveTime = 1

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	move()

func Update(delta: float):
	if moveTime > 0:
		moveTime -= delta
	else:
		move()

func PhysicsUpdate(_delta: float):
	if not downRay.is_colliding() or sideRay.is_colliding():
		flipDirection()

	enemy.velocity.x = moveSpeed * xDirection
	
	var distance = player.global_position - enemy.global_position
	
	if abs(distance) < chaseDistance and enemy.is_on_floor():
		Transitioned.emit(self, "Chase")

func flipDirection():
	if xDirection == 1:
		xDirection = -1
	else:
		xDirection = 1
