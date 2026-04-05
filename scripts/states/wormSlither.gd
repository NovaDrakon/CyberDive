extends State
class_name Slither

@export var enemy: CharacterBody2D
@export var moveSpeed := 40.0

@onready var sideRay: RayCast2D = $"../../sideRay"
@onready var downRay: RayCast2D = $"../../downRay"

var moveDirection = -1
var slitherTime: float
var player: CharacterBody2D

func walk():
	player = get_tree().get_first_node_in_group("Player")
	slitherTime = 1

func Enter():
	walk()

func Update(delta: float):
	if slitherTime > 0:
		slitherTime -= delta
	else:
		walk()

func PhysicsUpdate(_delta: float):
	if enemy:
		if not downRay.is_colliding() or sideRay.is_colliding():
			flipDirection()
			
		enemy.velocity.x = moveSpeed * moveDirection
	
	var direction_x = player.global_position.x - enemy.global_position.x
	
	if abs(direction_x) < 90 and enemy.is_on_floor():
		Transitioned.emit(self, "Chase")

func flipDirection():
	if moveDirection == 1:
		moveDirection = -1
		sideRay.set_rotation_degrees(90)
	else:
		moveDirection = 1
		sideRay.set_rotation_degrees(270)
	downRay.scale.x = -downRay.scale.x
