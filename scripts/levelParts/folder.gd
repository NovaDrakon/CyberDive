extends Area2D

@onready var mainCharacter: CharacterBody2D = $"../mainCharacter"
@onready var gameCamera: Camera2D = $"../mainCharacter/gameCamera"
@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var topLeftMarker: Marker2D = $topLeft
@onready var bottomRightMarker: Marker2D = $bottomRight

var inRange = false
var topLeft: Vector2
var bottomRight: Vector2

func _ready() -> void:
	topLeft = topLeftMarker.get_global_position()
	bottomRight = bottomRightMarker.get_global_position()
	print(topLeft)
	print(bottomRight)

func _process(_delta: float) -> void:
	if inRange && Input.is_action_just_pressed("Interact"):
		mainCharacter.set_position($Destination.global_position)
		fixCamera()

func _on_body_entered(_body: Node2D) -> void:
	animatedSprite2D.show()
	inRange = true

func _on_body_exited(_body: Node2D) -> void:
	animatedSprite2D.hide()
	inRange = false

func fixCamera():
	gameCamera.limit_top = int(topLeft.y)
	gameCamera.limit_left = int(topLeft.x)
	gameCamera.limit_bottom = int(bottomRight.y)
	gameCamera.limit_right = int(bottomRight.x)
