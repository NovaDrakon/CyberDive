extends State
class_name BossChase

@export var enemy: CharacterBody2D
@export var moveSpeed: int

@export var chaseDistance: Vector2
@export var attackDistance: Vector2

@onready var downRay: RayCast2D = $"../../downRay"
@onready var attackDelay: Timer = $"../../attackDelay"

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func PhysicsUpdate(_delta: float):
	var distance = player.global_position - enemy.global_position
	
	if abs(distance) < chaseDistance and enemy.is_on_floor():
		if not downRay.is_colliding():
			enemy.velocity.x = 0
		enemy.velocity.x = moveSpeed * sign(distance.x)
	else:
		Transitioned.emit(self, "Move")
	
	if abs(distance) < attackDistance and enemy.is_on_floor():
		if attackDelay.is_stopped() and GlobalVars.health > 0:
			enemy.velocity.x = 0
			Transitioned.emit(self, "Attack")
		else:
			enemy.velocity.x = 0
