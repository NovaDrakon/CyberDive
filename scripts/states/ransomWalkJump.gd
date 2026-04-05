extends State
class_name WalkJump

@export var enemy: CharacterBody2D
@export var moveSpeed := 70.0

@onready var sideRay: RayCast2D = $"../../sideRay"
@onready var downRay: RayCast2D = $"../../downRay"

var moveDirection = -1
var walkTime: float
var jumpChance: float
var jump := -350
var bounces := 0
var player: CharacterBody2D

func walk():
	player = get_tree().get_first_node_in_group("Player")
	walkTime = 1

func Enter():
	walk()

func Update(delta: float):
	if walkTime > 0:
		walkTime -= delta
	else:
		walk()

func PhysicsUpdate(_delta: float):
	if enemy:
		if enemy.position.y > 0:
			jump = 0
		else:
			jump = -300
		
		if not downRay.is_colliding():
			jumpChance = randi_range(0, 1)
			if enemy.is_on_floor() and bounces == 2:
				enemy.velocity.y = jump
				bounces = 0
			elif enemy.is_on_floor() and jumpChance == 1:
				enemy.velocity.y = jump
			elif enemy.is_on_floor() and jumpChance == 0:
				flipDirection()
			
		if sideRay.is_colliding():
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
