extends State
class_name EnemyChase

@export var enemy: CharacterBody2D
@export var moveSpeed: int

@export var chaseDistance: int
@export var walkDistance: int

@onready var downRay: RayCast2D = $"../../downRay"
@onready var attackDelay: Timer = $"../../attackDelay"

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func PhysicsUpdate(_delta: float):
	var directionX = player.global_position.x - enemy.global_position.x
	
	if abs(directionX) > chaseDistance and enemy.is_on_floor():
		if not downRay.is_colliding():
			enemy.velocity.x = 0
		enemy.velocity.x = moveSpeed * sign(directionX)
		
	elif abs(directionX) < chaseDistance and enemy.is_on_floor():
		if attackDelay.is_stopped() and GlobalVars.health > 0:
			enemy.velocity.x = 0
			Transitioned.emit(self, "Attack")
		else:
			enemy.velocity.x = 0
	
	if abs(directionX) > walkDistance:
		Transitioned.emit(self, "Walk")
