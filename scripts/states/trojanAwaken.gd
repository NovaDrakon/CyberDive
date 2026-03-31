extends State
class_name Awaken

@export var enemy: CharacterBody2D

@onready var animatedSprite2D: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var folderRayL: RayCast2D = $"../../folderRayL"
@onready var folderRayR: RayCast2D = $"../../folderRayR"

var inRange = false

func checkDistance():
	if folderRayL.is_colliding() or folderRayR.is_colliding():
		inRange = true

func Enter():
	checkDistance()

func Update(_delta: float):
	if enemy:
		checkDistance()

		if inRange && Input.is_action_just_pressed("Interact"):
			animatedSprite2D.play("Awaken")
			inRange = false
			folderRayL.set_enabled(false)
			folderRayR.set_enabled(false)
			await get_tree().create_timer(0.75).timeout
			Transitioned.emit(self, "Float")

func PhysicsUpdate(_delta: float):
	pass
