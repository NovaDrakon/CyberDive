extends Area2D

@onready var mainCharacter: CharacterBody2D = $"../mainCharacter"
@onready var gameCamera: Camera2D = $"../mainCharacter/gameCamera"
@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D

var inRange = false

func _process(_delta: float) -> void:
	if inRange && Input.is_action_just_pressed("Interact"):
		mainCharacter.set_position($Destination.global_position)

func _on_body_entered(_body: Node2D) -> void:
	animatedSprite2D.show()
	inRange = true

func _on_body_exited(_body: Node2D) -> void:
	animatedSprite2D.hide()
	inRange = false

func fixCamera(left, right, top, bottom):
	gameCamera.limit_left = left
	gameCamera.limit_right = right
	gameCamera.limit_top = top
	gameCamera.limit_bottom = bottom
