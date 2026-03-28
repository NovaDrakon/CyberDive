extends AnimationPlayer

@onready var trojan: TrojanEnemy = $"../../Enemies/Trojan"

func _process(_delta: float) -> void:
	if trojan.velocity.x != 0:
		self.play("Move")
		await get_tree().create_timer(2.25).timeout
		self.set_active(false)
