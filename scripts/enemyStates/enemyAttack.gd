extends State
class_name EnemyAttack

@export var weapon: Area2D
@export var wait: float
@export var weaponType: WeaponType

@onready var attackDelay: Timer = $"../../attackDelay"

enum WeaponType {
	Melee,
	Ranged
}

func Enter():
	attackDelay.start()
	weapon.show()
	
	match weaponType:
		WeaponType.Melee:
			await get_tree().create_timer(wait).timeout
			weapon.hide()
			Transitioned.emit(self, "Move")
		
		WeaponType.Ranged:
			weapon.global_position.x += 100
			await get_tree().create_timer(wait).timeout
			weapon.hide()
			weapon.global_position.x -= 100
			Transitioned.emit(self, "Move")
