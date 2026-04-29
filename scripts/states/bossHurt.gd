extends State
class_name BossHurt

@export var enemy: CharacterBody2D
@export var hurtTime: float

@onready var animationPlayer: AnimationPlayer = $"../../AnimationPlayer"

var maxHealth: int
var damage := GlobalVars.swordDmg

func _ready() -> void:
	maxHealth = 120

func Enter():
	if maxHealth > 0:
		maxHealth -= damage
		animationPlayer.play("Hurt")
		await get_tree().create_timer(hurtTime).timeout
		Transitioned.emit(self, "Move")
		
	if maxHealth <= 0:
		enemy.queue_free()
