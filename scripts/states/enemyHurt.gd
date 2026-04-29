extends State
class_name EnemyHurt

@export var enemy: CharacterBody2D
@export var enemyType: EnemyType
@export var hurtTime: float

@onready var animatedSprite2D: AnimatedSprite2D = $"../../AnimatedSprite2D"

enum EnemyType {
	Malware,
	Ransomware,
	Worm,
	Trojan,
	Boss
}

var maxHealth: int
var damage := GlobalVars.swordDmg

func _ready() -> void:
	match enemyType:
		EnemyType.Malware:
			maxHealth = 50
		EnemyType.Ransomware:
			maxHealth = 40
		EnemyType.Worm:
			maxHealth = 30
		EnemyType.Trojan:
			maxHealth = 80
		EnemyType.Boss:
			maxHealth = 120

func Enter():
	if maxHealth > 0:
		maxHealth -= damage
		animatedSprite2D.play("Hurt")
		await get_tree().create_timer(hurtTime).timeout
		Transitioned.emit(self, "Move")
		
	if maxHealth <= 0:
		enemy.queue_free()
