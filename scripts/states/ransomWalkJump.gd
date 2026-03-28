extends State
class_name WalkJump

@export var enemy: CharacterBody2D
@export var moveSpeed := 80.0

@onready var sideRay: RayCast2D = $"../../sideRay"
@onready var downRay: RayCast2D = $"../../downRay"

var moveDirection = -1
var wanderTime: float
var jumpChance: float
var jump := -300
var bounces := 0

func walk():
	wanderTime = 1

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
			jumpChance = randi_range(0, 1)
			if enemy.is_on_floor() and bounces == 3:
				enemy.velocity.y = jump
				bounces = 0
			elif enemy.is_on_floor() and jumpChance == 0:
				flipDirection()
			elif enemy.is_on_floor() and jumpChance == 1:
				enemy.velocity.y = jump
			
		if sideRay.is_colliding():
			flipDirection()
			
		enemy.velocity.x = moveSpeed * moveDirection

func flipDirection():
	if moveDirection == 1:
		moveDirection = -1
		sideRay.set_rotation_degrees(90)
	else:
		moveDirection = 1
		sideRay.set_rotation_degrees(270)
	downRay.scale.x = -downRay.scale.x
	bounces += 1
