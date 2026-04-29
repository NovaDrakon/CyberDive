extends State
class_name BossAttack

@export var enemy: CharacterBody2D
@export var wait: float

@onready var attackDelay: Timer = $"../../attackDelay"
@onready var animationPlayer: AnimationPlayer = $"../../AnimationPlayer"

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
	attackDelay.start()
	
	if enemy.global_position.x > player.global_position.x:
		animationPlayer.play("SmashL")
	elif enemy.global_position.x < player.global_position.x:
		animationPlayer.play("SmashR")
	
	await get_tree().create_timer(wait).timeout
	Transitioned.emit(self, "Move")
