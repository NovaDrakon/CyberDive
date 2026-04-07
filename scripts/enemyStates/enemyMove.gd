extends State
class_name EnemyMove

@export var enemy: CharacterBody2D
@export var moveType: MoveType
@export var moveSpeed: int
@export var chaseDistance: int

@onready var sideRay: RayCast2D = $"../../sideRay"
@onready var downRay: RayCast2D = $"../../downRay"

enum MoveType {
	Walk,
	WalkJump,
	Float
}

var player: CharacterBody2D
var xDirection = -1
var xyDirection: Vector2
var moveTime: float

var jumpChance: float
var jump := -350
var bounces := 0

func move():
	match moveType:
		MoveType.Float:
			xyDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
			moveTime = 1.5
		MoveType.WalkJump or MoveType.Walk:
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
	match moveType:
		MoveType.Float:
			enemy.velocity.x = moveSpeed * xDirection
		
		MoveType.WalkJump:
			if enemy.position.y > 0:
				jump = 0
			else:
				jump = -300
		
			if not downRay.is_colliding():
				Jump()
			
			if sideRay.is_colliding():
				flipDirection()
			
			enemy.velocity.x = moveSpeed * xDirection
		
		MoveType.Walk:
			if not downRay.is_colliding() or sideRay.is_colliding():
				flipDirection()
			
			enemy.velocity.x = moveSpeed * xDirection
	
	var distance = player.global_position.x - enemy.global_position.x
	
	if moveType == MoveType.Float:
		if abs(distance) < chaseDistance:
			Transitioned.emit(self, "Chase")
	else:
		if abs(distance) < chaseDistance and enemy.is_on_floor():
			Transitioned.emit(self, "Chase")

func flipDirection():
	if xDirection == 1:
		xDirection = -1
		sideRay.set_rotation_degrees(90)
	else:
		xDirection = 1
		sideRay.set_rotation_degrees(270)
	downRay.scale.x = -downRay.scale.x

func Jump():
	jumpChance = randi_range(0, 1)
	if enemy.is_on_floor() and bounces == 2:
		enemy.velocity.y = jump
		bounces = 0
	elif enemy.is_on_floor() and jumpChance == 1:
		enemy.velocity.y = jump
	elif enemy.is_on_floor() and jumpChance == 0:
		flipDirection()
