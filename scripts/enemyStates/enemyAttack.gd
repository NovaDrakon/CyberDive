extends State
class_name EnemyAttack

@export var weapon: Area2D
@export var wait: float

@onready var attackDelay: Timer = $"../../attackDelay"

func Enter():
	attackDelay.start()
	weapon.show()
	await get_tree().create_timer(wait).timeout
	weapon.hide()
	Transitioned.emit(self, "Move")
