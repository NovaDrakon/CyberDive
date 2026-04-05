extends State
class_name TrojanChase

@export var enemy: CharacterBody2D
@export var moveSpeed: float
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func PhysicsUpdate(_delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 50:
		enemy.velocity = direction.normalized() * moveSpeed
	else:
		enemy.velocity = Vector2()
	
	if direction.length() > 90:
		Transitioned.emit(self, "Float")
